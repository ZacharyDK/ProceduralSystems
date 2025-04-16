local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local tile_lightening = 28
procedural_tile_offset = 40
--- max tile layer on nauvis is 33(nuclear_ground), this should generally be above that. Conctrete starts at 100, which this should not be above

local rugged_stone_sound = sound_variations("__space-age__/sound/walking/rugged-stone", 10, 0.8)
local rocky_stone_sound = sound_variations("__space-age__/sound/walking/rocky-stone", 10, 0.8)
local soft_sand_sound = sound_variations("__space-age__/sound/walking/soft-sand", 10, 1)
local warm_stone_sound = sound_variations("__space-age__/sound/walking/warm-stone", 10, 1)

data:extend(
{
  {
    type = "item-subgroup",
    name = "procedural-tiles",
    group = "tiles",
    order = "zda"
  },
})


local procedural_tile_base = 
{

  jagged_ground = 
  {
    type = "tile",
    name = "procedural-volcanic-jagged-ground",
    subgroup = "procedural-tiles",
    order = "a-k",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_jagged_ground_range"
    },
    layer = procedural_tile_offset + 5,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-jagged-ground.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rocky_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 30, b = tile_lightening+ 20},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 2,
    absorptions_per_second = tile_pollution.lava,
  },
    ----------- "SHALLOW" LAVA
  --[[  
  shallow_lava = 
  {
    type = "tile",
    name = "procedural-lava",
    subgroup = "procedural-tiles",
    order = "a-b",
    collision_mask = tile_collision_masks.lava(),
    autoplace =
    {
      probability_expression = "max(procedural_lava_lowland_range, procedural_lava_mountains_range)"
    },
    effect = "procedural-lava-2",
    --fluid = "ultradense-lava",
    effect_color = { 167, 59, 27 },
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.lava_particle_tints,
    destroys_dropped_items = true,
    default_destroyed_dropped_item_trigger = destroyed_item_trigger,
    layer = 6,
    layer_group = "water-overlay",
    sprite_usage_surface = "any",
    variants = tile_variations_template(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/lava.png",
      "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    allowed_neighbors={"procedural-lava-hot"},
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = data.raw.tile["water"].walking_sound,
    map_color = {r = 30, g = 49, b = 150},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    trigger_effect = tile_trigger_effects.hot_lava_trigger_effect(),
    default_cover_tile = "foundation",
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/lava", 10, 0.5 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "cosine", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },
    ----------- "DEEP" LAVA
  deep_lava =
  {
    type = "tile",
    name = "procedural-lava-hot",
    order = "a-a",
    subgroup = "procedural-tiles",
    collision_mask = tile_collision_masks.lava(),
    autoplace =
    {
      probability_expression = "max(procedural_lava_hot_lowland_range, procedural_lava_hot_mountains_range)"
    },
    effect = "procedural-lava",
    --fluid = "ultradense-lava",
    effect_color = { 167, 59, 27 },
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.lava_particle_tints,
    destroys_dropped_items = true,
    default_destroyed_dropped_item_trigger = destroyed_item_trigger,
    layer = 5,
    layer_group = "water",
    sprite_usage_surface = "any",
    variants =
      {
        main =
        {
          {
            picture = "__procedural-systems__/graphics/terrain/desat-rocky-1/lava-hot.png",
            count = 1,
            scale = 0.5,
            size = 1
          }
        },
      empty_transitions=true,
    },
    allowed_neighbors={"procedural-lava"},
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = data.raw.tile["water"].walking_sound,
    map_color = {r = 57, g = 138, b = 255},
    absorptions_per_second = tile_pollution.lava,
    default_cover_tile = "foundation",
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/magma", 10, 0.7 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "cosine", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },
  --]]
  ----------- WARM CRACKS
  
  cracks_hot = 
  {
    type = "tile",
    name = "procedural-volcanic-cracks-hot",
    subgroup = "procedural-tiles",
    order = "a-c",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_cracks_hot_range"
    },
    layer = procedural_tile_offset + 2,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions_and_light(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-cracks-hot.png",
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-cracks-hot-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = warm_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 5, b = tile_lightening+ -5}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = .6,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    default_cover_tile = "foundation"
  },
  cracks_warm = 
  {
    type = "tile",
    name = "procedural-volcanic-cracks-warm",
    subgroup = "procedural-tiles",
    order = "a-d",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_cracks_warm_range"
    },
    layer = procedural_tile_offset + 3,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions_and_light(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-cracks-warm.png",
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-cracks-warm-lightmap1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = warm_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 10, b = tile_lightening+ 5},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },
    ----------- COLD CRACKS

  cracks = 
  {
    type = "tile",
    name = "procedural-volcanic-cracks",
    subgroup = "procedural-tiles",
    order = "a-e",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_cracks_cold_range"
    },
    layer = procedural_tile_offset + 4,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
        "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-cracks.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rocky_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 15, g = tile_lightening+ 14, b = tile_lightening+ 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },

    ----------- COLD LAVA FLAT
  folds_flat = 
  {
    type = "tile",
    name = "procedural-volcanic-folds-flat",
    subgroup = "procedural-tiles",
    order = "a-j",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_folds_flat_range"
    },
    layer = procedural_tile_offset + 16,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-folds-flat.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rugged_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r =tile_lightening+ 16, g = tile_lightening+ 15, b = tile_lightening+ 16}, -- changed from (8 7 8) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 2,
    absorptions_per_second = tile_pollution.lava

  },
    ----------- ASH SAND
  ash_light = ---broken???
  {
    type = "tile",
    name = "procedural-volcanic-ash-light",
    subgroup = "procedural-tiles",
    order = "a-o",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_ash_light_range"
    },
    layer = procedural_tile_offset + 14,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-ash-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    map_color = {r = tile_lightening+ 25, g = tile_lightening+ 25, b = tile_lightening+ 25}, -- changed from (30 30 30) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    can_be_part_of_blueprint = false,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },

  ash_dark = 
  {
    type = "tile",
    name = "procedural-volcanic-ash-dark",
    subgroup = "procedural-tiles",
    order = "a-p",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_ash_dark_range"
    },
    layer = procedural_tile_offset + 13,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-ash-dark.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    map_color = {r = tile_lightening+ 25, g = tile_lightening+ 25, b = tile_lightening+ 25}, -- changed from (30 30 30) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
    ----------- ASH SAND
  ash_flat = 
  {
    type = "tile",
    name = "procedural-volcanic-ash-flats",
    subgroup = "procedural-tiles",
    order = "a-o",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_ash_flats_range"
    },
    layer = procedural_tile_offset + 12,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-ash-flats.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    map_color = {r = tile_lightening+ 25, g = tile_lightening+ 25, b = tile_lightening+ 25}, -- changed from (30 30 30) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
    ----------- PUMICE
  pumice = 
  {
    type = "tile",
    name = "procedural-volcanic-pumice-stones",
    subgroup = "procedural-tiles",
    order = "a-n",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_pumice_stones_range"
    },
    layer = procedural_tile_offset + 15,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-pumice-stones.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rocky_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 18, g = tile_lightening+ 18, b = tile_lightening+ 18}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },
    ----------- SMOOTH STONE
  smooth_stone = 
  {
    type = "tile",
    name = "procedural-volcanic-smooth-stone",
    subgroup = "procedural-tiles",
    order = "a-g",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_smooth_stone_range"
    },
    layer = procedural_tile_offset + 1,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-smooth-stone.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rocky_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 22, g = tile_lightening+ 22, b = tile_lightening+ 30}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava

  },
    ----------- SMOOTH STONE WARM
  smooth_stone_warm = 
  {
    type = "tile",
    name = "procedural-smooth-stone-warm",
    subgroup = "procedural-tiles",
    order = "a-f",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_smooth_stone_warm_range"
    },
    layer = procedural_tile_offset,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions_and_light(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-smooth-stone-warm.png",
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-smooth-stone-warm-lightmap.png",

      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = warm_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 26, g = tile_lightening+ 22, b = tile_lightening+ 22}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,

  },
  ash_cracks=
  {
    type = "tile",
    name = "procedural-ash-cracks",
    subgroup = "procedural-tiles",
    order = "a-r",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_ash_cracks_range"
    },
    layer = procedural_tile_offset + 6,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-ash-cracks.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rugged_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 39, g = tile_lightening+ 39, b = tile_lightening+ 39}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },

  folds=
  {
    type = "tile",
    name = "procedural-folds",
    subgroup = "procedural-tiles",
    order = "a-i",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_folds_range"
    },
    layer = procedural_tile_offset + 18,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-folds.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rugged_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 15, g = tile_lightening+ 15, b = tile_lightening+ 15}, -- changed from (2 2 2) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 2,
    absorptions_per_second = tile_pollution.lava,
  },
  folds_warm=
  {
    type = "tile",
    name = "procedural-folds-warm",
    subgroup = "procedural-tiles",
    order = "a-h",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_folds_warm_range"
    },
    layer = procedural_tile_offset + 17,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions_and_light(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-folds-warm.png",
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-folds-warm-lightmap.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = rocky_stone_sound,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    map_color = {r = tile_lightening+ 37, g = tile_lightening+ 17, b = tile_lightening+ 17},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
  soil_dark=
  {
    type = "tile",
    name = "procedural-soil-dark",
    subgroup = "procedural-tiles",
    order = "a-l",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_soil_dark_range",
    },
    layer = procedural_tile_offset + 7,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-soil-dark.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    -- tint={0.8, 0.75, 0.8},
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    map_color = {r = tile_lightening+ 20, g = tile_lightening+ 23, b = tile_lightening+ 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
  soil_light = 
  {
    type = "tile",
    name = "procedural-soil-light",
    subgroup = "procedural-tiles",
    order = "a-m",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_soil_light_range"
    },
    layer = procedural_tile_offset + 8,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-soil-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    -- tint={0.6, 0.55, 0.55},
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 20, b = tile_lightening+ 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
  ash_soil = 
  {
    type = "tile",
    name = "procedural-ash-soil",
    subgroup = "procedural-tiles",
    order = "a-q",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_ash_soil_range"
    },
    layer = procedural_tile_offset + 11,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-ash-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = soft_sand_sound,
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    map_color = {r = tile_lightening+ 20, g = tile_lightening+ 20, b = tile_lightening+ 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
}


local stone_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-stone.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}
local sand_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-sand.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}

local lava_patch =
{
  filename = "__procedural-systems__/graphics/terrain/water-transitions/lava-patch.png",
  scale = 0.5,
  width = 64,
  height = 64
}

local lava_stone_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = lava_tile_type_names,
    transition_group = lava_transition_group_id,
    spritesheet = "__procedural-systems__/graphics/terrain/water-transitions/lava-stone.png",
    lightmap_layout = { spritesheet = "__procedural-systems__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    lightmap_layout = { spritesheet = "__procedural-systems__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}

local lava_stone_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = lava_patch
  },

  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-cold-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  },

  {
    transition_group1 = default_transition_group_id,
    transition_group2 = lava_transition_group_id,

    spritesheet = "__procedural-systems__/graphics/terrain/water-transitions/lava-stone-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = lava_patch
  },

  {
    transition_group1 = lava_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  }
}

local lava_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  overlay_layer_group = "zero",
  apply_effect_color_to_overlay = true,
  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-out-of-map-transition-tintable.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  background_enabled = false,

  apply_waving_effect_on_masks = true,
  waving_effect_time_scale = 0.005,
  mask_layout =
  {
    spritesheet = "__base__/graphics/terrain/masks/water-edge-transition.png",
    count = 1,
    double_side_count = 0,
    scale = 0.5,
    outer_corner_x = 64,
    side_x = 128,
    u_transition_x = 192,
    o_transition_x = 256,
    y = 0
  }
}

local destroyed_item_trigger =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    source_effects =
    {
      type = "create-trivial-smoke",
      smoke_name = "smoke",
      offset_deviation = {{-0.1, -0.1}, {0.1, 0.1}},
      starting_frame_deviation = 5
    }
  }
}

--procedural_tiles_util.lava_to_out_of_map_transition = lava_to_out_of_map_transition
--procedural_tiles_util.lava_stone_transitions_between_transitions = lava_stone_transitions_between_transitions

--define ranges for all tilesets. Having these as thier own expressions helps with debugging and also modifying things like decorative placement
data:extend
{
  {
    type = "noise-expression",
    name = "procedural_metal_tile",
    expression = "max(0, 0.3)"
  },
  ---- LAVA
  {
    type = "noise-expression",
    name ="procedural_lava_spawn_excluder",
    expression = "distance > 10"
  },
  {
    type = "noise-expression",
    name ="procedural_lava_lowland_range", -- lower weight than lava_hot_lowland_range
    expression = "100 * min(procedural_lowland_biome * lava_spawn_excluder\z
                            * range_select_base(procedural_elev, -5000, 0, 1, -1000, 1),\z
                            100 * (1 - procedural_metal_tile))"
  },
  {
    type = "noise-expression",
    name ="procedural_lava_mountains_range",
    expression = "1100 * range_select_base(procedural_mountain_lava_spots, 0.2, 10, 1, 0, 1)"
  },
  {
    type = "noise-expression",
    name ="procedural_lava_hot_lowland_range", -- higher weight than lava_lowland_range. Max elevation is variable so coastline is not always worm or hot.
    expression = "200 * min(procedural_lowland_biome * lava_spawn_excluder\z
                            * range_select_base(procedural_elev, -5000, min(0, 5 * (-2 + 4 * procedural_rock_noise)), 1, -1000, 1),\z
                            100 * (1 - procedural_metal_tile))"
  },
  {
    type = "noise-expression",
    name ="procedural_lava_hot_mountains_range",
    expression = "1000 * range_select_base(procedural_mountain_lava_spots, 0.05, 0.3, 1, 0, 1)"
  },

  ---- lowland
  -- aux controls rocky outcrop pounts.
  -- high-medium aux is cracks
  -- low aux is smooth
  -- hotter is lower elevation
  {
    type = "noise-expression",
    name ="procedural_volcanic_cracks_hot_range",
    expression = "procedural_lowland_biome * range_select_base(procedural_elev, 0, 8, 1, 0, 20)"
  },
  {
    type = "noise-expression",
    name ="procedural_volcanic_cracks_warm_range",
    expression = "procedural_lowland_biome * range_select_base(procedural_elev, 8, 22, 1, 0, 5)\z
                  + (aux - 0.05)\z
                  + 50000 * procedural_metal_tile"
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_cracks_cold_range",
    expression = "(0.5 - procedural_ashlands_biome) * range_select_base(procedural_elev, 20, 100, 1, 0, 1)\z
                  + (aux - 0.3)"
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_smooth_stone_warm_range",
    expression = "procedural_lowland_biome * range_select_base(procedural_elev, 8, 20, 1, 0, 5)\z
                  - (aux - 0.05)\z
                  + 50000 * procedural_metal_tile"
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_smooth_stone_range",
    expression = "(0.5 - procedural_ashlands_biome) * range_select_base(procedural_elev, 20, 100, 1, 0, 1)\z
                  - (aux - 0.3)"
  },

  -- MOUNTAINS
  -- lumps (jagged/cold folded) are on high aux.
  -- depression channels (hot folded, soil) are low aux.
  -- folded is higher up the mountain.
  -- hot folded is closest to the center.
  -- jagged ground identifies rocky peacks and resource patches.
  -- flat folded ix between extremes
  {
    type = "noise-expression",
    name = "procedural_volcanic_folds_flat_range",
    expression = "2 * (procedural_mountains_biome - 0.5) - 0.15 * procedural__mountain_volcano_spots"
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_folds_range",
    expression = "2 * (procedural_mountains_biome - 0.5) + (aux - 0.5) + 0.5 * (procedural__mountain_volcano_spots - 0.1)"

  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_folds_warm_range",
    expression = "2 * (procedural_mountains_biome - 0.5) + 3 * (procedural__mountain_volcano_spots - 0.85) - 2 * (aux - 0.5)"
  },
  {
    type = "noise-expression",
    name ="procedural_volcanic_jagged_ground_range",
    -- volcano peak circle is expected to be 1020 to 1030, The cliff is at 1020 --0.01 was procedural stone region
    expression = "5 * min(10, max(0.01 + 0.2,\z 
                                  range_select_base(procedural_elev, 1010, 2000, 2, -10, 1) + 3 * (aux - 0.5)))"
  },
  {
    type = "noise-expression",
    name ="procedural_volcanic_soil_light_range_mountains",
    expression = "min(0.8, 4 * (procedural_mountains_biome - 0.25)) - 0.35 * procedural__mountain_volcano_spots - 3 * (aux - 0.2)"
  },
  {
    type = "noise-expression",
    name ="procedural_volcanic_soil_dark_range_mountains",
    expression = "min(0.8, 4 * (procedural_mountains_biome - 0.25)) - 0.35 * procedural__mountain_volcano_spots - 1 * (aux - 0.5)"
  },

  -- Ashlands
  -- Low aux low moisture is ash
  -- Low aux high moisture is trees & grass.
  -- High aux low moisture is chimneys and rocks.
  -- High aux high moisture is rocks with pita
  {
    type = "noise-expression",
    name = "procedural_volcanic_ash_flats_range",
    expression = "2 * (procedural_ashlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_ash_light_range",
    expression = "2 * (procedural_ashlands_biome - 0.5)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_ash_dark_range",
    expression = "min(1, 4 * (procedural_ashlands_biome - 0.25))\z
                  + max(-1.5 * (aux - 0.25),\z
                        0.01 - 1.5 * abs(aux - 0.5) - 1.5 * (moisture - 0.66))"
    -- the last part is an axtra line blending ash cracks to light ash
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_pumice_stones_range",
    expression = "2 * (procedural_ashlands_biome - 0.5)\z
                  + 1.5 * (aux - 0.5)\z
                  + 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_ash_cracks_range",
    expression = "min(1, 4 * (procedural_ashlands_biome - 0.25))\z
                  + 1.5 * (aux - 0.5)\z
                  - 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_ash_soil_range",
    expression = "2 * (procedural_ashlands_biome - 0.5)"
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_soil_light_range_ashlands",
    expression = "2 * (procedural_ashlands_biome - 0.5)\z
                  + 1.5 * (moisture - 0.8)"
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_soil_dark_range_ashlands",
    expression = "2 * (procedural_ashlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  + 1.5 * (moisture - 0.8)"
  },

  -- COMBINE SHARED
  {
    type = "noise-expression",
    name = "procedural_volcanic_soil_light_range",
    expression = "max(procedural_volcanic_soil_light_range_mountains, procedural_volcanic_soil_light_range_ashlands, 10 * (0.1 + 0.2))" --0.1 was something else. sulfuric-geyser-patchy
  },
  {
    type = "noise-expression",
    name = "procedural_volcanic_soil_dark_range",
    expression = "max(procedural_volcanic_soil_dark_range_mountains, procedural_volcanic_soil_dark_range_ashlands)"
  },
  --Not sure what to do with this.
  {
    type = "tile",
    name = "procedural-volcanic-cracks-hot",
    subgroup = "procedural-tiles",
    order = "a-c",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "procedural_volcanic_cracks_hot_range"
    },
    layer = procedural_tile_offset + 2,
    sprite_usage_surface = "any",
    variants = tile_variations_template_with_transitions_and_light(
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-cracks-hot.png",
      "__procedural-systems__/graphics/terrain/desat-rocky-1/volcanic-cracks-hot-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = data.raw.tile["dirt-1"].walking_sound,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 5, b = tile_lightening+ -5}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = .6,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },

}
  ----------- CLIFF TILE




--TODO figure out procedural transitions.
--

--table.insert(lava_tile_type_names, "procedural-lava-hot")
--table.insert(lava_tile_type_names, "procedural-lava")

-- add lava tiles to water tiles (for tiles that doesn't have defined transitions to lava)
--table.insert(water_tile_type_names, "procedural-lava-hot")
--table.insert(water_tile_type_names, "procedural-lava")

data:extend(
{
  {
    type = "tile-effect",
    name = "procedural-lava",
    shader = "water",
    water =
    {
      shader_variation = "lava",
      textures =
      {
        {
          filename = "__procedural-systems__/graphics/terrain/desat-rocky-1/lava-textures/lava-noise-texture.png",
          width = 512,
          height = 512
        },
        {
          filename = "__procedural-systems__/graphics/terrain/desat-rocky-1/lava-textures/lava.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      animation_speed = 1.5,
      animation_scale = { 0.7, 0.7 },
      tick_scale = 1,

      specular_lightness = { 22, 51, 17},
      foam_color = { 59, 30, 9},
      foam_color_multiplier = 1.3,

      dark_threshold = { 0.755, 0.755 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.889, 0.291 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16
    }
  },
  {
    type = "tile-effect",
    name = "procedural-lava-2",
    shader = "water",
    water =
    {
      shader_variation = "lava",
      textures =
      {
        {
          filename = "__procedural-systems__/graphics/terrain/desat-rocky-1/lava-textures/lava-noise-texture.png",
          width = 512,
          height = 512
        },
        {
          filename = "__procedural-systems__/graphics/terrain/desat-rocky-1/lava-textures/coastal-lava.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      animation_speed = 1.5,
      animation_scale = { 0.75, 0.75 },
      tick_scale = 1,

      specular_lightness = { 30, 48, 22 },
      foam_color = { 73, 5, 5 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.755, 0.755 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.889, 0.291 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16
    }
  }
})

--log(serpent.block("Tiles:"))
--log(serpent.block(procedural_tile_base))

local val = {}
val.get_tiles = function()
  return procedural_tile_base
end
return val
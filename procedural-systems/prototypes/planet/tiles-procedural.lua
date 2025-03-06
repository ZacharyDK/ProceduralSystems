local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout
local tile_base = require("__procedural-systems__.prototypes.planet.tiles-procedural-base")
local tile_trigger_effects = require("__base__/prototypes/tile/tile-trigger-effects")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_pollution = require("__base__/prototypes/tile/tile-pollution-values")

water_tile_type_names = water_tile_type_names or {} --Global variable that may be initialized???

local water_to_out_of_map_transition =
{
  to_tiles = {},
  transition_group = 2,

  overlay_layer_group = "zero",
  apply_effect_color_to_overlay = true,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-out-of-map-transition-tintable.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  background_enabled = false,

  apply_waving_effect_on_masks = true,
  waving_effect_time_scale = 0.15 * 0.09,
  mask_enabled = true,
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

--Does not include water or lava
local function create_tinted_tile_set(in_tile_table,in_name_postfix,in_tint)
    local out = table.deepcopy(in_tile_table)
    --out = in_tile_table --I don't think deepcopy is working.

    for k,v in pairs(out) do
        v.tint = in_tint
        v.name = v.name .. "-" .. in_name_postfix
    end

    return out
end

local function extend_tinted_tiles(in_tinted_tile_table)
    for k,v in pairs(in_tinted_tile_table) do
        data:extend{v}
    end
end

--to do, figure out proper syntax for deepcopy...

local function create_shallow_water_tinted_tile_set(in_name_postfix,in_tint,in_map_color,in_fluid,in_probability_expression) -- probability_expression = "water_base(-2, 200)"
return {
  type = "tile",
  name = "water-"..in_name_postfix,
  order = "k[procedural]-c[" .. in_name_postfix .. "]",
  tint = in_tint,
  collision_mask = tile_collision_masks.water(), --tile_collision_masks.oil_ocean_deep(), --
  autoplace = {probability_expression = in_probability_expression},
  lowland_fog = true,
  --effect_color = {r = 255, b = 255, g = 255, a = 0.1},
  particle_tints = 
  { 
    primary = in_tint,
    secondary = in_tint,
  },
  layer = 1,
  layer_group = "water-overlay",
  variants =
  {
    main =
    {
      {
        picture = "__procedural-systems__/graphics/terrain/water-desat/water-1.png",
        count = 1,
        scale = 0.5,
        size = 1
      },
      {
        picture = "__procedural-systems__/graphics/terrain/water-desat/water-2.png",
        count = 1,
        scale = 0.5,
        size = 2
      },
      {
        picture = "__procedural-systems__/graphics/terrain/water-desat/water-4.png",
        count = 1,
        scale = 0.5,
        size = 4
      },

    },
    empty_transitions=true,
  },
  transitions = {water_to_out_of_map_transition},
  transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
  walking_sound = sound_variations("__base__/sound/walking/shallow-water", 7, 1, volume_multiplier("main-menu", 1.5)),
  landing_steps_sound = sound_variations("__base__/sound/walking/shallow-water", 7, 1, volume_multiplier("main-menu", 2.9)),
  driving_sound = 
  {
    sound =
    {
      filename = "__base__/sound/driving/vehicle-surface-water-shallow.ogg", volume = 0.8,
      advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
    },
    fade_ticks = 6
  },
  map_color = in_map_color,
  walking_speed_modifier = 0.8,
  vehicle_friction_modifier = 8.0,
  trigger_effect = tile_trigger_effects.water_trigger_effect(),
  default_cover_tile = "landfill",
  fluid = in_fluid,
  ambient_sounds = 
  {
    {
      sound =
      {
        variations = sound_variations("__base__/sound/world/water/waterlap", 10, 0.4),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 8
    },
    {
      sound =
        {
          variations = sound_variations("__space-age__/sound/world/tiles/rain-on-water", 10, 0.2),
          advanced_volume_control =
          {
            fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
          }
        },
        min_entity_count = 10,
        max_entity_count = 25,
        entity_to_sound_ratio = 0.1,
        average_pause_seconds = 5,
    }
  },
}
end

local function create_deep_water_tinted_tile_set(in_name_postfix,in_tint,in_map_color,in_merge_transition_tile,in_fluid,in_probability_expression)
return   {
  name = "deepwater-" .. in_name_postfix,
  type = "tile",
  tint = in_tint,
  order = "e[procedural]-a[" .. in_name_postfix .. "]",
  subgroup = "nauvis-tiles",
  transition_merges_with_tile = in_merge_transition_tile,
  collision_mask = tile_collision_masks.water(),
  fluid = in_fluid,
  autoplace = {probability_expression = in_probability_expression},
  effect = "water",
  --effect_color = {0.135, 0.507, 0.583},--{ 23, 111, 129 }, -- { 30, 76, 94 }
  --effect_color = {r = 255, b = 255, g = 255, a = 0.1},
  effect_color = in_tint,
  effect_color_secondary = { 45, 68, 25 },
  particle_tints = 
  { 
    primary = in_tint,
    secondary = in_tint,
  },
  layer_group = "water",
  layer = 3,
  variants =
  {
    main =
    {
      {
        picture = "__procedural-systems__/graphics/terrain/water-desat/deepwater-1.png",
        count = 1,
        scale = 0.5,
        size = 1
      },
      {
        picture = "__procedural-systems__/graphics/terrain/water-desat/deepwater-2.png",
        count = 1,
        scale = 0.5,
        size = 2
      },
      {
        picture = "__procedural-systems__/graphics/terrain/water-desat/deepwater-4.png",
        count = 1,
        scale = 0.5,
        size = 4
      }
    },
    empty_transitions = true
  },
  --transitions = { deepwater_out_of_map_transition },
  --transitions_between_transitions = deepwater_transitions_between_transitions,
  allowed_neighbors = {in_merge_transition_tile},
  map_color=in_map_color,
  absorptions_per_second = tile_pollution.water,

  trigger_effect = tile_trigger_effects.water_trigger_effect(),

  default_cover_tile = "landfill",

  ambient_sounds =
  {
    sound =
    {
      variations = sound_variations("__base__/sound/world/water/waterlap", 10, 0.4 ),
      advanced_volume_control =
      {
        fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
      }
    },
    radius = 7.5,
    min_entity_count = 10,
    max_entity_count = 30,
    entity_to_sound_ratio = 0.1,
    average_pause_seconds = 3
  }
}
end


local function extend_water_tiles(in_shallow_water_tinted,in_deep_water_tinted)

  table.insert(water_tile_type_names, in_shallow_water_tinted.name)
  table.insert(water_tile_type_names, in_deep_water_tinted.name)

  data:extend{in_shallow_water_tinted}
  data:extend{in_deep_water_tinted} 

  table.insert(data.raw.item.landfill.place_as_tile.tile_condition, in_shallow_water_tinted.name)
  table.insert(data.raw.item.landfill.place_as_tile.tile_condition, in_deep_water_tinted.name)

end

local alpha_tile_set = create_tinted_tile_set(tile_base.get_tiles(),"alpha",{r = 250,g = 100, b = 100}) --rgb(255, 128, 128)
extend_tinted_tiles(alpha_tile_set)

--local alpha_shallow_water_tiles = create_shallow_water_tinted_tile_set("alpha", {r = 250,g = 100, b = 100}, {r = 100,g = 20, b = 20},"water","max(procedural_lava_lowland_range, procedural_lava_mountains_range)") --repurpose vulcanus lava code Not clear why no water...
--local alpha_deep_water_tiles = create_deep_water_tinted_tile_set("alpha", {r = 250,g = 100, b = 100}, {r = 100,g = 20, b = 20},"water-alpha","water","max(procedural_lava_hot_lowland_range, procedural_lava_hot_mountains_range)")

local alpha_shallow_water_tiles = create_shallow_water_tinted_tile_set("alpha", {r = 250,g = 100, b = 100}, {r = 100,g = 20, b = 20},"water","water_base(-2, 17000)") --repurpose vulcanus lava code
local alpha_deep_water_tiles = create_deep_water_tinted_tile_set("alpha", {r = 250,g = 100, b = 100}, {r = 100,g = 20, b = 20},"water-alpha","water","water_base(-2, 17000)")

extend_water_tiles(alpha_shallow_water_tiles,alpha_deep_water_tiles)

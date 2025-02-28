require ("util")
require ("__base__.prototypes.entity.pipecovers")
require ("circuit-connector-sprites")
require ("__base__.prototypes.entity.assemblerpipes")

local simulations = require("__base__.prototypes.factoriopedia-simulations")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

function make_4way_animation_from_spritesheet(animation)
    local function make_animation_layer(idx, anim)
      local frame_count = anim.frame_count or 1
      local start_frame = frame_count * idx
      local x = 0
      local y = 0
      if anim.line_length then
        y = anim.height * math.floor(start_frame / (anim.line_length or 1))
        if anim.line_length > frame_count then
          error("single line must not contain animations for multiple directions when line_lenght is specified: " .. anim.filename)
        end
      else
        x = idx * anim.width
        
      end
      return
      {
        filename = anim.filename,
        priority = anim.priority or "high",
        flags = anim.flags,
        x = x,
        y = y,
        width = anim.width,
        height = anim.height,
        frame_count = anim.frame_count,
        line_length = anim.line_length,
        repeat_count = anim.repeat_count,
        shift = anim.shift,
        draw_as_shadow = anim.draw_as_shadow,
        draw_as_glow = anim.draw_as_glow,
        draw_as_light = anim.draw_as_light,
        apply_runtime_tint = anim.apply_runtime_tint,
        tint_as_overlay = anim.tint_as_overlay or false,
        animation_speed = anim.animation_speed,
        scale = anim.scale or 1,
        tint = anim.tint,
        blend_mode = anim.blend_mode,
        load_in_minimal_mode = anim.load_in_minimal_mode,
        premul_alpha = anim.premul_alpha,
        generate_sdf = anim.generate_sdf
      }
    end
  
    local function make_animation(idx)
      if animation.layers then
        local tab = { layers = {} }
        for k,v in ipairs(animation.layers) do
          table.insert(tab.layers, make_animation_layer(idx, v))
        end
        return tab
      else
        return make_animation_layer(idx, animation)
      end
    end
  
    return
    {
      north = make_animation(0),
      east = make_animation(1),
      south = make_animation(2),
      west = make_animation(3)
    }
end

function boiler_reflection()
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/boiler/boiler-reflection.png",
      priority = "extra-high",
      width = 28,
      height = 32,
      shift = util.by_pixel(5, 30),
      variation_count = 4,
      scale = 5
    },
    rotate = false,
    orientation_to_variation = true
  }
end

data:extend(
{
    {
        type = "assembling-machine",
        name = "froth-floatation-plant",
        icon = "__proceduralsystems__/graphics/icons/froth-floatator.png",
        flags = {"placeable-neutral","placeable-player", "player-creation"},
        minable = {mining_time = 0.1, result = "froth-floatation-plant"},
        fast_replaceable_group = "chemical-plant",
        max_health = 300,
        corpse = "chemical-plant-remnants",
        dying_explosion = "chemical-plant-explosion",
        icon_draw_specification = {shift = {0, -0.3}},
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["chemical-plant"],
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        damaged_trigger_effect = hit_effects.entity(),
        drawing_box_vertical_extension = 0.4,
        module_slots = 3,
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},

        graphics_set =
        {
        animation = make_4way_animation_from_spritesheet({ layers =
        {
            {
            filename = "__proceduralsystems__/graphics/entity/froth-floatator.png",
            width = 220,
            height = 292,
            frame_count = 24,
            line_length = 12,
            shift = util.by_pixel(0.5, -9),
            scale = 0.5
            },
            {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
            width = 312,
            height = 222,
            repeat_count = 24,
            shift = util.by_pixel(27, 6),
            draw_as_shadow = true,
            scale = 0.5
            }
        }}),
        working_visualisations =
        {
            {
            apply_recipe_tint = "primary",
            north_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-north.png",
                frame_count = 24,
                line_length = 6,
                width = 66,
                height = 44,
                shift = util.by_pixel(23, 15),
                scale = 0.5
            },
            east_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-east.png",
                frame_count = 24,
                line_length = 6,
                width = 70,
                height = 36,
                shift = util.by_pixel(0, 22),
                scale = 0.5
            },
            south_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-south.png",
                frame_count = 24,
                line_length = 6,
                width = 66,
                height = 42,
                shift = util.by_pixel(0, 17),
                scale = 0.5
            },
            west_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-west.png",
                frame_count = 24,
                line_length = 6,
                width = 74,
                height = 36,
                shift = util.by_pixel(-10, 13),
                scale = 0.5
            }
            },
            {
            apply_recipe_tint = "secondary",
            north_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-north.png",
                frame_count = 24,
                line_length = 6,
                width = 62,
                height = 42,
                shift = util.by_pixel(24, 15),
                scale = 0.5
            },
            east_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-east.png",
                frame_count = 24,
                line_length = 6,
                width = 68,
                height = 36,
                shift = util.by_pixel(0, 22),
                scale = 0.5
            },
            south_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-south.png",
                frame_count = 24,
                line_length = 6,
                width = 60,
                height = 40,
                shift = util.by_pixel(1, 17),
                scale = 0.5
            },
            west_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-west.png",
                frame_count = 24,
                line_length = 6,
                width = 68,
                height = 28,
                shift = util.by_pixel(-9, 15),
                scale = 0.5
            }
            },
            {
            apply_recipe_tint = "tertiary",
            fadeout = true,
            constant_speed = true,
            north_position = util.by_pixel_hr(-30, -161),
            east_position = util.by_pixel_hr(29, -150),
            south_position = util.by_pixel_hr(12, -134),
            west_position = util.by_pixel_hr(-32, -130),
            render_layer = "wires",
            animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
                frame_count = 47,
                line_length = 16,
                width = 90,
                height = 188,
                animation_speed = 0.5,
                shift = util.by_pixel(-2, -40),
                scale = 0.5
            }
            },
            {
            apply_recipe_tint = "quaternary",
            fadeout = true,
            constant_speed = true,
            north_position = util.by_pixel_hr(-30, -161),
            east_position = util.by_pixel_hr(29, -150),
            south_position = util.by_pixel_hr(12, -134),
            west_position = util.by_pixel_hr(-32, -130),
            render_layer = "wires",
            animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
                frame_count = 47,
                line_length = 16,
                width = 40,
                height = 84,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -14),
                scale = 0.5
            }
            }
        }
        },
        impact_category = "metal-large",
        open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
        close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
        working_sound =
        {
        sound = sound_variations("__base__/sound/chemical-plant", 3, 0.5),
        apparent_volume = 1.5,
        fade_in_ticks = 4,
        fade_out_ticks = 20
        },
        crafting_speed = 1,
        energy_source =
        {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = { pollution = 4 }
        },
        energy_usage = "210kW",
        crafting_categories = {"froth-floatation"},
        fluid_boxes =
        {
        {
            production_type = "input",
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections =
            {
            {
                flow_direction="input",
                direction = defines.direction.west,
                position = {-1, -1}
            }
            }
        },
        {
          production_type = "input",
          pipe_covers = pipecoverspictures(),
          volume = 1000,
          pipe_connections =
          {
          {
              flow_direction = "input",
              direction = defines.direction.east,
              position = {1, 1}
          }
          }
        },
        {
          production_type = "input",
          pipe_covers = pipecoverspictures(),
          volume = 1000,
          pipe_connections =
          {
          {
              flow_direction="input",
              direction = defines.direction.east,
              position = {1, -1}
          }
          }
        },
        {
          production_type = "input",
          pipe_covers = pipecoverspictures(),
          volume = 1000,
          pipe_connections =
          {
          {
              flow_direction = "input",
              direction = defines.direction.west,
              position = {-1, 1}
          }
          }
        },
        {
            production_type = "input",
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections =
            {
            {
                flow_direction="input",
                direction = defines.direction.north,
                position = {-1, -1}
            }
            }
        },
        {
            production_type = "input",
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections =
            {
            {
                flow_direction="input",
                direction = defines.direction.north,
                position = {1, -1}
            }
            }
        },
        {
            production_type = "output",
            pipe_covers = pipecoverspictures(),
            volume = 5000,
            pipe_connections =
            {
            {
                flow_direction = "output",
                direction = defines.direction.south,
                position = {-1, 1}
            }
            }
        },
        {
            production_type = "output",
            pipe_covers = pipecoverspictures(),
            volume = 5000,
            pipe_connections =
            {
            {
                flow_direction = "output",
                direction = defines.direction.south,
                position = {1, 1}
            }
            }
        }
        },
        water_reflection =
        {
        pictures =
        {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
            priority = "extra-high",
            width = 28,
            height = 36,
            shift = util.by_pixel(5, 60),
            variation_count = 4,
            scale = 5
        },
        rotate = false,
        orientation_to_variation = true
        }
    },

    {
        type = "furnace",
        name = "blast-furnace",
        icon = "__proceduralsystems__/graphics/icons/blast-furnace.png",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 0.2, result = "blast-furnace"},
        fast_replaceable_group = "furnace",
        max_health = 300,
        corpse = "steel-furnace-remnants", --TODO remnants
        dying_explosion = "steel-furnace-explosion",
        impact_category = "metal",
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        allowed_effects = {"speed", "consumption", "pollution","quality","productivity"},
        effect_receiver = {uses_module_effects = true, uses_beacon_effects = true, uses_surface_effects = true, base_effect = { productivity = 0.1 }},
        icon_draw_specification = {scale = 0.66, shift = {0, -0.1}},
        module_slots = 2,
        working_sound =
        {
          sound = {filename = "__base__/sound/steel-furnace.ogg", volume = 0.32, advanced_volume_control = {attenuation = "exponential"}},
          max_sounds_per_type = 4,
          audible_distance_modifier = 0.5,
          fade_in_ticks = 4,
          fade_out_ticks = 20
        },
        resistances =
        {
          {
            type = "fire",
            percent = 100
          }
        },
        collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
        selection_box = {{-0.8, -1}, {0.8, 1}},
        damaged_trigger_effect = hit_effects.entity(),
        crafting_categories = {"blasting","smelting"},
        result_inventory_size = 2,
        energy_usage = "90kW",
        crafting_speed = 2.3,
        source_inventory_size = 1,
        energy_source =
        {
          type = "burner",
          fuel_categories = {"blast-furnace"},
          effectivity = 1,
          emissions_per_minute = { pollution = 4 },
          fuel_inventory_size = 1,
          light_flicker =
          {
            color = {0,0,0},
            minimum_intensity = 0.6,
            maximum_intensity = 0.95
          },
          smoke =
          {
            {
              name = "smoke",
              frequency = 10,
              position = {0.7, -1.2},
              starting_vertical_speed = 0.08,
              starting_frame_deviation = 60
            }
          }
        },
        graphics_set =
        {
          animation =
          {
            layers =
            {
              {
                filename = "__proceduralsystems__/graphics/entity/blast-furnace/blast-furnace.png",
                priority = "high",
                width = 171,
                height = 174,
                shift = util.by_pixel(-1.25, 2),
                scale = 0.5
              },
              {
                filename = "__proceduralsystems__/graphics/entity/blast-furnace/blast-furnace-shadow.png",
                priority = "high",
                width = 277,
                height = 85,
                draw_as_shadow = true,
                shift = util.by_pixel(39.25, 11.25),
                scale = 0.5
              }
            }
          },
          working_visualisations =
          {
            {
              fadeout = true,
              effect = "flicker",
              animation =
              {
                filename = "__proceduralsystems__/graphics/entity/blast-furnace/blast-furnace-fire.png",
                priority = "high",
                line_length = 8,
                width = 57,
                height = 81,
                frame_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(-0.75, 5.75),
                scale = 0.5
              },
            },
            {
              fadeout = true,
              effect = "flicker",
              animation =
              {
                filename = "__proceduralsystems__/graphics/entity/blast-furnace/blast-furnace-glow.png",
                priority = "high",
                width = 60,
                height = 43,
                draw_as_glow = true,
                shift = {0.03125, 0.640625},
                blend_mode = "additive"
              }
            },
            {
              fadeout = true,
              effect = "flicker",
              animation =
              {
                filename = "__proceduralsystems__/graphics/entity/blast-furnace/blast-furnace-working.png",
                priority = "high",
                line_length = 1,
                width = 128,
                height = 150,
                draw_as_glow = true,
                shift = util.by_pixel(0, -5),
                blend_mode = "additive",
                scale = 0.5,
              }
            },
            {
              fadeout = true,
              effect = "flicker",
              animation =
              {
                filename = "__proceduralsystems__/graphics/entity/blast-furnace/blast-furnace-ground-light.png",
                priority = "high",
                line_length = 1,
                width = 152,
                height = 126,
                draw_as_light = true,
                shift = util.by_pixel(1, 48),
                blend_mode = "additive",
                scale = 0.5,
              },
            },
          },
          water_reflection =
          {
            pictures =
            {
              filename = "__proceduralsystems__/graphics/entity/blast-furnace/blast-furnace-reflection.png",
              priority = "extra-high",
              width = 20,
              height = 24,
              shift = util.by_pixel(0, 45),
              variation_count = 1,
              scale = 5
            },
            rotate = false,
            orientation_to_variation = false
          }
        }
    },

    {
        type = "assembling-machine",
        name = "dangerous-cryogenic-plant",
        icon = "__proceduralsystems__/graphics/icons/cryogenic-plant.png",
        flags = {"placeable-neutral","player-creation"},
        minable = {mining_time = 0.2, result = "dangerous-cryogenic-plant"},
        fast_replaceable_group = "cryogenic-plant",
        max_health = 700,
        corpse = "cryogenic-plant-remnants",  --TODO
        dying_explosion = "cryogenic-plant-explosion",
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["cryogenic-plant"],
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        heating_energy = "100kW",
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        damaged_trigger_effect = hit_effects.entity(),
        drawing_box_vertical_extension = 0.4,
        module_slots = 4,
        icons_positioning =
        {
          {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.95}, max_icons_per_row = 4}
        },
        icon_draw_specification = {scale = 2, shift = {0, -0.3}},
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
        crafting_categories = {"hydraulic-washing","fluorination"},
        crafting_speed = 2,
        energy_source =
        {
          type = "electric",
          usage_priority = "secondary-input",
          emissions_per_minute = { pollution = 6 }
        },
        energy_usage = "1700kW",
        graphics_set = require("__proceduralsystems__.prototypes.entity.cryogenic-plant-pictures").graphics_set,
        open_sound = sounds.metal_large_open,
        close_sound = sounds.metal_large_close,
        working_sound =
        {
          sound =
          {
            filename = "__space-age__/sound/entity/cryogenic-plant/cryogenic-plant.ogg", volume = 0.8
          },
          --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
          fade_in_ticks = 4,
          fade_out_ticks = 30,
          sound_accents =
          {
            { sound = { variations = sound_variations("__space-age__/sound/entity/cryogenic-plant/cp-smoke-mask-puff", 2, 0.35 )}, frame = 11, audible_distance_modifier = 0.8 },
            { sound = { variations = sound_variations("__space-age__/sound/entity/cryogenic-plant/cp-smoke-mask-puff", 2, 0.3 )}, frame = 130, audible_distance_modifier = 0.8 },
            { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim3-bubbles-rise.ogg", volume = 0.9 }, frame = 14, audible_distance_modifier = 0.3 },
            { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim3-bubbles-fall.ogg", volume = 0.7 }, frame = 62, audible_distance_modifier = 0.3},
            { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim3-bubbles-rise.ogg", volume = 0.9 }, frame = 110, audible_distance_modifier = 0.3 },
            { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim3-bubbles-fall.ogg", volume = 0.7 }, frame = 158, audible_distance_modifier = 0.3 },
            { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim5-gears.ogg", volume = 0.25 }, frame = 51, audible_distance_modifier = 0.4 },
            { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim5-gears.ogg", volume = 0.2 }, frame = 151, audible_distance_modifier = 0.4 },
            { sound = { variations = sound_variations("__space-age__/sound/entity/cryogenic-plant/cp-anim6-open", 2, 0.6 )}, frame = 3, audible_distance_modifier = 0.4 },
            { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim6-close.ogg", volume = 0.7 }, frame = 33, audible_distance_modifier = 0.4 },
            { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim6-slide-down.ogg", volume = 0.55 }, frame = 42, audible_distance_modifier = 0.4 },
            { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim6-slide-up.ogg", volume = 0.6 }, frame = 126, audible_distance_modifier = 0.4 },
            { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim6-slide-stop.ogg", volume = 0.4 }, frame = 146, audible_distance_modifier = 0.4 },
          },
          max_sounds_per_type = 2
        },
        fluid_boxes =
        {
          {
            production_type = "input",
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-2, 2} }}
          },
          {
            production_type = "input",
            pipe_picture =  require("__proceduralsystems__.prototypes.entity.cryogenic-plant-pictures").pipe_picture,
            pipe_picture_frozen =  require("__proceduralsystems__.prototypes.entity.cryogenic-plant-pictures").pipe_picture_frozen,
            always_draw_covers = true, -- fighting against FluidBoxPrototype::always_draw_covers crazy default
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {0, 2} }}
          },
          {
            production_type = "input",
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {2, 2} }}
          },
          {
            production_type = "output",
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-2, -2} }}
          },
          {
            production_type = "output",
            pipe_picture =  require("__proceduralsystems__.prototypes.entity.cryogenic-plant-pictures").pipe_picture,
            pipe_picture_frozen =  require("__proceduralsystems__.prototypes.entity.cryogenic-plant-pictures").pipe_picture_frozen,
            always_draw_covers = true, -- fighting against FluidBoxPrototype::always_draw_covers crazy default
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {0, -2} }}
          },
          {
            production_type = "output",
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {2, -2} }}
          }
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        water_reflection =
        {
          pictures = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-reflection",
          {
              scale = 5,
              shift = {0,2}
          }),
          rotate = false,
        }
    },
})
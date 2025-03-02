local resource_autoplace = require("resource-autoplace")
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local function resource(resource_parameters, autoplace_parameters, graphics_parameters) --repurpose mining visualization tint. change the naming scheme from just being the ore name
    return
    {
        type = "resource",
        name = resource_parameters.name,
        icon = "__proceduralsystems__/graphics/icons/" .. graphics_parameters.icon_subfolder .. "/" .. graphics_parameters.icon_image,
        flags = {"placeable-neutral"},
        order="a-b-"..resource_parameters.order,
        tree_removal_probability = 0.8,
        tree_removal_max_distance = 32 * 32,
        minable = resource_parameters.minable or
        {
        --mining_particle = resource_parameters.name .. "-particle",
        mining_time = resource_parameters.mining_time,
        result = resource_parameters.name
        },
        category = resource_parameters.category,
        subgroup = resource_parameters.subgroup,
        walking_sound = resource_parameters.walking_sound,
        collision_mask = resource_parameters.collision_mask,
        collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        resource_patch_search_radius = resource_parameters.resource_patch_search_radius,
        autoplace = autoplace_parameters.probability_expression ~= nil and
        {
        --control = resource_parameters.name,
        order = resource_parameters.order,
        probability_expression = autoplace_parameters.probability_expression,
        richness_expression = autoplace_parameters.richness_expression
        }
        or resource_autoplace.resource_autoplace_settings
        {
        name = resource_parameters.name,
        order = resource_parameters.order,
        autoplace_control_name = resource_parameters.autoplace_control_name,
        base_density = autoplace_parameters.base_density,
        base_spots_per_km = autoplace_parameters.base_spots_per_km2,
        regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
        starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
        candidate_spot_count = autoplace_parameters.candidate_spot_count,
        tile_restriction = autoplace_parameters.tile_restriction
        },
        stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
        sheet =
        {
            --filename = "__proceduralsystems__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
            filename = "__proceduralsystems__/graphics/entity/" .. graphics_parameters.entity_subfolder .. "/" .. graphics_parameters.entity_image_sheet,
            priority = "extra-high",
            size = 128,
            frame_count = 8,
            variation_count = 8,
            scale = 0.5,
            tint = resource_parameters.mining_visualisation_tint,
        }
        },
        map_color = resource_parameters.map_color,
        --mining_visualisation_tint = resource_parameters.mining_visualisation_tint,
        mining_visualisation_tint = resource_parameters.map_color,
        --factoriopedia_simulation = resource_parameters.factoriopedia_simulation
    }
end

local function create_procedural_ore(input_name, input_tint)
  return resource(
    {
      name = input_name,
      order = "b",
      map_color = input_tint,
      mining_time = 1,
      walking_sound = sounds.ore,
      mining_visualisation_tint = input_tint, --rgb(211, 120, 120)  --Color for ore 
      --factoriopedia_simulation = simulations.factoriopedia_calcite,
    },
    {
      probability_expression = 0
    },
    {
      icon_subfolder = "",
      icon_image = "procedural-ore-1.png",
      entity_subfolder = "procedural-ore",
      entity_image_sheet = "procedural-ore.png",
    }
  )
end

data:extend(
{
    --petroleum geyser-p
    {
        type = "resource",
        name = "petroleum-geyser-p",
        icon = "__proceduralsystems__/graphics/icons/gray-geyser.png",
        flags = {"placeable-neutral"},
        category = "basic-fluid",
        subgroup = "mineable-fluids",
        order="a-b-a",
        infinite = true,
        highlight = true,
        minimum = 60000,
        normal = 300000,
        infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 0.7,
        tree_removal_max_distance = 32 * 32,
        draw_stateless_visualisation_under_building = false,
        minable =
        {
          mining_time = 1,
          results =
          {
            {
              type = "fluid",
              name = "petroleum-gas",
              amount_min = 10,
              amount_max = 10,
              probability = 1
            }
          }
        },
        walking_sound = sounds.oil,
        working_sound =
        {
          sound =
          {
            category = "world-ambient", variations = sound_variations("__space-age__/sound/world/resources/sulfuric-acid-geyser", 1, 0.3),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 0.0}, to = {2.0, 100.0}}}
            }
          },
          max_sounds_per_type = 3,
          audible_distance_modifier = 0.3,
        },
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace =
        {
          --control = "sulfuric-acid-geyser",
          order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
          probability_expression = 0
        },
        stage_counts = {0},
        stages =
        {
          layers =
          {
            util.sprite_load("__proceduralsystems__/graphics/entity/gray-geyser/gray-geyser",
            {
              priority = "high",
              frame_count = 4,
              scale = 0.5,
              tint = util.multiply_color({r=133, g=89, b=23}, 0.3) --rgb(133, 89, 23)
            })
          }
        },
        stateless_visualisation =
        {
          -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
          {
            count = 1,
            render_layer = "smoke",
            animation =
            {
              filename = "__proceduralsystems__/graphics/entity/gray-geyser/gray-geyser-gas-outer.png",
              frame_count = 47,
              line_length = 16,
              width = 90,
              height = 188,
              animation_speed = 0.3,
              shift = util.by_pixel(-6, -89),
              scale = 1,
              tint = util.multiply_color({r=170, g=162, b=96}, 0.3) --rgb(170, 162, 96)
            }
          },
          {
            count = 1,
            render_layer = "smoke",
            animation =
            {
               filename = "__proceduralsystems__/graphics/entity/gray-geyser/gray-geyser-gas-inner.png",
               frame_count = 47,
               line_length = 16,
               width = 40,
               height = 84,
               animation_speed = 0.4,
               shift = util.by_pixel(-4, -30),
               scale = 1,
               tint = util.multiply_color({r=228, g=208, b=32}, 0.5) --rgb(228, 208, 32)
            }
          }
        },
        map_color = {r = 228, g = 208, b = 32}, --rgb(228, 208, 32)
        map_grid = false
    },
    --steam-geyser-p
    {
        type = "resource",
        name = "steam-geyser-p",
        icon = "__proceduralsystems__/graphics/icons/gray-geyser.png",
        flags = {"placeable-neutral"},
        category = "basic-fluid",
        subgroup = "mineable-fluids",
        order="a-b-a",
        infinite = true,
        highlight = true,
        minimum = 60000,
        normal = 300000,
        infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 0.7,
        tree_removal_max_distance = 32 * 32,
        draw_stateless_visualisation_under_building = false,
        minable =
        {
          mining_time = 1,
          results =
          {
            {
              type = "fluid",
              name = "steam",
              amount_min = 70,
              amount_max = 70,
              probability = 1,
              temperature = 250,
            }
          }
        },
        walking_sound = sounds.oil,
        working_sound =
        {
          sound =
          {
            category = "world-ambient", variations = sound_variations("__space-age__/sound/world/resources/sulfuric-acid-geyser", 1, 0.3),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 0.0}, to = {2.0, 100.0}}}
            }
          },
          max_sounds_per_type = 3,
          audible_distance_modifier = 0.3,
        },
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace =
        {
          --control = "sulfuric-acid-geyser",
          order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
          probability_expression = 0
        },
        stage_counts = {0},
        stages =
        {
          layers =
          {
            util.sprite_load("__proceduralsystems__/graphics/entity/gray-geyser/gray-geyser",
            {
              priority = "high",
              frame_count = 4,
              scale = 0.5,
              tint = util.multiply_color({r=133, g=89, b=23}, 0.3) --rgb(133, 89, 23)
            })
          }
        },
        stateless_visualisation =
        {
          -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
          {
            count = 1,
            render_layer = "smoke",
            animation =
            {
              filename = "__proceduralsystems__/graphics/entity/gray-geyser/gray-geyser-gas-outer.png",
              frame_count = 47,
              line_length = 16,
              width = 90,
              height = 188,
              animation_speed = 0.3,
              shift = util.by_pixel(-6, -89),
              scale = 1,
              tint = util.multiply_color({r=239, g=239, b=239}, 0.2) --rgb(239, 239, 239)
            }
          },
          {
            count = 1,
            render_layer = "smoke",
            animation =
            {
               filename = "__proceduralsystems__/graphics/entity/gray-geyser/gray-geyser-gas-inner.png",
               frame_count = 47,
               line_length = 16,
               width = 40,
               height = 84,
               animation_speed = 0.4,
               shift = util.by_pixel(-4, -30),
               scale = 1,
               tint = util.multiply_color({r=250, g=250, b=250}, 0.5) --rgb(250, 250, 250)
            }
          }
        },
        map_color = {r = 180, g = 180, b = 180}, --rgb(180, 180, 180)
        map_grid = false
    },
    --water-geyser-p
    {
        type = "resource",
        name = "water-geyser-p",
        icon = "__proceduralsystems__/graphics/icons/gray-geyser.png",
        flags = {"placeable-neutral"},
        category = "basic-fluid",
        subgroup = "mineable-fluids",
        order="a-b-a",
        infinite = true,
        highlight = true,
        minimum = 60000,
        normal = 300000,
        infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 0.7,
        tree_removal_max_distance = 32 * 32,
        draw_stateless_visualisation_under_building = false,
        minable =
        {
          mining_time = 1,
          results =
          {
            {
              type = "fluid",
              name = "water",
              amount_min = 10,
              amount_max = 10,
              probability = 1
            }
          }
        },
        walking_sound = sounds.oil,
        working_sound =
        {
          sound =
          {
            category = "world-ambient", variations = sound_variations("__space-age__/sound/world/resources/sulfuric-acid-geyser", 1, 0.3),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 0.0}, to = {2.0, 100.0}}}
            }
          },
          max_sounds_per_type = 3,
          audible_distance_modifier = 0.3,
        },
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace =
        {
          --control = "sulfuric-acid-geyser",
          order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
          probability_expression = 0
        },
        stage_counts = {0},
        stages =
        {
          layers =
          {
            util.sprite_load("__proceduralsystems__/graphics/entity/gray-geyser/gray-geyser",
            {
              priority = "high",
              frame_count = 4,
              scale = 0.5,
              tint = util.multiply_color({r=133, g=89, b=23}, 0.3) --rgb(133, 89, 23)
            })
          }
        },
        stateless_visualisation =
        {
          -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
          {
            count = 1,
            render_layer = "smoke",
            animation =
            {
              filename = "__proceduralsystems__/graphics/entity/gray-geyser/gray-geyser-gas-outer.png",
              frame_count = 47,
              line_length = 16,
              width = 90,
              height = 188,
              animation_speed = 0.3,
              shift = util.by_pixel(-6, -89),
              scale = 1,
              tint = util.multiply_color({r=170, g=170, b=170}, 0.3) --rgb(170, 170, 170)
            }
          },
          {
            count = 1,
            render_layer = "smoke",
            animation =
            {
               filename = "__proceduralsystems__/graphics/entity/gray-geyser/gray-geyser-gas-inner.png",
               frame_count = 47,
               line_length = 16,
               width = 40,
               height = 84,
               animation_speed = 0.4,
               shift = util.by_pixel(-4, -30),
               scale = 1,
               tint = util.multiply_color({r=200, g=200, b=200}, 0.5) --rgb(200, 200, 200)
            }
          }
        },
        map_color = {r = 200, g = 200, b = 200}, --rgb(200, 200, 200)
        map_grid = false
    },

    --covellite
    resource(
        {
          name = "covellite",
          order = "b",
          map_color = {123,123,180},
          mining_time = 1,
          walking_sound = sounds.ore,
          mining_visualisation_tint = {r = 123, g = 123, b = 180, a = 1.000}, --rgb(123, 123, 180)  --Color for ore 
          --factoriopedia_simulation = simulations.factoriopedia_calcite,
        },
        {
          probability_expression = 0
        },
        {
          icon_subfolder = "ores_malcom/covellite",
          icon_image = "covellite-1.png",
          entity_subfolder = "procedural-ore",
          entity_image_sheet = "copper-ore-desat.png",
        }
    ),
    --malachite
    resource(
        {
          name = "malachite",
          order = "b",
          map_color = {34,206,89},
          mining_time = 1,
          walking_sound = sounds.ore,
          mining_visualisation_tint = {r = 34, g = 206, b = 89, a = 1.000}, --rgb(34, 206, 89)  --Color for ore 
          --factoriopedia_simulation = simulations.factoriopedia_calcite,
        },
        {
          probability_expression = 0
        },
        {
          icon_subfolder = "ores_malcom/malachite",
          icon_image = "malachite-1.png",
          entity_subfolder = "procedural-ore",
          entity_image_sheet = "copper-ore-desat.png",
        }
    ),
    --tenorite
    resource(
        {
          name = "tenorite",
          order = "b",
          map_color = {34,42,34},
          mining_time = 1,
          walking_sound = sounds.ore,
          mining_visualisation_tint = {r = 34, g = 42, b = 34, a = 1.000}, --rgb(34, 42, 34)  --Color for ore 
          --factoriopedia_simulation = simulations.factoriopedia_calcite,
        },
        {
          probability_expression = 0
        },
        {
          icon_subfolder = "ores_malcom/tenorite",
          icon_image = "tenorite-1.png",
          entity_subfolder = "procedural-ore",
          entity_image_sheet = "copper-ore-desat.png",
        }
    ),
    --pyrite
    resource(
      {
        name = "pyrite",
        order = "b",
        map_color = {202,211,120},
        mining_time = 1,
        walking_sound = sounds.ore,
        mining_visualisation_tint = {r = 202, g = 211, b = 120, a = 1.000}, --rgb(202, 211, 120)  --Color for ore 
        --factoriopedia_simulation = simulations.factoriopedia_calcite,
      },
      {
        probability_expression = 0
      },
      {
        icon_subfolder = "ores_malcom/pyrite",
        icon_image = "pyrite-1.png",
        entity_subfolder = "procedural-ore",
        entity_image_sheet = "iron-ore-desat.png",
      }
    ),
    --siderite
    resource(
      {
        name = "siderite",
        order = "b",
        map_color = {210,69,69},
        mining_time = 1,
        walking_sound = sounds.ore,
        mining_visualisation_tint = {r = 210, g = 69, b = 69, a = 1.000}, --rgb(210, 69, 69)  --Color for ore 
        --factoriopedia_simulation = simulations.factoriopedia_calcite,
      },
      {
        probability_expression = 0
      },
      {
        icon_subfolder = "ores_malcom/siderite",
        icon_image = "siderite-1.png",
        entity_subfolder = "procedural-ore",
        entity_image_sheet = "iron-ore-desat.png",
      }
    ),
    --hematite
    resource(
      {
        name = "hematite",
        order = "b",
        map_color = {211,120,120},
        mining_time = 1,
        walking_sound = sounds.ore,
        mining_visualisation_tint = {r = 211, g = 120, b = 120, a = 1.000}, --rgb(211, 120, 120)  --Color for ore 
        --factoriopedia_simulation = simulations.factoriopedia_calcite,
      },
      {
        probability_expression = 0
      },
      {
        icon_subfolder = "ores_malcom/hematite",
        icon_image = "hematite-1.png",
        entity_subfolder = "procedural-ore",
        entity_image_sheet = "iron-ore-desat.png",
      }
    ),

    --ROUGH ORES

    --covellite-rough
    resource(
        {
          name = "covellite-rough",
          order = "b",
          map_color = {60,60,90},
          mining_time = 1,
          walking_sound = sounds.ore,
          mining_visualisation_tint = {r = 60, g = 60, b = 90, a = 1.000}, --rgb(123, 123, 180)  --Color for ore 
          --factoriopedia_simulation = simulations.factoriopedia_calcite,
        },
        {
          probability_expression = 0
        },
        {
          icon_subfolder = "ores_malcom/low-quality/covellite",
          icon_image = "covellite-1.png",
          entity_subfolder = "procedural-ore",
          entity_image_sheet = "copper-ore-desat.png",
        }
    ),
    --malachite-rough
    resource(
        {
          name = "malachite-rough",
          order = "b",
          map_color = {17,100,45},
          mining_time = 1,
          walking_sound = sounds.ore,
          mining_visualisation_tint = {r = 17, g = 100, b = 45, a = 1.000}, --rgb(34, 206, 89)  --Color for ore 
          --factoriopedia_simulation = simulations.factoriopedia_calcite,
        },
        {
          probability_expression = 0
        },
        {
          icon_subfolder = "ores_malcom/low-quality/malachite",
          icon_image = "malachite-1.png",
          entity_subfolder = "procedural-ore",
          entity_image_sheet = "copper-ore-desat.png",
        }
    ),
    --tenorite-rough
    resource(
        {
          name = "tenorite-rough",
          order = "b",
          map_color = {80,80,80},
          mining_time = 1,
          walking_sound = sounds.ore,
          mining_visualisation_tint = {r = 80, g = 80, b = 80, a = 1.000}, --rgb(34, 42, 34)  --Color for ore 
          --factoriopedia_simulation = simulations.factoriopedia_calcite,
        },
        {
          probability_expression = 0
        },
        {
          icon_subfolder = "ores_malcom//low-quality/tenorite",
          icon_image = "tenorite-1.png",
          entity_subfolder = "procedural-ore",
          entity_image_sheet = "copper-ore-desat.png",
        }
    ),
    --pyrite-rough
    resource(
      {
        name = "pyrite-rough",
        order = "b",
        map_color = {100,105,60},
        mining_time = 1,
        walking_sound = sounds.ore,
        mining_visualisation_tint = {r = 100, g = 105, b = 60, a = 1.000}, --rgb(202, 211, 120)  --Color for ore 
        --factoriopedia_simulation = simulations.factoriopedia_calcite,
      },
      {
        probability_expression = 0
      },
      {
        icon_subfolder = "ores_malcom/low-quality/pyrite",
        icon_image = "pyrite-1.png",
        entity_subfolder = "procedural-ore",
        entity_image_sheet = "iron-ore-desat.png",
      }
    ),
    --siderite-rough
    resource(
      {
        name = "siderite-rough",
        order = "b",
        map_color = {105,35,35},
        mining_time = 1,
        walking_sound = sounds.ore,
        mining_visualisation_tint = {r = 105, g = 35, b = 35, a = 1.000}, --rgb(210, 69, 69)  --Color for ore 
        --factoriopedia_simulation = simulations.factoriopedia_calcite,
      },
      {
        probability_expression = 0
      },
      {
        icon_subfolder = "ores_malcom/low-quality/siderite",
        icon_image = "siderite-1.png",
        entity_subfolder = "procedural-ore",
        entity_image_sheet = "iron-ore-desat.png",
      }
    ),
    --hematite-rough
    resource(
      {
        name = "hematite-rough",
        order = "b",
        map_color = {100,60,60},
        mining_time = 1,
        walking_sound = sounds.ore,
        mining_visualisation_tint = {r = 100, g = 60, b = 60, a = 1.000}, --rgb(211, 120, 120)  --Color for ore 
        --factoriopedia_simulation = simulations.factoriopedia_calcite,
      },
      {
        probability_expression = 0
      },
      {
        icon_subfolder = "ores_malcom/low-quality/hematite",
        icon_image = "hematite-1.png",
        entity_subfolder = "procedural-ore",
        entity_image_sheet = "iron-ore-desat.png",
      }
    ),

    --Fluorite
    resource(
      {
        name = "fluorite",
        order = "b",
        map_color = {120,211,144},
        mining_time = 1,
        walking_sound = sounds.ore,
        mining_visualisation_tint = {r = 120, g = 211, b = 144, a = 1.000}, --rgb(120, 211, 144)  --Color for ore 
        --factoriopedia_simulation = simulations.factoriopedia_calcite,
      },
      {
        probability_expression = 0
      },
      {
        icon_subfolder = "ores_malcom/fluorite",
        icon_image = "fluorite-1.png",
        entity_subfolder = "procedural-ore",
        entity_image_sheet = "calcite-desat.png",
      }
    ),

    --PROCEDURAL ORES
    create_procedural_ore("alpha-ore-raw", {r = 200, g = 0,  b = 0, a = 1}), --rgb(200, 0, 0)
    create_procedural_ore("beta-ore-raw", {r = 222,g = 138,  b = 20,  a = 1}), --rgb(222, 138, 20)
    create_procedural_ore("gamma-ore-raw", {r = 232, g = 221, b = 12, a = 1}), --rgb(232, 221, 12)
    create_procedural_ore("delta-ore-raw", {r = 0,  g = 200,b = 0, a = 1}), --rgb(0, 200, 0)
    create_procedural_ore("epilson-ore-raw",{r = 37,  g = 18, b = 230, a = 1}), --rgb(37, 42, 230)
    create_procedural_ore("omega-ore-raw", {r = 102,  g = 18, b = 212, a = 1}), --rgb(102, 18, 212)

})
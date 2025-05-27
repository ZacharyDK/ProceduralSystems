local resource_autoplace = require("resource-autoplace")
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local function resource(resource_parameters, autoplace_parameters, graphics_parameters) --repurpose mining visualization tint. change the naming scheme from just being the ore name
    return
    {
        type = "resource",
        name = resource_parameters.name,
        icon = "__mineral-chemistry__/graphics/icons/" .. graphics_parameters.icon_subfolder .. "/" .. graphics_parameters.icon_image,
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
            --filename = "__procedural-systems__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
            filename = "__procedural-systems__/graphics/entity/" .. graphics_parameters.entity_subfolder .. "/" .. graphics_parameters.entity_image_sheet,
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
      map_color = {r = 200, b = 200, g = 200}, --tint can look too close to tiles.
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


local proc_coal = 
resource(
  {
    name = "coal",
    order = "b",
    map_color = {20,20,20},
    mining_time = 1,
    walking_sound = sounds.ore,
    mining_visualisation_tint = {r = 20, g = 20, b = 20, a = 1.000}, --rgb(20, 20, 20)  --Color for ore 
    --factoriopedia_simulation = simulations.factoriopedia_calcite,
  },
  {
    probability_expression = 0
  },
  {
    icon_subfolder = "base",
    icon_image = "coal.png",
    entity_subfolder = "procedural-ore",
    entity_image_sheet = "coal.png",
  }
)
proc_coal.name = "coal_p" --have to change the name as to not conflict with base game while still having coal as the mining result

local proc_calcite = 
resource(
  {
    name = "calcite",
    order = "b",
    map_color = {200,200,200},
    mining_time = 1,
    walking_sound = sounds.ore,
    mining_visualisation_tint = {r = 200, g = 200, b = 200, a = 1.000}, --rgb(200, 200, 200)  --Color for ore 
    --factoriopedia_simulation = simulations.factoriopedia_calcite,
  },
  {
    probability_expression = 0
  },
  {
    icon_subfolder = "base",
    icon_image = "calcite.png",
    entity_subfolder = "procedural-ore",
    entity_image_sheet = "calcite-desat.png",
  }
)

proc_calcite.name = "calcite_p"

local proc_sulfur = 
resource(
  {
    name = "sulfur",
    order = "b",
    map_color = {212,234,17},
    mining_time = 1,
    walking_sound = sounds.ore,
    mining_visualisation_tint = {r = 212, g = 234, b = 17, a = 1.000}, --rgb(212, 234, 17)  --Color for ore 
    --factoriopedia_simulation = simulations.factoriopedia_calcite,
  },
  {
    probability_expression = 0
  },
  {
    icon_subfolder = "base",
    icon_image = "sulfur.png",
    entity_subfolder = "procedural-ore",
    entity_image_sheet = "calcite-desat.png",
  }
)
proc_sulfur.name = "sulfur_ore_p"

data:extend(
{
    --petroleum geyser-p
    {
        type = "resource",
        name = "petroleum_geyser_p",
        icon = "__procedural-systems__/graphics/icons/gray-geyser.png",
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
            util.sprite_load("__procedural-systems__/graphics/entity/gray-geyser/gray-geyser",
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
              filename = "__procedural-systems__/graphics/entity/gray-geyser/gray-geyser-gas-outer.png",
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
               filename = "__procedural-systems__/graphics/entity/gray-geyser/gray-geyser-gas-inner.png",
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
    --steam_geyser_p
    {
        type = "resource",
        name = "steam_geyser_p",
        icon = "__procedural-systems__/graphics/icons/gray-geyser.png",
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
            util.sprite_load("__procedural-systems__/graphics/entity/gray-geyser/gray-geyser",
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
              filename = "__procedural-systems__/graphics/entity/gray-geyser/gray-geyser-gas-outer.png",
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
               filename = "__procedural-systems__/graphics/entity/gray-geyser/gray-geyser-gas-inner.png",
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
    --water_geyser_p
    {
        type = "resource",
        name = "water_geyser_p",
        icon = "__procedural-systems__/graphics/icons/gray-geyser.png",
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
            util.sprite_load("__procedural-systems__/graphics/entity/gray-geyser/gray-geyser",
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
              filename = "__procedural-systems__/graphics/entity/gray-geyser/gray-geyser-gas-outer.png",
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
               filename = "__procedural-systems__/graphics/entity/gray-geyser/gray-geyser-gas-inner.png",
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

    --crude_oil_p
    {
      type = "resource",
      name = "crude_oil_p",
      icon = "__procedural-systems__/graphics/icons/gray-geyser.png",
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
            name = "crude-oil",
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
          util.sprite_load("__procedural-systems__/graphics/entity/gray-geyser/gray-geyser",
          {
            priority = "high",
            frame_count = 4,
            scale = 0.5,
            tint = util.multiply_color({r=5, g=5, b=5}, 0.3) --rgb(5, 5, 5)
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
            filename = "__procedural-systems__/graphics/entity/gray-geyser/gray-geyser-gas-outer.png",
            frame_count = 47,
            line_length = 16,
            width = 90,
            height = 188,
            animation_speed = 0.3,
            shift = util.by_pixel(-6, -89),
            scale = 1,
            tint = util.multiply_color({r=5, g=5, b=5}, 0.3) --rgb(170, 170, 170)
          }
        },
        {
          count = 1,
          render_layer = "smoke",
          animation =
          {
             filename = "__procedural-systems__/graphics/entity/gray-geyser/gray-geyser-gas-inner.png",
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
      map_color = {r = 220, g = 37, b = 211}, --rgb(220, 37, 211)
      map_grid = false
    },

    proc_coal,
    proc_calcite,
    proc_sulfur,

    resource(
      {
        name = "scrap_omega",
        order = "b",
        map_color = {0,211,0},
        mining_time = 1,
        walking_sound = sounds.ore,
        mining_visualisation_tint = {r = 0, g = 211, b = 0, a = 1.000}, --rgb(120, 211, 144)  --Color for ore 
        --factoriopedia_simulation = simulations.factoriopedia_calcite,
      },
      {
        probability_expression = 0
      },
      {
        icon_subfolder = "scrap",
        icon_image = "scrap-1.png",
        entity_subfolder = "scrap",
        entity_image_sheet = "scrap.png",
      }
    ),
    resource(
      {
        name = "scrap_epsilon",
        order = "b",
        map_color = {0,0,230},
        mining_time = 1,
        walking_sound = sounds.ore,
        mining_visualisation_tint = {r = 0, g = 0, b = 230, a = 1.000}, --rgb(120, 211, 144)  --Color for ore 
        --factoriopedia_simulation = simulations.factoriopedia_calcite,
      },
      {
        probability_expression = 0
      },
      {
        icon_subfolder = "scrap",
        icon_image = "scrap-1.png",
        entity_subfolder = "scrap",
        entity_image_sheet = "scrap.png",
      }
    ),

    --PROCEDURAL ORES
    create_procedural_ore("alpha_ore_raw", {r = 200, g = 0,  b = 0, a = 1}), --rgb(200, 0, 0)
    create_procedural_ore("beta_ore_raw", {r = 222,g = 138,  b = 20,  a = 1}), --rgb(222, 138, 20)
    create_procedural_ore("gamma_ore_raw", {r = 232, g = 221, b = 12, a = 1}), --rgb(232, 221, 12)
    create_procedural_ore("delta_ore_raw", {r = 0,  g = 200,b = 0, a = 1}), --rgb(0, 200, 0)
    create_procedural_ore("epsilon_ore_raw",{r = 37,  g = 18, b = 230, a = 1}), --rgb(37, 42, 230)
    create_procedural_ore("omega_ore_raw", {r = 102,  g = 18, b = 212, a = 1}), --rgb(102, 18, 212)

})
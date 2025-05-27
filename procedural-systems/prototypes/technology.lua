require("util")

--local function gather_all_recipes()

--end


data:extend({
    {
        type = "technology",
        name = "planet-discovery-interstellar",
        icon = "__procedural-systems__/graphics/icons/planet-icon-desat.png",
        icon_size = 64, --default is 256


        essential = true,
        effects =
        {   

            {
              type = "unlock-space-location",
              space_location = "alpha_p",
              use_icon_overlay_constant = true
            },
            {
              type = "unlock-space-location",
              space_location = "main-system-alpha-edge",
              use_icon_overlay_constant = true
            },
            {
              type = "unlock-space-location",
              space_location = "alpha_p_system_edge",
              use_icon_overlay_constant = true
            },
            {
              type = "unlock-space-location",
              space_location = "alpha",
              use_icon_overlay_constant = true
            },
            {
              type = "unlock-space-location",
              space_location = "beta",
              use_icon_overlay_constant = true
            },
            {
              type = "unlock-space-location",
              space_location = "gamma",
              use_icon_overlay_constant = true
            },
            {
              type = "unlock-space-location",
              space_location = "delta",
              use_icon_overlay_constant = true
            },
            {
              type = "unlock-space-location",
              space_location = "epsilon",
              use_icon_overlay_constant = true
            },
            {
              type = "unlock-space-location",
              space_location = "omega",
              use_icon_overlay_constant = true
            },
            {
              type = "unlock-recipe",
              recipe = "scrap_omega-recycling",
            },
            {
              type = "unlock-recipe",
              recipe = "scrap_epsilon-recycling",
            },
            --concentrate,crystal,science packs
            {
              type = "unlock-recipe",
              recipe = "alpha-processing",
            },
            {
              type = "unlock-recipe",
              recipe = "beta-processing",
            },
            {
              type = "unlock-recipe",
              recipe = "gamma-processing",
            },
            {
              type = "unlock-recipe",
              recipe = "delta-processing",
            },
            {
              type = "unlock-recipe",
              recipe = "epsilon-processing",
            },
            {
              type = "unlock-recipe",
              recipe = "omega-processing",
            },
            {
              type = "unlock-recipe",
              recipe = "procedural-crystal-alpha",
            },
            {
              type = "unlock-recipe",
              recipe = "procedural-crystal-beta",
            },
            {
              type = "unlock-recipe",
              recipe = "procedural-crystal-gamma",
            },
            {
              type = "unlock-recipe",
              recipe = "procedural-crystal-delta",
            },
            {
              type = "unlock-recipe",
              recipe = "procedural-crystal-epsilon",
            },
            {
              type = "unlock-recipe",
              recipe = "procedural-crystal-omega",
            },

            {
              type = "unlock-recipe",
              recipe = "alpha-science-pack",
            },
            {
              type = "unlock-recipe",
              recipe = "beta-science-pack",
            },
            {
              type = "unlock-recipe",
              recipe = "gamma-science-pack",
            },
            {
              type = "unlock-recipe",
              recipe = "delta-science-pack",
            },
            {
              type = "unlock-recipe",
              recipe = "epsilon-science-pack",
            },
            {
              type = "unlock-recipe",
              recipe = "omega-science-pack",
            },

        },
        prerequisites = 
        {
          "planet-discovery-fulgora",
          "planet-discovery-gleba",
          "planet-discovery-vulcanus",
          "electromagnetic-science-pack",
          "agricultural-science-pack",
          "metallurgic-science-pack",
        },
        unit =
        {
          count = 4000,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"metallurgic-science-pack", 1},
            {"agricultural-science-pack", 1},
            {"electromagnetic-science-pack", 1},
          },
          time = 60
        }
    },

    --Pay offs quick and dirty
    --Have an entire table of miscellaneous productivity but this should be good for now
    {
      type = "technology",
      name = "cliff-explosives-productivity-infinite",
      icons = util.technology_icon_constant_recipe_productivity("__base__/graphics/technology/cliff-explosives.png"),
      icon_size = 256,
      effects =
      {
        {
          type = "change-recipe-productivity",
          recipe = "cliff-explosives",
          change = 0.10
        },
      },
      prerequisites = {"planet-discovery-interstellar"},
      unit =
      {
      count_formula = "1.5^L*1000",
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"military-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"alpha-science-pack", 1},
        },
        time = 60
      },
      max_level = "infinite",
      upgrade = true
    },
    {
      type = "technology",
      name = "inserter-productivity-infinite",
      icons = util.technology_icon_constant_recipe_productivity("__base__/graphics/technology/inserter-capacity.png"),
      icon_size = 256,
      effects =
      {
        {
          type = "change-recipe-productivity",
          recipe = "inserter",
          change = 0.10
        },
      },
      prerequisites = {"planet-discovery-interstellar"},
      unit =
      {
      count_formula = "1.5^L*1000",
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"military-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"alpha-science-pack", 1},
        },
        time = 60
      },
      max_level = "infinite",
      upgrade = true
    },
    {
      type = "technology",
      name = "module-productivity-infinite",
      icons = util.technology_icon_constant_recipe_productivity("__quality__/graphics/technology/module.png"),
      icon_size = 256,
      effects =
      {
        {
          type = "change-recipe-productivity",
          recipe = "speed-module",
          change = 0.10
        },
        {
          type = "change-recipe-productivity",
          recipe = "productivity-module",
          change = 0.10
        },
        {
          type = "change-recipe-productivity",
          recipe = "efficiency-module",
          change = 0.10
        },
        {
          type = "change-recipe-productivity",
          recipe = "quality-module",
          change = 0.10
        },
      },
      prerequisites = {"planet-discovery-interstellar"},
      unit =
      {
      count_formula = "1.5^L*1000",
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"military-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"alpha-science-pack", 1},
          {"beta-science-pack", 1},
          {"gamma-science-pack", 1},
        },
        time = 60
      },
      max_level = "infinite",
      upgrade = true
    },
    {
      type = "technology",
      name = "promethium-productivity-infinite",
      icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/promethium-science-pack.png"),
      icon_size = 256,
      effects =
      {
        {
          type = "change-recipe-productivity",
          recipe = "promethium-science-pack",
          change = 0.05
        },
      },
      prerequisites = {"planet-discovery-interstellar"},
      unit =
      {
      count_formula = "1.5^L*1000",
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"military-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"alpha-science-pack", 1},
          {"beta-science-pack", 1},
          {"gamma-science-pack", 1},
          {"delta-science-pack", 1},
          {"epsilon-science-pack", 1},
          {"omega-science-pack", 1},
          {"promethium-science-pack", 1},
        },
        time = 60
      },
      max_level = "infinite",
      upgrade = true
    },
    {
      type = "technology",
      name = "biter-egg-productivity-infinite",
      icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/biter-egg-handling.png"),
      icon_size = 256,
      effects =
      {
        {
          type = "change-recipe-productivity",
          recipe = "biter-egg",
          change = 0.05
        },
      },
      prerequisites = {"planet-discovery-interstellar"},
      unit =
      {
      count_formula = "1.5^L*1000",
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"military-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"alpha-science-pack", 1},
          {"beta-science-pack", 1},
          {"gamma-science-pack", 1},
          {"delta-science-pack", 1},
          {"epsilon-science-pack", 1},
          {"omega-science-pack", 1},
          {"promethium-science-pack", 1},
        },
        time = 60
      },
      max_level = "infinite",
      upgrade = true
    },
})
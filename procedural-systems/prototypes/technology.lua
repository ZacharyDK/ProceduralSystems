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
              recipe = "terra-asteroid-crushing",
            },
            {
              type = "unlock-recipe",
              recipe = "terra-asteroid-reprocessing",
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
          "planet-discovery-corrundum",
          "electrochemical-science-pack",
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
            {"electrochemical-science-pack", 1},
          },
          time = 60
        }
    },
    {
      type = "technology",
      name = "interstellar-processing",
      icon = "__procedural-systems__/graphics/icons/planet-icon-desat.png",
      icon_size = 64, --default is 256
      essential = true,
      effects =
      {   

          {
              type = "unlock-recipe",
              recipe = "froth-floatation-plant",
          },

          {
            type = "unlock-recipe",
            recipe = "blast-furnace",
          },

          {
            type = "unlock-recipe",
            recipe = "dangerous-cryogenic-plant",
          },

      },
      prerequisites = {"planet-discovery-interstellar"},
      unit =
      {
        count = 100,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"space-science-pack", 1},
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "froth-floatation-and-soaponification",
      icon = "__procedural-systems__/graphics/icons/froth-floatator.png",
      icon_size = 64, --default is 256
      essential = true,
      effects =
      {   
          --Froth floatation
          {
              type = "unlock-recipe",
              recipe = "covellite-froth",
          },
          {
            type = "unlock-recipe",
            recipe = "pyrite-froth",
          },
          {
            type = "unlock-recipe",
            recipe = "tenorite-froth",
          },
          {
            type = "unlock-recipe",
            recipe = "malachite-froth",
          },
          {
            type = "unlock-recipe",
            recipe = "siderite-froth",
          },
          {
            type = "unlock-recipe",
            recipe = "hematite-froth",
          },
          --Froth recovery
          {
            type = "unlock-recipe",
            recipe = "covellite-recovery",
          },
          {
            type = "unlock-recipe",
            recipe = "pyrite-recovery",
          },
          {
            type = "unlock-recipe",
            recipe = "tenorite-recovery",
          },
          {
            type = "unlock-recipe",
            recipe = "malachite-recovery",
          },
          {
            type = "unlock-recipe",
            recipe = "siderite-recovery",
          },
          {
            type = "unlock-recipe",
            recipe = "hematite-recovery",
          },
          --soaponification and gycerol recipes.
          {
            type = "unlock-recipe",
            recipe = "saponification-from-light-oil",
          },
          {
            type = "unlock-recipe",
            recipe = "glycerol-to-plastic",
          },
          {
            type = "unlock-recipe",
            recipe = "glycerol-to-fuel",
          },

      },
      prerequisites = {"interstellar-processing"},
      research_trigger = 
      {
        type = "build-entity",
        entity = "froth-floatation-plant",
      },
    },
    {
      type = "technology",
      name = "blasting-and-charcolation",
      icon = "__procedural-systems__/graphics/icons/blast-furnace.png",
      icon_size = 64, --default is 256
      essential = true,
      effects =
      {             
          
          { --Making fuel for this furnace
            type = "unlock-recipe",
            recipe = "blast-fuel",
          },
          --charcolation
          {
              type = "unlock-recipe",
              recipe = "glycerol-charcolation",
          },
          {
            type = "unlock-recipe",
            recipe = "fatty-acid-charcolation",
          },
          {
            type = "unlock-recipe",
            recipe = "solid-fuel-charcolation",
          },
          {
            type = "unlock-recipe",
            recipe = "wood-charcolation",
          },
          {
            type = "unlock-recipe",
            recipe = "petroleum-gas-charcolation",
          },
          {
            type = "unlock-recipe",
            recipe = "hematite-froth",
          },
          --recipes
          {
            type = "unlock-recipe",
            recipe = "copper-oxide-reduction",
          },
          {
            type = "unlock-recipe",
            recipe = "iron-oxide-reduction",
          },
          {
            type = "unlock-recipe",
            recipe = "copper-carbonate-to-oxide",
          },
          {
            type = "unlock-recipe",
            recipe = "iron-carbonate-to-oxide",
          },
          {
            type = "unlock-recipe",
            recipe = "copper-sulfide-to-oxide",
          },
          {
            type = "unlock-recipe",
            recipe = "iron-sulfide-to-oxide",
          },
          {
            type = "unlock-recipe",
            recipe = "copper-sulfide-to-oxide-chemistry",
          },
          {
            type = "unlock-recipe",
            recipe = "iron-sulfide-to-oxide-chemistry",
          },



      },
      prerequisites = {"interstellar-processing"},
      research_trigger = 
      {
        type = "build-entity",
        entity = "blast-furnace",
      },
    },
    {
      type = "technology",
      name = "intersellar-pressure-oxidation",
      icon = "__procedural-systems__/graphics/icons/planet-icon-desat.png",
      icon_size = 64, --default is 256
      essential = true,
      effects =
      {             
          
          { 
            type = "unlock-recipe",
            recipe = "copper-oxide-to-sulfate",
          },
          {
              type = "unlock-recipe",
              recipe = "iron-oxide-to-sulfate",
          },
          {
            type = "unlock-recipe",
            recipe = "copper-carbonate-to-sulfate",
          },
          {
            type = "unlock-recipe",
            recipe = "iron-carbonate-to-sulfate",
          },
          {
            type = "unlock-recipe",
            recipe = "copper-sulfide-to-sulfate",
          },
          {
            type = "unlock-recipe",
            recipe = "iron-sulfide-to-sulfate",
          },
          --Rough POX
          { 
            type = "unlock-recipe",
            recipe = "copper-oxide_rough_to_sulfate",
          },
          {
              type = "unlock-recipe",
              recipe = "iron-oxide_rough_to_sulfate",
          },
          {
            type = "unlock-recipe",
            recipe = "copper-carbonate_rough_to_sulfate",
          },
          {
            type = "unlock-recipe",
            recipe = "iron-carbonate_rough_to_sulfate",
          },
          {
            type = "unlock-recipe",
            recipe = "copper-sulfide_rough_to_sulfate",
          },
          {
            type = "unlock-recipe",
            recipe = "iron-sulfide_rough_to_sulfate",
          },


      },
      prerequisites = {"interstellar-processing"},
      research_trigger = 
      {
        type = "build-entity",
        entity = "catalytic-chemical-plant",
      },
    },
    {
      type = "technology",
      name = "intersellar-fluorination-and-pressure-washing",
      icon = "__procedural-systems__/graphics/technology/cryogenic-plant.png",
      icon_size = 256, --default is 256
      essential = true,
      effects =
      {             
          --Gangue
          { 
            type = "unlock-recipe",
            recipe = "slag-recycling",
          },
          {
              type = "unlock-recipe",
              recipe = "hydrofluoric-acid",
          },
          {
            type = "unlock-recipe",
            recipe = "calcium-sulfate-destruction",
          },
          {
            type = "unlock-recipe",
            recipe = "slag-destruction",
          },
          {
            type = "unlock-recipe",
            recipe = "fluorine-gas-from-acid",
          },
          {
            type = "unlock-recipe",
            recipe = "fluorine-gas-from-acid-danger",
          },
          { 
            type = "unlock-recipe",
            recipe = "fluoro-slag-destruction",
          },
          {
              type = "unlock-recipe",
              recipe = "dangerous-fluoro-slag-destruction",
          },
          {
            type = "unlock-recipe",
            recipe = "fluoro-detonation",
          },
          {
            type = "unlock-recipe",
            recipe = "dangerous-fluoroketone",
          },
          {
            type = "unlock-recipe",
            recipe = "covellite-pressure-washing",
          },
          {
            type = "unlock-recipe",
            recipe = "pyrite-pressure-washing",
          },
          {
            type = "unlock-recipe",
            recipe = "tenorite-pressure-washing",
          },
          {
            type = "unlock-recipe",
            recipe = "malachite-pressure-washing",
          },
          {
            type = "unlock-recipe",
            recipe = "siderite-pressure-washing",
          },
          {
            type = "unlock-recipe",
            recipe = "hematite-pressure-washing",
          },



      },
      prerequisites = {"interstellar-processing"},
      research_trigger = 
      {
        type = "build-entity",
        entity = "dangerous-cryogenic-plant",
      },
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
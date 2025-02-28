local seconds = 60
local minutes = 60*seconds
require ("util")


-- TODO ratios

data:extend(
{
  --Crafting
  {
    type = "recipe",
    name = "froth-floatation-plant",
    main_product = "froth-floatation-plant",
    category = "crafting",
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/froth-floatator.png",
        scale = 0.9,
        --shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 20,
    enabled = false,

    ingredients =
    {
      {type = "item", name = "electric-engine-unit", amount = 3},
      {type = "item", name = "chemical-plant", amount = 1},
      {type = "item", name = "storage-tank", amount = 1},
      {type = "item", name = "pipe", amount = 4},
      {type = "item", name = "steel-plate", amount = 12},
      {type = "item", name = "advanced-circuit", amount = 3},
      {type = "item", name = "copper-cable", amount = 4},
      {type = "item", name = "fast-inserter", amount = 1},
    },
    results = 
    {
      {type="item", name="froth-floatation-plant", amount=1},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = true,
  },
  {
    type = "recipe",
    name = "blast-furnace",
    main_product = "blast-furnace",
    category = "crafting",
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/blast-furnace.png",
        scale = 0.9,
        --shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 10,
    enabled = false,

    ingredients =
    {
      {type = "item", name = "steel-furnace", amount = 1},
      {type = "item", name = "pipe", amount = 2},
      {type = "item", name = "steel-plate", amount = 5},
      {type = "item", name = "electronic-circuit", amount = 2},
    },
    results = 
    {
      {type="item", name="blast-furnace", amount=1},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = true,
  },
  {
    type = "recipe",
    name = "dangerous-cryogenic-plant",
    main_product = "dangerous-cryogenic-plant",
    category = "crafting",
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/blast-furnace.png",
        scale = 0.9,
        --shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 15,
    enabled = false,

    ingredients =
    {
      {type = "item", name = "refined-concrete", amount = 20},
      {type = "item", name = "pipe", amount = 10},
      {type = "item", name = "steel-plate", amount = 30},
      {type = "item", name = "processing-unit", amount = 15},
      {type = "item", name = "battery", amount = 10},
      {type = "item", name = "copper-cable", amount = 5},
      {type = "item", name = "electric-engine-unit", amount = 5},
    },
    results = 
    {
      {type="item", name="dangerous-cryogenic-plant", amount=1},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = true,
  },

  
  --Saponification
  {
    type = "recipe",
    icon = "__proceduralsystems__/graphics/icons/fluid/glycerol-64.png",
    icon_size = 64,
    name = "saponification-from-light-oil",
    energy_required = 30,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type = "fluid", name = "sulfuric-acid-dilute", amount = 700},
      {type = "fluid", name = "light-oil", amount = 750}
    },
    results = 
    {
      {type="fluid", name="gycerol", amount=150},
      {type="fluid", name="fatty-acids", amount=450},
    },
    crafting_machine_tint =
    {
      primary = {r = 198, g = 198, b = 152, a = 1.000}, --rgb(198, 198, 152)
      secondary = {r = 202, g = 215, b = 140, a = 1.000}, --rgb(202, 215, 140)
      tertiary = {r = 228, g = 197, b = 151, a = 1.000}, --rgb(228, 197, 151)
      quaternary = {r = 255, g = 187, b = 73, a = 1.000}, --rgb(255, 187, 73)
    },
    allow_productivity = true,
    allow_quality = false, 
    main_product = "gycerol",
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "glycerol-to-plastic",
    icons = 
    {
      {
        icon = "__base__/graphics/icons/plastic-bar.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/fluid/glycerol-64.png",
        icon_size = 64,
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 12,
    enabled = false,
    category = "catalytic-chemistry",
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 1},
      {type = "fluid", name = "sulfuric-dilute", amount = 100},
      {type = "fluid", name = "glycerol", amount = 300},
    },
    results = 
    {
      {type="item", name="plastic-bar", amount=6},
    },
    crafting_machine_tint =
    {
      primary = {r = 198, g = 198, b = 152, a = 1.000}, --rgb(198, 198, 152)
      secondary = {r = 202, g = 215, b = 140, a = 1.000}, --rgb(202, 215, 140)
      tertiary = {r = 228, g = 197, b = 151, a = 1.000}, --rgb(228, 197, 151)
      quaternary = {r = 255, g = 187, b = 73, a = 1.000}, --rgb(255, 187, 73)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "plastic-bar",
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "glycerol-to-fuel",
    icons = 
    {
      {
        icon = "__base__/graphics/icons/solid-fuel.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/fluid/glycerol-64.png",
        icon_size = 64,
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 4,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type = "fluid", name = "fatty-acids", amount = 90},
      {type = "fluid", name = "glycerol", amount = 30},
    },
    results = 
    {
      {type="item", name="solid-fuel", amount=2},
    },
    crafting_machine_tint =
    {
      primary = {r = 198, g = 198, b = 152, a = 1.000}, --rgb(198, 198, 152)
      secondary = {r = 202, g = 215, b = 140, a = 1.000}, --rgb(202, 215, 140)
      tertiary = {r = 228, g = 197, b = 151, a = 1.000}, --rgb(228, 197, 151)
      quaternary = {r = 255, g = 187, b = 73, a = 1.000}, --rgb(255, 187, 73)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "solid-fuel",
    auto_recycle = false,
  },

  --Charcolation
  {
    type = "recipe",
    name = "glycerol-charcolation",
    icons = 
    {
      {
        icon = "__space-age__/graphics/icons/carbon.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/fluid/glycerol-64.png",
        icon_size = 64,
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 25,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type = "fluid", name = "glycerol", amount = 45},
    },
    results = 
    {
      {type="item", name="carbon", amount=1},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "carbon",
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "fatty-acid-charcolation",
    icons = 
    {
      {
        icon = "__space-age__/graphics/icons/carbon.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/fluid/alpha-linolenic-acid-64.png",
        icon_size = 64,
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 25,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type = "fluid", name = "fatty-acids", amount = 22},
    },
    results = 
    {
      {type="item", name="carbon", amount=1},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "carbon",
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "solid-fuel-charcolation",
    icons = 
    {
      {
        icon = "__space-age__/graphics/icons/carbon.png",
        scale = 0.9
      },
      {
        icon = "__base__/graphics/icons/solid-fuel.png",
        --icon_size = 64,
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 15,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type = "item", name = "solid-fuel", amount = 2},
    },
    results = 
    {
      {type="item", name="carbon", amount=2},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "carbon",
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "wood-charcolation",
    icons = 
    {
      {
        icon = "__space-age__/graphics/icons/wood.png",
        scale = 0.9
      },
      {
        icon = "__base__/graphics/icons/solid-fuel.png",
        --icon_size = 64,
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 22,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type = "item", name = "wood", amount = 5},
    },
    results = 
    {
      {type="item", name="carbon", amount=2},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "carbon",
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "petroleum-gas-charcolation",
    icons = 
    {
      {
        icon = "__space-age__/graphics/icons/carbon.png",
        scale = 0.9
      },
      {
        icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 25,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type = "fluid", name = "petroleum-gas", amount = 50},
    },
    results = 
    {
      {type="item", name="carbon", amount=1},
      {type = "fluid", name = "sulfur-dioxide", amount = 40},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "carbon",
    auto_recycle = false,
  },

  --Blast fuel
  {
    type = "recipe",
    name = "blast-fuel",
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/blast-fuel.png",
        scale = 0.9
      },
    },

    energy_required = 7,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type = "item", name = "solid-fuel", amount = 1},
      {type = "item", name = "carbon", amount = 4},
    },
    results = 
    {
      {type="item", name="blast-fuel", amount=1},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "blast-fuel",
    auto_recycle = false,
  },
  
  --Triangle.
  --Oxide to metal
  {
    type = "recipe",
    name = "copper-oxide-reduction",
    icons = 
    {
      {
        icon = "__base__/graphics/icons/copper-ore.png",
        scale = 0.9
      },
    },

    energy_required = 20,
    enabled = false,
    category = "blasting",
    ingredients =
    {
      {type = "item", name = "tenorite", amount = 4},
    },
    results = 
    {
      {type="item", name="copper-ore", amount = 3},
      {type = "item", name = "slag", amount = 1,probability = 0.1},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "copper-ore",
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "iron-oxide-reduction",
    icons = 
    {
      {
        icon = "__base__/graphics/icons/iron-ore.png",
        scale = 0.9
      },
    },

    energy_required = 20,
    enabled = false,
    category = "blasting",
    ingredients =
    {
      {type = "item", name = "hematite", amount = 4},
    },
    results = 
    {
      {type="item", name="iron-ore", amount = 3},
      {type = "item", name = "slag", amount = 1,probability = 0.17},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "iron-ore",
    auto_recycle = false,
  },
  --Carbonate to Oxide
  {
    type = "recipe",
    name = "copper-carbonate-to-oxide",
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/tenorite/tenorite-1.png",
        scale = 0.9
      },
    },

    energy_required = 15,
    enabled = false,
    category = "smelting",
    ingredients =
    {
      {type = "item", name = "malachite", amount = 4},
    },
    results = 
    {
      {type="item", name="tenorite", amount = 3, ignored_by_productivity = 2},
      {type = "item", name = "slag", amount = 1,probability = 0.1},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
    main_product = "tenorite",
  },
  {
    type = "recipe",
    name = "iron-carbonate-to-oxide",
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/hematite/hematite-1.png",
        scale = 0.9
      },
    },

    energy_required = 20,
    enabled = false,
    category = "smelting",
    ingredients =
    {
      {type = "item", name = "siderite", amount = 4},
    },
    results = 
    {
      {type="item", name="hematite", amount = 3, ignored_by_productivity = 2},
      {type = "item", name = "slag", amount = 1,probability = 0.17},
    },
    crafting_machine_tint =
    {
      primary = {r = 175, g = 63, b = 40, a = 1.000}, --rgb(175, 63, 40) --HEMATITE COLOR
      secondary = {r = 210, g = 76, b = 35, a = 1.000}, --rgb(210, 76, 35)
      tertiary = {r = 191, g = 128, b = 46, a = 1.000}, --rgb(191, 128, 46)
      quaternary = {r = 184, g = 81, b = 43, a = 1.000}, --rgb(184, 81, 43)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
    main_product = "hematite",
  },
  --Sulfide to Oxide Smelting
  {
    type = "recipe",
    name = "copper-sulfide-to-oxide",
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/tenorite/tenorite-1.png",
        scale = 0.9
      },
    },

    energy_required = 15,
    enabled = false,
    category = "smelting",
    ingredients =
    {
      {type = "item", name = "covellite", amount = 4},
    },
    results = 
    {
      {type="item", name="tenorite", amount = 3, ignored_by_productivity = 2},
      {type = "item", name = "slag", amount = 1,probability = 0.17},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
    main_product = "tenorite",
  },
  {
    type = "recipe",
    name = "iron-sulfide-to-oxide",
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/hematite/hematite-1.png",
        scale = 0.9
      },
    },

    energy_required = 20,
    enabled = false,
    category = "smelting",
    ingredients =
    {
      {type = "item", name = "pyrite", amount = 4},
    },
    results = 
    {
      {type="item", name="hematite", amount = 3, ignored_by_productivity = 2},
      {type = "item", name = "slag", amount = 1,probability = 0.17},
    },
    crafting_machine_tint =
    {
      primary = {r = 175, g = 63, b = 40, a = 1.000}, --rgb(175, 63, 40)
      secondary = {r = 210, g = 76, b = 35, a = 1.000}, --rgb(210, 76, 35)
      tertiary = {r = 191, g = 128, b = 46, a = 1.000}, --rgb(191, 128, 46)
      quaternary = {r = 184, g = 81, b = 43, a = 1.000}, --rgb(184, 81, 43)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
    main_product = "hematite",
  },
  --Sulfide to Oxide Chemistry.

  {
    type = "recipe",
    name = "copper-sulfide-to-oxide-chemistry",
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/tenorite/tenorite-1.png",
        scale = 0.9
      },
    },

    energy_required = 15,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type = "item", name = "covellite", amount = 4},
    },
    results = 
    {
      {type="item", name="tenorite", amount = 3, ignored_by_productivity = 2},
      {type = "item", name = "slag", amount = 1,probability = 0.17},
      {type = "fluid", name = "sulfur-dioxide", amount = 125, ignored_by_productivity = 80},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
    main_product = "tenorite",
  },
  {
    type = "recipe",
    name = "iron-sulfide-to-oxide-chemistry",
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/hematite/hematite-1.png",
        scale = 0.9
      },
    },

    energy_required = 20,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type = "item", name = "pyrite", amount = 4},
    },
    results = 
    {
      {type="item", name="hematite", amount = 3, ignored_by_productivity = 2},
      {type = "item", name = "slag", amount = 1,probability = 0.17},
      {type = "fluid", name = "sulfur-dioxide", amount = 125, ignored_by_productivity = 80},
    },
    crafting_machine_tint =
    {
      primary = {r = 175, g = 63, b = 40, a = 1.000}, --rgb(175, 63, 40)
      secondary = {r = 210, g = 76, b = 35, a = 1.000}, --rgb(210, 76, 35)
      tertiary = {r = 191, g = 128, b = 46, a = 1.000}, --rgb(191, 128, 46)
      quaternary = {r = 184, g = 81, b = 43, a = 1.000}, --rgb(184, 81, 43)
    },
    allow_productivity = true,
    allow_quality = true, 
    main_product = "hematite",
    auto_recycle = false,
  },

  --Conversion to Sulfate solutions.
  --oxide to sulfuate
  {
    type ="recipe",
    name ="copper-oxide-to-sulfate",
    category ="chemistry",
    energy_required = 9,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/copper-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/tenorite/tenorite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="tenorite", amount = 4},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="copper-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 1,probability = 0.07},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="copper-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 161, b = 246, a = 1.000}, --rgb(86, 161, 246)
      secondary = {r = 56, g = 136, b = 211, a = 1.000}, --rgb(56, 136, 211)
      tertiary = {r = 112, g = 146, b = 208, a = 1.000}, --rgb(112, 146, 208)
      quaternary = {r = 48, g = 147, b = 239, a = 1.000}, --rgb(48, 147, 239)
    },
  },
  {
    type ="recipe",
    name ="iron-oxide-to-sulfate",
    category ="chemistry",
    energy_required = 9,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/iron-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/hematite/hematite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="hematite", amount = 4},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="iron-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 1,probability = 0.07},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="iron-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 246, b = 230, a = 1.000}, --rgb(86, 246, 230)
      secondary = {r = 56, g = 211, b = 190, a = 1.000}, --rgb(56, 211, 190)
      tertiary = {r = 112, g = 208, b = 205, a = 1.000}, --rgb(112, 208, 205)
      quaternary = {r = 48, g = 239, b = 194, a = 1.000}, --rgb(48, 239, 194)
    },
  },

  --carbonate to sulfate
  {
    type ="recipe",
    name ="copper-carbonate-to-sulfate",
    category ="chemistry",
    energy_required = 5,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/copper-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/malachite/malachite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="malachite", amount = 4},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="copper-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 1,probability = 0.07},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="copper-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 161, b = 246, a = 1.000}, --rgb(86, 161, 246)
      secondary = {r = 56, g = 136, b = 211, a = 1.000}, --rgb(56, 136, 211)
      tertiary = {r = 112, g = 146, b = 208, a = 1.000}, --rgb(112, 146, 208)
      quaternary = {r = 48, g = 147, b = 239, a = 1.000}, --rgb(48, 147, 239)
    },
  },
  {
    type ="recipe",
    name ="iron-carbonate-to-sulfate",
    category ="chemistry",
    energy_required = 5,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/iron-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/siderite/siderite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="siderite", amount = 4},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="iron-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 1,probability = 0.07},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="iron-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 246, b = 230, a = 1.000}, --rgb(86, 246, 230)
      secondary = {r = 56, g = 211, b = 190, a = 1.000}, --rgb(56, 211, 190)
      tertiary = {r = 112, g = 208, b = 205, a = 1.000}, --rgb(112, 208, 205)
      quaternary = {r = 48, g = 239, b = 194, a = 1.000}, --rgb(48, 239, 194)
    },
  },

  --sulfide to sulfate
  {
    type ="recipe",
    name ="copper-sulfide-to-sulfate",
    category ="chemistry",
    energy_required = 15,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/copper-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/covellite/covellite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="covellite", amount = 4},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="copper-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 1,probability = 0.07},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="copper-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 161, b = 246, a = 1.000}, --rgb(86, 161, 246)
      secondary = {r = 56, g = 136, b = 211, a = 1.000}, --rgb(56, 136, 211)
      tertiary = {r = 112, g = 146, b = 208, a = 1.000}, --rgb(112, 146, 208)
      quaternary = {r = 48, g = 147, b = 239, a = 1.000}, --rgb(48, 147, 239)
    },
  },
  {
    type ="recipe",
    name ="iron-sulfide-to-sulfate",
    category ="chemistry",
    energy_required = 15,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/iron-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/pyrite/pyrite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="pyrite", amount = 4},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="iron-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 1,probability = 0.07},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="iron-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 246, b = 230, a = 1.000}, --rgb(86, 246, 230)
      secondary = {r = 56, g = 211, b = 190, a = 1.000}, --rgb(56, 211, 190)
      tertiary = {r = 112, g = 208, b = 205, a = 1.000}, --rgb(112, 208, 205)
      quaternary = {r = 48, g = 239, b = 194, a = 1.000}, --rgb(48, 239, 194)
    },
  },

  --Gangue(aka slag) processing and fluorine chemistry
  --Gangue is a waste product, that exists for the player to get rid off to keep the factory flowing.
  --It is both an element of ore processing in the real world, and a spike in difficulty
  {
    type ="recipe",
    name ="slag-recycling",
    category = "recycling-or-hand-crafting",
    energy_required = 3,
    subgroup = "fulgora-processes", --TODO add my own subprocess.
    order = "zzz[trash]-z[slag-recycling]",
    enabled = false,
    icons = 
    {
      {
        icon = "__quality__/graphics/icons/recycling.png"
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/slag/slag-1.png",
        scale = 0.4
      },
      {
        icon = "__quality__/graphics/icons/recycling-top.png"
      }
    },
    ingredients =
    {

      {type ="item", name ="slag", amount = 1},
    },


    results =
    {
      {type = "item", name = "slag", amount = 1,probability = 0.88},
    },
    allow_quality = false,
    allow_productivity = false,
    maximum_productivity = 1,
    main_product ="slag",
    auto_recycle = false,
  },
  {
    type ="recipe",
    name ="hydrofluoric-acid",
    category ="fluorination",
    energy_required = 6,
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/fluid/molecule-hydrofluoric-acid.png",
        scale = 0.9
      },
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="fluorite", amount = 3},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="hydrofluoric-acid", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "calcium-sulfate", amount = 3},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="hydrofluoric-acid",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 246, b = 153, a = 1.000}, --rgb(86, 246, 153)
      secondary = {r = 56, g = 211, b = 95, a = 1.000}, --rgb(56, 211, 95)
      tertiary = {r = 112, g = 208, b = 144, a = 1.000}, --rgb(112, 208, 144)
      quaternary = {r = 48, g = 239, b = 80, a = 1.000}, --rgb(48, 239, 80)
    },
  },
  {
    type ="recipe",
    name ="calcium-sulfate-destruction",
    category ="catalytic-chemistry",
    energy_required = 6,
    icons = 
    {
      {
        icon = "__corrundum__/graphics/icons/fluid/sulfur-dioxide.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/fluoride/fluoride-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="solid-fuel", amount = 3},
      {type ="item", name ="calcium-sulfate", amount = 3},
    },


    results =
    {
      {type ="fluid", name ="sulfur-dioxide", amount = 100, ignored_by_productivity = 50},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="sulfur-dioxide",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 198, g = 198, b = 152, a = 1.000}, --rgb(198, 198, 152)
      secondary = {r = 202, g = 215, b = 140, a = 1.000}, --rgb(202, 215, 140)
      tertiary = {r = 228, g = 197, b = 151, a = 1.000}, --rgb(228, 197, 151)
      quaternary = {r = 255, g = 187, b = 73, a = 1.000}, --rgb(255, 187, 73)
    },
  },
  {
    type ="recipe",
    name ="slag-destruction",
    category ="fluorination",
    energy_required = 8,
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/slag/slag-1.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/slash.png",
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="slag", amount = 1},
      {type ="fluid", name ="hydrofluoric-acid", amount = 10},
    },


    results =
    {
    },
    allow_quality =false,
    allow_productivity = false,
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
  },
  {
    type ="recipe",
    name ="fluorine-gas-from-acid",
    category ="fluorination",
    energy_required = 20,
    icons = 
    {
      {
        icon = "__space-age__/graphics/icons/fluid/fluorine.png",
        scale = 0.9
      },
    },

    enabled = false,
    ingredients =
    {
      {type ="fluid", name ="hydrofluoric-acid", amount = 100},
    },


    results =
    {
      {type ="fluid", name ="fluorine", amount = 50, ignored_by_productivity = 20},
      {type = "item", name = "fluorine-explosion", amount = 1, probability = 0.03},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="fluorine",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 246, b = 153, a = 1.000}, --rgb(86, 246, 153)
      secondary = {r = 56, g = 211, b = 95, a = 1.000}, --rgb(56, 211, 95)
      tertiary = {r = 112, g = 208, b = 144, a = 1.000}, --rgb(112, 208, 144)
      quaternary = {r = 48, g = 239, b = 80, a = 1.000}, --rgb(48, 239, 80)
    },
  },
  {
    type ="recipe",
    name ="fluorine-gas-from-acid-danger",
    category ="fluorination",
    energy_required = 10,
    icons = 
    {
      {
        icon = "__space-age__/graphics/icons/fluid/fluorine.png",
        scale = 0.9
      },
      {
        icon = "__base__/graphics/icons/explosion.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {
      {type ="fluid", name ="hydrofluoric-acid", amount = 200},
    },


    results =
    {
      {type ="fluid", name ="fluorine", amount = 100, ignored_by_productivity = 20},
      {type = "item", name = "fluorine-explosion", amount = 1, probability = 0.12},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="fluorine",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 246, b = 153, a = 1.000}, --rgb(86, 246, 153)
      secondary = {r = 56, g = 211, b = 95, a = 1.000}, --rgb(56, 211, 95)
      tertiary = {r = 112, g = 208, b = 144, a = 1.000}, --rgb(112, 208, 144)
      quaternary = {r = 48, g = 239, b = 80, a = 1.000}, --rgb(48, 239, 80)
    },
  },
  {
    type ="recipe",
    name ="fluoro-slag-destruction",
    category ="fluorination",
    energy_required = 12,
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/slag/slag-1.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/slash.png",
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="slag", amount = 15},
      {type ="item", name ="solid-fuel", amount = 1},
      {type ="fluid", name ="fluorine", amount = 25},
    },


    results =
    {
    },
    allow_quality =false,
    allow_productivity = false,
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
  },
  {
    type ="recipe",
    name ="dangerous-fluoro-slag-destruction",
    category ="fluorination",
    energy_required = 8,
    icons = 
    {
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/slag/slag-1.png",
        scale = 0.9
      },
      {
        icon = "__base__/graphics/icons/explosion.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      },
      {
        icon = "__proceduralsystems__/graphics/icons/slash.png",
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="slag", amount = 70},
      {type ="item", name ="solid-fuel", amount = 2},
      {type ="fluid", name ="fluorine", amount = 30},
    },


    results =
    {
      {type = "item", name = "fluorine-explosion", amount = 1, probability = 0.15},
    },
    allow_quality =false,
    allow_productivity = false,
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
  },
  {
    type ="recipe",
    name ="fluoro-detonation",
    category ="fluorination",
    energy_required = 2,
    icons = 
    {
      {
        icon = "__base__/graphics/icons/explosion.png",
        scale = 0.9,
      },
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="solid-fuel", amount = 3},
      {type ="fluid", name ="fluorine", amount = 50},
    },


    results =
    {
      {type = "item", name = "fluorine-explosion", amount = 1}
    },
    allow_quality =false,
    allow_productivity = true,
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
  },

  --Froth floatation
  {
    type = "recipe",
    name = "covellite-froth",
    main_product = "covellite-froth",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/fluid/blue.png,
        scale = 0.9,
      }
    },

    energy_required = 20,
    enabled = false,
    category = "froth-floatation",
    ingredients =
    {
      {type = "item", name = "covellite-rough", amount = 14},
      {type = "fluid", name = "glycerol", amount = 15},
      {type = "fluid", name = "fatty-acids", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
    },
    results = 
    {
      {type="fluid", name="covellite-froth", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
      {type = "item", name = "slag", amount = 10},
      {type = "item", name = "slag", amount = 4, probability = 0.2},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "pyrite-froth",
    main_product = "pyrite-froth",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/fluid/blue-gray.png,
        scale = 0.9,
      }
    },

    energy_required = 20,
    enabled = false,
    category = "froth-floatation",
    ingredients =
    {
      {type = "item", name = "pyrite-rough", amount = 14},
      {type = "fluid", name = "glycerol", amount = 15},
      {type = "fluid", name = "fatty-acids", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
    },
    results = 
    {
      {type="fluid", name="pyrite-froth", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
      {type = "item", name = "slag", amount = 10},
      {type = "item", name = "slag", amount = 4, probability = 0.2},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "tenorite-froth",
    main_product = "tenorite-froth",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/fluid/black.png,
        scale = 0.9,
      }
    },

    energy_required = 20,
    enabled = false,
    category = "froth-floatation",
    ingredients =
    {
      {type = "item", name = "tenorite-rough", amount = 14},
      {type = "fluid", name = "glycerol", amount = 15},
      {type = "fluid", name = "fatty-acids", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
    },
    results = 
    {
      {type="fluid", name="tenorite-froth", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
      {type = "item", name = "slag", amount = 10},
      {type = "item", name = "slag", amount = 4, probability = 0.2},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "malachite-froth",
    main_product = "malachite-froth",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/fluid/green.png,
        scale = 0.9,
      }
    },

    energy_required = 20,
    enabled = false,
    category = "froth-floatation",
    ingredients =
    {
      {type = "item", name = "malachite-rough", amount = 14},
      {type = "fluid", name = "glycerol", amount = 15},
      {type = "fluid", name = "fatty-acids", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
    },
    results = 
    {
      {type="fluid", name="malachite-froth", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
      {type = "item", name = "slag", amount = 10},
      {type = "item", name = "slag", amount = 4, probability = 0.2},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "siderite-froth",
    main_product = "siderite-froth",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/fluid/fluid-droplet-mineral-oil.png,
        scale = 0.9,
      }
    },

    energy_required = 20,
    enabled = false,
    category = "froth-floatation",
    ingredients =
    {
      {type = "item", name = "siderite-rough", amount = 14},
      {type = "fluid", name = "glycerol", amount = 15},
      {type = "fluid", name = "fatty-acids", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
    },
    results = 
    {
      {type="fluid", name="siderite-froth", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
      {type = "item", name = "slag", amount = 10},
      {type = "item", name = "slag", amount = 4, probability = 0.2},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "hematite-froth",
    main_product = "hematite-froth",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/fluid/red.png,
        scale = 0.9,
      }
    },

    energy_required = 20,
    enabled = false,
    category = "froth-floatation",
    ingredients =
    {
      {type = "item", name = "hematite-rough", amount = 14},
      {type = "fluid", name = "glycerol", amount = 15},
      {type = "fluid", name = "fatty-acids", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
    },
    results = 
    {
      {type="fluid", name="hematite-froth", amount = 200},
      {type = "fluid", name = "water", amount = 1500},
      {type = "item", name = "slag", amount = 10},
      {type = "item", name = "slag", amount = 4, probability = 0.2},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },

  --Froth Recovery
  {
    type = "recipe",
    name = "covellite-recovery",
    main_product = "covellite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/covellite/covellite-1.png,
        scale = 0.9,
      }
    },

    energy_required = 3,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type="fluid", name="covellite-froth", amount = 200},
    },
    results = 
    {
      {type = "item", name = "covellite", amount = 4},
      {type = "fluid", name = "fatty-acids", amount = 180},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  }, 
  {
    type = "recipe",
    name = "pyrite-recovery",
    main_product = "pyrite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/pyrite/pyrite-1.png,
        scale = 0.9,
      }
    },

    energy_required = 3,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type="fluid", name="pyrite-froth", amount = 200},
    },
    results = 
    {
      {type = "item", name = "pyrite", amount = 4},
      {type = "fluid", name = "fatty-acids", amount = 180},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "tenorite-recovery",
    main_product = "tenorite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/tenorite/tenorite-1.png,
        scale = 0.9,
      }
    },

    energy_required = 3,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type="fluid", name="tenorite-froth", amount = 200},
    },
    results = 
    {
      {type = "item", name = "tenorite", amount = 4},
      {type = "fluid", name = "fatty-acids", amount = 180},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },    
  {
    type = "recipe",
    name = "malachite-recovery",
    main_product = "malachite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/malachite/malachite-1.png,
        scale = 0.9,
      }
    },

    energy_required = 3,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type="fluid", name="malachite-froth", amount = 200},
    },
    results = 
    {
      {type = "item", name = "malachite", amount = 4},
      {type = "fluid", name = "fatty-acids", amount = 180},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "siderite-recovery",
    main_product = "siderite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/siderite/siderite-1.png,
        scale = 0.9,
      }
    },

    energy_required = 3,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type="fluid", name="siderite-froth", amount = 200},
    },
    results = 
    {
      {type = "item", name = "siderite", amount = 4},
      {type = "fluid", name = "fatty-acids", amount = 180},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },  
  {
    type = "recipe",
    name = "hematite-recovery",
    main_product = "hematite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/hematite/hematite-1.png,
        scale = 0.9,
      }
    },

    energy_required = 3,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      {type="fluid", name="hematite-froth", amount = 200},
    },
    results = 
    {
      {type = "item", name = "hematite", amount = 4},
      {type = "fluid", name = "fatty-acids", amount = 180},
    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = false,
    allow_quality = false, 
    auto_recycle = false,
  },

  --Brute force pressure oxidation. 
  --Makes lots of gangue, but you directly get sulfate solutions to make metals.

    --Conversion to Sulfate solutions.
  --oxide rough to sulfate
  {
    type ="recipe",
    name ="copper-oxide-rough-to-sulfate",
    category ="chemistry",
    energy_required = 18,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/copper-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/low-quality/tenorite/tenorite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="tenorite-rough", amount = 15},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="copper-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 15},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="copper-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 161, b = 246, a = 1.000}, --rgb(86, 161, 246)
      secondary = {r = 56, g = 136, b = 211, a = 1.000}, --rgb(56, 136, 211)
      tertiary = {r = 112, g = 146, b = 208, a = 1.000}, --rgb(112, 146, 208)
      quaternary = {r = 48, g = 147, b = 239, a = 1.000}, --rgb(48, 147, 239)
    },
  },
  {
    type ="recipe",
    name ="iron-oxide-rough-to-sulfate",
    category ="chemistry",
    energy_required = 18,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/iron-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/low-quality/hematite/hematite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="hematite-rough", amount = 15},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="iron-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 15},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="iron-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 246, b = 230, a = 1.000}, --rgb(86, 246, 230)
      secondary = {r = 56, g = 211, b = 190, a = 1.000}, --rgb(56, 211, 190)
      tertiary = {r = 112, g = 208, b = 205, a = 1.000}, --rgb(112, 208, 205)
      quaternary = {r = 48, g = 239, b = 194, a = 1.000}, --rgb(48, 239, 194)
    },
  },

  --carbonate rough to sulfate
  {
    type ="recipe",
    name ="copper-carbonate-rough-to-sulfate",
    category ="chemistry",
    energy_required = 10,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/copper-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/low-quality/malachite/malachite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="malachite-rough", amount = 15},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="copper-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 15},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="copper-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 161, b = 246, a = 1.000}, --rgb(86, 161, 246)
      secondary = {r = 56, g = 136, b = 211, a = 1.000}, --rgb(56, 136, 211)
      tertiary = {r = 112, g = 146, b = 208, a = 1.000}, --rgb(112, 146, 208)
      quaternary = {r = 48, g = 147, b = 239, a = 1.000}, --rgb(48, 147, 239)
    },
  },
  {
    type ="recipe",
    name ="iron-carbonate-rough-to-sulfate",
    category ="chemistry",
    energy_required = 10,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/iron-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/low-quality/siderite/siderite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="siderite-rough", amount = 15},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="iron-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 15},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="iron-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 246, b = 230, a = 1.000}, --rgb(86, 246, 230)
      secondary = {r = 56, g = 211, b = 190, a = 1.000}, --rgb(56, 211, 190)
      tertiary = {r = 112, g = 208, b = 205, a = 1.000}, --rgb(112, 208, 205)
      quaternary = {r = 48, g = 239, b = 194, a = 1.000}, --rgb(48, 239, 194)
    },
  },

  --sulfide rough to sulfate
  {
    type ="recipe",
    name ="copper-sulfide-rough-to-sulfate",
    category ="chemistry",
    energy_required = 30,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/copper-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/low-quality/covellite/covellite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="covellite-rough", amount = 15},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="copper-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 15},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="copper-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 161, b = 246, a = 1.000}, --rgb(86, 161, 246)
      secondary = {r = 56, g = 136, b = 211, a = 1.000}, --rgb(56, 136, 211)
      tertiary = {r = 112, g = 146, b = 208, a = 1.000}, --rgb(112, 146, 208)
      quaternary = {r = 48, g = 147, b = 239, a = 1.000}, --rgb(48, 147, 239)
    },
  },
  {
    type ="recipe",
    name ="iron-sulfide-rough-to-sulfate",
    category ="chemistry",
    energy_required = 30,
    icons = 
    {
      {
        icon ="__corrundum__/graphics/icons/fluid/iron-sulfate-solution.png",
        scale = 0.9
      },
      {
        icon = "__proceduralsystems__/graphics/icons/ores_malcom/low-quality/pyrite/pyrite-1.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    enabled = false,
    ingredients =
    {

      {type ="item", name ="pyrite-rough", amount = 15},
      {type ="fluid", name ="sulfuric-acid", amount = 300},
    },


    results =
    {
      {type ="fluid", name ="iron-sulfate-solution", amount = 300, ignored_by_productivity = 230},
      {type = "item", name = "slag", amount = 15},
    },
    allow_quality =false,
    maximum_productivity = 2,
    main_product ="iron-sulfate-solution",
    auto_recycle = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 246, b = 230, a = 1.000}, --rgb(86, 246, 230)
      secondary = {r = 56, g = 211, b = 190, a = 1.000}, --rgb(56, 211, 190)
      tertiary = {r = 112, g = 208, b = 205, a = 1.000}, --rgb(112, 208, 205)
      quaternary = {r = 48, g = 239, b = 194, a = 1.000}, --rgb(48, 239, 194)
    },
  },



  --Hydraulic pressure washing - emissions_multiplier of 8, we let the waste water run.

  {
    type = "recipe",
    name = "covellite-pressure-washing",
    main_product = "covellite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/covellite/covellite-1.png,
        scale = 0.9,
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 10,
    category = "hydraulic-washing",
    enabled = false,

    emissions_multiplier = 8,
    ingredients =
    {
      {type = "item", name = "covellite-rough", amount = 28},
      {type = "fluid", name = "water", amount = 400},
    },
    results = 
    {
      {type = "item", name = "covellite", amount = 4},
      {type = "item", name = "slag", amount = 15, probability = 0.3, ignored_by_productivity = 7},
      {type = "item", name = "slag", amount = 7, probability = 0.2, ignored_by_productivity = 6},
      {type = "item", name = "slag", amount = 17, probability = 0.2, ignored_by_productivity = 8},
      {type = "item", name = "slag", amount = 5, probability = 0.4, ignored_by_productivity = 3},

    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "hematite-pressure-washing",
    main_product = "hematite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/hematite/hematite-1.png,
        scale = 0.9,
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 10,
    category = "hydraulic-washing",
    enabled = false,

    emissions_multiplier = 8,
    ingredients =
    {
      {type = "item", name = "hematite-rough", amount = 28},
      {type = "fluid", name = "water", amount = 400},
    },
    results = 
    {
      {type = "item", name = "hematite", amount = 4},
      {type = "item", name = "slag", amount = 15, probability = 0.3, ignored_by_productivity = 7},
      {type = "item", name = "slag", amount = 7, probability = 0.2, ignored_by_productivity = 6},
      {type = "item", name = "slag", amount = 17, probability = 0.2, ignored_by_productivity = 8},
      {type = "item", name = "slag", amount = 5, probability = 0.4, ignored_by_productivity = 3},

    },
    crafting_machine_tint =
    {
      primary = {r = 175, g = 63, b = 40, a = 1.000}, --rgb(175, 63, 40)
      secondary = {r = 210, g = 76, b = 35, a = 1.000}, --rgb(210, 76, 35)
      tertiary = {r = 191, g = 128, b = 46, a = 1.000}, --rgb(191, 128, 46)
      quaternary = {r = 184, g = 81, b = 43, a = 1.000}, --rgb(184, 81, 43)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "malachite-pressure-washing",
    main_product = "malachite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/malachite/malachite-1.png,
        scale = 0.9,
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 10,
    category = "hydraulic-washing",
    enabled = false,

    emissions_multiplier = 8,
    ingredients =
    {
      {type = "item", name = "malachite-rough", amount = 28},
      {type = "fluid", name = "water", amount = 400},
    },
    results = 
    {
      {type = "item", name = "malachite", amount = 4},
      {type = "item", name = "slag", amount = 15, probability = 0.3, ignored_by_productivity = 7},
      {type = "item", name = "slag", amount = 7, probability = 0.2, ignored_by_productivity = 6},
      {type = "item", name = "slag", amount = 17, probability = 0.2, ignored_by_productivity = 8},
      {type = "item", name = "slag", amount = 5, probability = 0.4, ignored_by_productivity = 3},

    },
    crafting_machine_tint =
    {
      primary = {r = 86, g = 246, b = 230, a = 1.000}, --rgb(86, 246, 230)
      secondary = {r = 56, g = 211, b = 190, a = 1.000}, --rgb(56, 211, 190)
      tertiary = {r = 112, g = 208, b = 205, a = 1.000}, --rgb(112, 208, 205)
      quaternary = {r = 48, g = 239, b = 194, a = 1.000}, --rgb(48, 239, 194)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "pyrite-pressure-washing",
    main_product = "pyrite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/pyrite/pyrite-1.png,
        scale = 0.9,
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 10,
    category = "hydraulic-washing",
    enabled = false,

    emissions_multiplier = 8,
    ingredients =
    {
      {type = "item", name = "pyrite-rough", amount = 28},
      {type = "fluid", name = "water", amount = 400},
    },
    results = 
    {
      {type = "item", name = "pyrite", amount = 4},
      {type = "item", name = "slag", amount = 15, probability = 0.3, ignored_by_productivity = 7},
      {type = "item", name = "slag", amount = 7, probability = 0.2, ignored_by_productivity = 6},
      {type = "item", name = "slag", amount = 17, probability = 0.2, ignored_by_productivity = 8},
      {type = "item", name = "slag", amount = 5, probability = 0.4, ignored_by_productivity = 3},

    },
    crafting_machine_tint =
    {
      primary = {r = 86, g = 161, b = 246, a = 1.000}, --rgb(86, 161, 246)
      secondary = {r = 56, g = 136, b = 211, a = 1.000}, --rgb(56, 136, 211)
      tertiary = {r = 112, g = 146, b = 208, a = 1.000}, --rgb(112, 146, 208)
      quaternary = {r = 48, g = 147, b = 239, a = 1.000}, --rgb(48, 147, 239)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "siderite-pressure-washing",
    main_product = "siderite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/siderite/siderite-1.png,
        scale = 0.9,
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 10,
    category = "hydraulic-washing",
    enabled = false,

    emissions_multiplier = 8,
    ingredients =
    {
      {type = "item", name = "siderite-rough", amount = 28},
      {type = "fluid", name = "water", amount = 400},
    },
    results = 
    {
      {type = "item", name = "siderite", amount = 4},
      {type = "item", name = "slag", amount = 15, probability = 0.3, ignored_by_productivity = 7},
      {type = "item", name = "slag", amount = 7, probability = 0.2, ignored_by_productivity = 6},
      {type = "item", name = "slag", amount = 17, probability = 0.2, ignored_by_productivity = 8},
      {type = "item", name = "slag", amount = 5, probability = 0.4, ignored_by_productivity = 3},

    },
    crafting_machine_tint =
    {
      primary = {r = 175, g = 63, b = 40, a = 1.000}, --rgb(175, 63, 40)
      secondary = {r = 210, g = 76, b = 35, a = 1.000}, --rgb(210, 76, 35)
      tertiary = {r = 191, g = 128, b = 46, a = 1.000}, --rgb(191, 128, 46)
      quaternary = {r = 184, g = 81, b = 43, a = 1.000}, --rgb(184, 81, 43)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "tenorite-pressure-washing",
    main_product = "tenorite",
    icons = 
    {
      {
        icon = "__proceduralsystem__/graphics/icons/ores_malcom/tenorite/tenorite-1.png,
        scale = 0.9,
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.6,
        shift = util.by_pixel(140, 140),
      }
    },

    energy_required = 10,
    category = "hydraulic-washing",
    enabled = false,

    emissions_multiplier = 8,
    ingredients =
    {
      {type = "item", name = "tenorite-rough", amount = 28},
      {type = "fluid", name = "water", amount = 400},
    },
    results = 
    {
      {type = "item", name = "tenorite", amount = 4},
      {type = "item", name = "slag", amount = 15, probability = 0.3, ignored_by_productivity = 7},
      {type = "item", name = "slag", amount = 7, probability = 0.2, ignored_by_productivity = 6},
      {type = "item", name = "slag", amount = 17, probability = 0.2, ignored_by_productivity = 8},
      {type = "item", name = "slag", amount = 5, probability = 0.4, ignored_by_productivity = 3},

    },
    crafting_machine_tint =
    {
      primary = {r = 26, g = 26, b = 24, a = 1.000}, --rgb(26, 26, 24)
      secondary = {r = 70, g = 71, b = 65, a = 1.000}, --rgb(70, 71, 65)
      tertiary = {r = 85, g = 82, b = 78, a = 1.000}, --rgb(85, 82, 78)
      quaternary = {r = 67, g = 65, b = 62, a = 1.000}, --rgb(67, 65, 62)
    },
    allow_productivity = true,
    allow_quality = true, 
    auto_recycle = false,
  },

  --TODO consider preserving gangue water to repurifiy and reuse. 
  --Centrifudge recipes for alpha - omega ores. 
  --Procedural recipes for alpha - omega crystals.
  --Procedural recipes for alpha - omega science

  {
    type = "recipe",
    name = "dangerous-fluoroketone",
    icons = 
    {
      icon = "__space-age__/graphics/icon/fluid/fluoroketone-hot.png",
      scale = 0.9,
    }
    category = "fluorination",
    --subgroup = "aquilo-processes",
    --order = "z[fluoroketone]-e[fluoroketone]",
    auto_recycle = false,
    energy_required = 10,
    ingredients =
    {
      {type = "fluid", name = "fluorine", amount = 100},
      {type = "item", name = "solid-fuel", amount = 2},
      {type = "fluid", name = "petroleum-gas", amount = 100},
    },
    results = 
    {
      {type = "fluid", name = "fluoroketone-hot", amount = 40, temperature = 180},
      {type = "item", name = "fluorine-explosion", amount = 1, probability = 0.12, ignored_by_productivity = 9999},
    },
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 0.365, g = 0.815, b = 0.334, a = 1.000}, -- #5dcf55ff
      secondary = {r = 0.772, g = 0.394, b = 0.394, a = 1.000}, -- #c46464ff
      tertiary = {r = 0.116, g = 0.116, b = 0.111, a = 1.000}, -- #1d1d1cff
      quaternary = {r = 0.395, g = 0.717, b = 0.563, a = 1.000}, -- #64b68fff
    }
  },

  --Thurster and oxider barrel and unbarrel 
  --Note that you still have to make it in space.
  {
    type = "recipe",
    name = "thruster-fluid-barrel-p",
    category = "crafting-with-fluid",
    icons = 
    {
      icon = "__space-age__/graphics/icon/thruster-barrel-fill.png",
      scale = 0.9,
    }
    auto_recycle = false,
    energy_required = 1,
    ingredients =
    {
      {type = "fluid", name = "thruster-fuel", amount = 200},
      {type = "item", name = "barrel", amount = 1},
    },
    results = 
    {
      {type = "item", name = "thruster-barrel", amount = 1},
    },
    allow_productivity = false,
    allow_quality = false,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 175, g = 63, b = 40, a = 1.000}, --rgb(175, 63, 40) 
      secondary = {r = 210, g = 76, b = 35, a = 1.000}, --rgb(210, 76, 35)
      tertiary = {r = 191, g = 87, b = 46, a = 1.000}, --rgb(191, 87, 46)
      quaternary = {r = 184, g = 81, b = 43, a = 1.000}, --rgb(184, 81, 43)
    },
  },
  {
    type = "recipe",
    name = "thruster-fluid-barrel-empty-p",
    category = "crafting-with-fluid",
    icons = 
    {
      icon = "__space-age__/graphics/icon/thruster-barrel-empty.png",
      scale = 0.9,
    }
    auto_recycle = false,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "thruster-barrel", amount = 1},
    },
    results = 
    {
      {type = "fluid", name = "thruster-fuel", amount = 200},
      {type = "item", name = "barrel", amount = 1},
    },
    allow_productivity = false,
    allow_quality = false,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 175, g = 63, b = 40, a = 1.000}, --rgb(175, 63, 40) 
      secondary = {r = 210, g = 76, b = 35, a = 1.000}, --rgb(210, 76, 35)
      tertiary = {r = 191, g = 87, b = 46, a = 1.000}, --rgb(191, 87, 46)
      quaternary = {r = 184, g = 81, b = 43, a = 1.000}, --rgb(184, 81, 43)
    },
  },

  {
    type = "recipe",
    name = "oxidizer-fluid-barrel-p",
    category = "crafting-with-fluid",
    icons = 
    {
      icon = "__space-age__/graphics/icon/oxidizer-barrel-fill.png",
      scale = 0.9,
    }
    auto_recycle = false,
    energy_required = 1,
    ingredients =
    {
      {type = "fluid", name = "thruster-oxidizer", amount = 200},
      {type = "item", name = "barrel", amount = 1},
    },
    results = 
    {
      {type = "item", name = "oxidizer-barrel", amount = 1},
    },
    allow_productivity = false,
    allow_quality = false,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 161, b = 246, a = 1.000}, --rgb(86, 161, 246)
      secondary = {r = 56, g = 136, b = 211, a = 1.000}, --rgb(56, 136, 211)
      tertiary = {r = 112, g = 146, b = 208, a = 1.000}, --rgb(112, 146, 208)
      quaternary = {r = 48, g = 147, b = 239, a = 1.000}, --rgb(48, 147, 239)
    },
  },
  {
    type = "recipe",
    name = "oxidizer-fluid-barrel-empty-p",
    category = "crafting-with-fluid",
    icons = 
    {
      icon = "__space-age__/graphics/icon/oxidizer-barrel-empty.png",
      scale = 0.9,
    }
    auto_recycle = false,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "oxidizer-barrel", amount = 1},
    },
    results = 
    {
      {type = "fluid", name = "thruster-oxidizer", amount = 200},
      {type = "item", name = "barrel", amount = 1},
    },
    allow_productivity = false,
    allow_quality = false,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 86, g = 161, b = 246, a = 1.000}, --rgb(86, 161, 246)
      secondary = {r = 56, g = 136, b = 211, a = 1.000}, --rgb(56, 136, 211)
      tertiary = {r = 112, g = 146, b = 208, a = 1.000}, --rgb(112, 146, 208)
      quaternary = {r = 48, g = 147, b = 239, a = 1.000}, --rgb(48, 147, 239)
    },
  },
})
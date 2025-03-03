from luaparser import ast
from luaparser import astnodes
import json

src = """
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
        icon = "__procedural-systems__/graphics/icons/froth-floatator.png",
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
})
"""



tree = ast.parse(src)

for node in ast.walk(tree):
    if isinstance(node, astnodes.Name):
        print(node)

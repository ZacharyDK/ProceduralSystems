random_stream = require("__procedural-systems__/utility/random-stream")

local scrap_table =
{
    gear= 
    {
        item = {"fast-transport-belt","medium-electric-pole","pipe"},
        percent = 0.10,
    },
    fuel = 
    {
        item = {"solid-fuel","carbon","coal"},
        percent = 0.07,
    },
    concrete = 
    {
        item = {"concrete","stone-brick","refined-concrete"},
        percent = 0.06,
    },
    steel = 
    {
        item = {"steel-plate","storage-tank","empty-barrel"},
        percent = 0.04,
    },
    battery = 
    {
        item = {"battery","accumulator","laser-turret"},
        percent = 0.04,
    },
    copper = 
    {
        item = {"copper-cable","copper-plate","solar-panel"},
        percent = 0.04,
    },
    advanced_circuit = 
    {
        item = {"advanced-circuit","express-splitter","electric-furnace"},
        percent = 0.03,
    },
    processing_unit = 
    {
        item = {"processing-unit","rocket-turret","cargo-bay"},
        percent = 0.02,
    },
    low_density_structure = 
    {
        item = {"low-density-structure","plastic-bar"},
        percent = 0.01,
    },
}
--Needs 10% iron gear wheel. alpha ore etc at 6%

function create_scrap_recipe_base(in_scrap_item,in_tint,in_results)
    return
    {
        type = "recipe",
        name = in_scrap_item .. "-recycling",
        icons = {
          {
            icon = "__quality__/graphics/icons/recycling.png"
          },
          {
            icon = "__procedural-systems__/graphics/icons/scrap/scrap-1.png",
            scale = 0.4,
            tint = in_tint,
          },
          {
            icon = "__quality__/graphics/icons/recycling-top.png"
          }
        },
        category = "recycling-or-hand-crafting",
        subgroup = "fulgora-processes", --TODO add my own subprocess.
        order = "e[trash]-f[trash-recycling]",
        enabled = false,
        auto_recycle = false,
        energy_required = 0.2,
        ingredients = {{type = "item", name = in_scrap_item, amount = 1}},
        results = in_results
    }
end

results_a = {}
for k,v in pairs(scrap_table) do 
    percent = v.percent
    item = random_stream.pick_random_and_remove_from_table(v.item)
    table.insert(results_a, {type = "item", amount = 1, name = item, probability = percent}  )
end

table.insert(results_a, {type = "item", amount = 1, name = "iron-gear-wheel", probability = 0.16}) --have seperate alpha,beta etc ore.

results_b = {}
for k,v in pairs(scrap_table) do 
    percent = v.percent
    item = random_stream.pick_random_and_remove_from_table(v.item)

    table.insert(results_b, {type = "item", amount = 1, name = item, probability = percent}  )
end

table.insert(results_b, {type = "item", amount = 1, name = "iron-gear-wheel", probability = 0.16}) --have seperate ore.

--log(serpent.block("a="))
--log(serpent.block(results_a))
--log(serpent.block("b="))
--log(serpent.block(results_b))

data:extend(
{
    create_scrap_recipe_base("scrap_omega",{r = 102,  g = 18, b = 212, a = 1},results_a),
    create_scrap_recipe_base("scrap_epsilon",{r = 37,  g = 18, b = 230, a = 1},results_b),
})



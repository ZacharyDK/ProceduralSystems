require ("util")
random_stream = require("__procedural-systems__/utility/random-stream")

local procedural_science_table = 
{
    input_a = 
    {
        name = {"iron-plate","copper-plate","steel-plate","solid-fuel","plastic-bar","carbon","battery","sulfur"},
        amount_min = 2,
        amount_max = 3,
    },
    input_b = 
    {
        name = {"engine-unit","electric-engine-unit","rocket-fuel","advanced-circuit","fast-transport-belt","fast-inserter","power-switch","medium-electric-pole","pump"},
        amount_min = 2,
        amount_max = 2,
    },
    input_c =
    {
        name ={"pumpjack","electric-furnace","locomotive","chemical-plant","lab","assembling-machine-2","lightning-rod","explosive-rocket"},
        amount_min = 1,
        amount_max = 1,
    },
    input_d = 
    {
        name = {"speed-module","quality-module", "productivity-module","efficiency-module","solar-panel","cluster-grenade","destroyer-capsule","piercing-shotgun-shell","laser-turret","heating-tower"},
        amount_min = 1,
        amount_max = 1,
    }
}

ingredients_a = {}
for k,v in pairs(procedural_science_table) do 
    item = random_stream.pick_random_and_remove_from_table(v.name)
    cost = random_stream.random_bound(v.amount_min,v.amount_max)
    table.insert(ingredients_a, {type = "item", amount = cost, name = item}  )
end

ingredients_b = {}
for k,v in pairs(procedural_science_table) do 
    item = random_stream.pick_random_and_remove_from_table(v.name)
    cost = random_stream.random_bound(v.amount_min,v.amount_max)
    table.insert(ingredients_b, {type = "item", amount = cost, name = item}  )
end

ingredients_c = {}
for k,v in pairs(procedural_science_table) do 
    item = random_stream.pick_random_and_remove_from_table(v.name)
    cost = random_stream.random_bound(v.amount_min,v.amount_max)
    table.insert(ingredients_c, {type = "item", amount = cost, name = item}  )
end

ingredients_d = {}
for k,v in pairs(procedural_science_table) do 
    item = random_stream.pick_random_and_remove_from_table(v.name)
    cost = random_stream.random_bound(v.amount_min,v.amount_max)
    table.insert(ingredients_d, {type = "item", amount = cost, name = item}  )
end

ingredients_e = {}
for k,v in pairs(procedural_science_table) do 
    item = random_stream.pick_random_and_remove_from_table(v.name)
    cost = random_stream.random_bound(v.amount_min,v.amount_max)
    table.insert(ingredients_e, {type = "item", amount = cost, name = item}  )
end

ingredients_f = {}
for k,v in pairs(procedural_science_table) do 
    item = random_stream.pick_random_and_remove_from_table(v.name)
    cost = random_stream.random_bound(v.amount_min,v.amount_max)
    table.insert(ingredients_f, {type = "item", amount = cost, name = item}  )
end

function create_procedural_science_recipe(prefix_name,in_tint,in_order,in_ingredients)
    local out = 
    {
        type = "recipe",
        name = prefix_name .. "-science-pack",
        energy_required = 20,
        enabled = false,
        category = "crafting-with-fluid-or-metallurgy",
        ingredients = in_ingredients,

        icons = 
        {
            {
            icon = "__procedural-systems__/graphics/icons/" .. prefix_name .. "-64.png",
            --tint = input_tint, --Maybe revert?
            }
        },

        subgroup = "procedural-science-pack",
        order = in_order,
        results =
        {
            {
                type = "item",
                name = prefix_name .. "-science-pack",
                amount = 5
            },
        },
        allow_productivity = true,

    }

    local crystal_input =
    {
        type = "item", 
        name = "procedural-crystal-" ..  prefix_name,
        amount = 1
    }

    table.insert(out.ingredients, crystal_input  )
    return out
end

function create_procedural_ore_concentration_recipe(prefix_name,input_tint, in_order)
return {
    
    type = "recipe",
    name = prefix_name .. "-processing",
    energy_required = 12,
    enabled = false,
    category = "centrifuging",
    ingredients = 
    {
        {
            type = "item", 
            name = prefix_name .. "_ore_raw",
            amount = 10
        }
    },
    icons = 
    {
      {
        icon = "__procedural-systems__/graphics/icons/procedural-concentrate.png",
        tint = input_tint,
      }
    },

    subgroup = "procedural-refined",
    order = in_order,
    results =
    {
        {
            type = "item",
            name = prefix_name .. "-ore-concentrate",
            amount = 1
        },
        {
            type = "item",
            name = "stone",
            probability = 0.3,
            amount = 1
        },
        {
            type = "item",
            name = "slag",
            probability = 0.7,
            amount_min = 1,
            amount_max = 3,
        }
    },
    allow_productivity = true

}
end


function create_procedural_crystal_recipe(postfix_name,input_tint, in_order)
return {
    
    type = "recipe",
    name = "procedural-crystal-" .. postfix_name,
    energy_required = 15,
    enabled = false,
    category = "chemistry",
    ingredients = 
    {
        {
            type = "item", 
            name = postfix_name .. "-ore-concentrate",
            amount = 10,
        },
        {
            type = "fluid", 
            name = "water",
            amount = 100,
        }
    },
    icons = 
    {
        {
            icon = "__procedural-systems__/graphics/icons/ores_malcom/procedural-crystal/procedural-crystal-4.png",
            tint = input_tint,
        }
    },

    subgroup = "procedural-refined",
    order = in_order,
    results =
    {
        {
            type = "item",
            name = "procedural-crystal-" .. postfix_name,
            amount = 5
        },

    },
    allow_productivity = true

}
end

--TODO crystal creation. 10 concetrate  , 100 water, get 5 crystal

data:extend(
{
    create_procedural_ore_concentration_recipe("alpha", {r = 200, g = 0,  b = 0, a = 1},"a"), --rgb(200, 0, 0)
    create_procedural_ore_concentration_recipe("beta", {r = 222,g = 138,  b = 20,  a = 1},"b"), --rgb(222, 138, 20)
    create_procedural_ore_concentration_recipe("gamma", {r = 232, g = 221, b = 12, a = 1},"c"), --rgb(232, 221, 12)
    create_procedural_ore_concentration_recipe("delta", {r = 0,  g = 200,b = 0, a = 1},"d"), --rgb(0, 200, 0)
    create_procedural_ore_concentration_recipe("epsilon",{r = 37,  g = 18, b = 230, a = 1},"e"), --rgb(37, 42, 230)
    create_procedural_ore_concentration_recipe("omega", {r = 102,  g = 18, b = 212, a = 1},"f"), --rgb(102, 18, 212)

    create_procedural_science_recipe("alpha", {r = 200, g = 0,  b = 0, a = 1},"a",ingredients_a), --rgb(200, 0, 0)
    create_procedural_science_recipe("beta", {r = 222,g = 138,  b = 20,  a = 1},"b",ingredients_b), --rgb(222, 138, 20)
    create_procedural_science_recipe("gamma", {r = 232, g = 221, b = 12, a = 1},"c",ingredients_c), --rgb(232, 221, 12)
    create_procedural_science_recipe("delta", {r = 0,  g = 200,b = 0, a = 1},"d",ingredients_d), --rgb(0, 200, 0)
    create_procedural_science_recipe("epsilon",{r = 37,  g = 18, b = 230, a = 1},"e",ingredients_e), --rgb(37, 42, 230)
    create_procedural_science_recipe("omega", {r = 102,  g = 18, b = 212, a = 1},"f",ingredients_f), --rgb(102, 18, 212)

    create_procedural_crystal_recipe("alpha", {r = 200, g = 0,  b = 0, a = 1},"a"), --rgb(200, 0, 0)
    create_procedural_crystal_recipe("beta", {r = 222,g = 138,  b = 20,  a = 1},"b"), --rgb(222, 138, 20)
    create_procedural_crystal_recipe("gamma", {r = 232, g = 221, b = 12, a = 1},"c"), --rgb(232, 221, 12)
    create_procedural_crystal_recipe("delta", {r = 0,  g = 200,b = 0, a = 1},"d"), --rgb(0, 200, 0)
    create_procedural_crystal_recipe("epsilon",{r = 37,  g = 18, b = 230, a = 1},"e"), --rgb(37, 42, 230)
    create_procedural_crystal_recipe("omega", {r = 102,  g = 18, b = 212, a = 1},"f"), --rgb(102, 18, 212)
})
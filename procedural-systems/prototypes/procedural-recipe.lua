require ("util")

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
            name = prefix_name .. "-ore-raw",
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

data:extend(
{
    create_procedural_ore_concentration_recipe("alpha", {r = 200, g = 0,  b = 0, a = 1},"a"), --rgb(200, 0, 0)
    create_procedural_ore_concentration_recipe("beta", {r = 222,g = 138,  b = 20,  a = 1},"b"), --rgb(222, 138, 20)
    create_procedural_ore_concentration_recipe("gamma", {r = 232, g = 221, b = 12, a = 1},"c"), --rgb(232, 221, 12)
    create_procedural_ore_concentration_recipe("delta", {r = 0,  g = 200,b = 0, a = 1},"d"), --rgb(0, 200, 0)
    create_procedural_ore_concentration_recipe("epilson",{r = 37,  g = 18, b = 230, a = 1},"e"), --rgb(37, 42, 230)
    create_procedural_ore_concentration_recipe("omega", {r = 102,  g = 18, b = 212, a = 1},"f"), --rgb(102, 18, 212)

})
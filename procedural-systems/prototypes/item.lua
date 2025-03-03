local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
local meld = require("meld")
--local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
--local simulations_corrundum = require("__corrundum__.prototypes.factoriopedia-simulations")

local explosionEffect = table.deepcopy(data.raw.explosion["big-explosion"])

explosionEffect.name = "fluorine-explosion"
explosionEffect.localised_name = { "entity-name.fluorine-explosion" }
explosionEffect.icons = {
  { icon = "__base__/graphics/icons/explosion.png" },
}

data:extend { explosionEffect }


function create_procedural_raw_ore_entry(prefix_name, input_tint, in_order)
return {
  type = "item",
  name = prefix_name .. "-ore-raw",
  icons = 
  {
    {
      icon = "__procedural-systems__/graphics/icons/procedural-ore.png",
      tint = input_tint,
    }
  },
  pictures =
  {
    { size = 64, filename = "__procedural-systems__/graphics/icons/procedural-ore.png",   scale = 0.5, mipmap_count = 4, tint = input_tint},
    { size = 64, filename = "__procedural-systems__/graphics/icons/procedural-ore-1.png", scale = 0.5, mipmap_count = 4, tint = input_tint},
    { size = 64, filename = "__procedural-systems__/graphics/icons/procedural-ore-2.png", scale = 0.5, mipmap_count = 4, tint = input_tint},
    { size = 64, filename = "__procedural-systems__/graphics/icons/procedural-ore-3.png", scale = 0.5, mipmap_count = 4, tint = input_tint }
  },
  order = in_order,
  subgroup = "procedural-ore", --I'd prefer if these were below aquilo...
  color_hint = { text = "T" },

  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  default_import_location = "nauvis", --TODO
  weight = 10*kg
}
end

function create_single_sprite_tinted_entry(input_name, subpath,input_tint, in_order)
  fullpath = "__procedural-systems__/graphics/icons/" .. subpath
  return {
    type = "item",
    name = input_name,
    icons = 
    {
      {
        icon = fullpath,
        tint = input_tint,
      }
    },
    pictures =
    {
      { size = 64, filename = fullpath,   scale = 0.5, mipmap_count = 4, tint = input_tint},
    },
    order = in_order,
    subgroup = "procedural-refined", --I'd prefer if these were below aquilo...
    color_hint = { text = "T" },

    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "nauvis", --TODO
    weight = 10*kg
  }
end

function create_picture_table(path_root,base_name,num_pictures)
  local out_table = {}
  local i = 0
  while i < num_pictures do
    local string_number = tostring(i+1)
    local path = path_root .. base_name .. "-" .. string_number .. ".png"
    local row  = {size = 64, filename = path,   scale = 0.5, mipmap_count = 4}
    table.insert(out_table,row)
    i = i + 1
  end
  return out_table
end

function create_item_picture_table_assit(input_name, subfolder, name_postfix, num_pictures, in_order)

  picture_table_root = "__procedural-systems__/graphics/icons/" .. subfolder .. "/" .. input_name .. "/"
  icon_path = picture_table_root .. input_name .. "-1.png"
  picture_table = create_picture_table(picture_table_root,input_name,num_pictures)
  return {
    type = "item",
    name = input_name .. name_postfix,
    icons = 
    {
      {
        icon = icon_path,
      }
    },
    pictures = picture_table,

    order = in_order,
    subgroup = "expert-refining", --I'd prefer if these were below aquilo...
    color_hint = { text = "T" },

    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "nauvis", --TODO
    weight = 2*kg
  }
end

function create_picture_table_tinted(path_root,base_name,num_pictures,in_tint)
  local out_table = {}
  local i = 0
  while i < num_pictures do
    local string_number = tostring(i+1)
    local path = path_root .. base_name .. "-" .. string_number .. ".png"
    local row  = {size = 64, filename = path,   scale = 0.5, mipmap_count = 4,tint = in_tint}
    table.insert(out_table,row)
    i = i + 1
  end
  return out_table
end

function create_item_picture_table_assit_tinted(input_name, subfolder, name_postfix, num_pictures, in_order, in_tint)

  picture_table_root = "__procedural-systems__/graphics/icons/" .. subfolder .. "/" .. input_name .. "/"
  icon_path = picture_table_root .. input_name .. "-1.png"
  picture_table = create_picture_table_tinted(picture_table_root,input_name,num_pictures,in_tint)
  return {
    type = "item",
    name = input_name .. name_postfix,
    icons = 
    {
      {
        icon = icon_path,
        tint = in_tint,
      }
    },
    pictures = picture_table,

    order = in_order,
    subgroup = "procedural-product",
    color_hint = { text = "T" },

    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "nauvis", --TODO
    weight = 2*kg
  }
end

data:extend(
{
    {
        type = "tool",
        name = "alpha-science-pack",
        localised_description = {"item-description.science-pack"},
        icon = "__procedural-systems__/graphics/icons/alpha-64.png",
        icon_size = 64,
        subgroup = "procedural-science-pack",
        color_hint = { text = "Y" },
        order = "a",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        default_import_location = "nauvis", -- TODO
        weight = 1*kg,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        random_tint_color = item_tints.bluish_science
    },
    {
      type = "tool",
      name = "beta-science-pack",
      localised_description = {"item-description.science-pack"},
      icon = "__procedural-systems__/graphics/icons/beta-64.png",
      icon_size = 64,
      subgroup = "procedural-science-pack",
      color_hint = { text = "Y" },
      order = "b",
      inventory_move_sound = item_sounds.science_inventory_move,
      pick_sound = item_sounds.science_inventory_pickup,
      drop_sound = item_sounds.science_inventory_move,
      stack_size = 200,
      default_import_location = "nauvis", -- TODO
      weight = 1*kg,
      durability = 1,
      durability_description_key = "description.science-pack-remaining-amount-key",
      factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
      durability_description_value = "description.science-pack-remaining-amount-value",
      random_tint_color = item_tints.bluish_science
    },
    {
      type = "tool",
      name = "gamma-science-pack",
      localised_description = {"item-description.science-pack"},
      icon = "__procedural-systems__/graphics/icons/gamma-64.png",
      icon_size = 64,
      subgroup = "procedural-science-pack",
      color_hint = { text = "Y" },
      order = "c",
      inventory_move_sound = item_sounds.science_inventory_move,
      pick_sound = item_sounds.science_inventory_pickup,
      drop_sound = item_sounds.science_inventory_move,
      stack_size = 200,
      default_import_location = "nauvis", -- TODO
      weight = 1*kg,
      durability = 1,
      durability_description_key = "description.science-pack-remaining-amount-key",
      factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
      durability_description_value = "description.science-pack-remaining-amount-value",
      random_tint_color = item_tints.bluish_science
    },
    {
      type = "tool",
      name = "delta-science-pack",
      localised_description = {"item-description.science-pack"},
      icon = "__procedural-systems__/graphics/icons/delta-64.png",
      icon_size = 64,
      subgroup = "procedural-science-pack",
      color_hint = { text = "Y" },
      order = "d",
      inventory_move_sound = item_sounds.science_inventory_move,
      pick_sound = item_sounds.science_inventory_pickup,
      drop_sound = item_sounds.science_inventory_move,
      stack_size = 200,
      default_import_location = "nauvis", -- TODO
      weight = 1*kg,
      durability = 1,
      durability_description_key = "description.science-pack-remaining-amount-key",
      factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
      durability_description_value = "description.science-pack-remaining-amount-value",
      random_tint_color = item_tints.bluish_science
    },
    {
      type = "tool",
      name = "epilson-science-pack",
      localised_description = {"item-description.science-pack"},
      icon = "__procedural-systems__/graphics/icons/epilson-64.png",
      icon_size = 64,
      subgroup = "procedural-science-pack",
      color_hint = { text = "Y" },
      order = "e",
      inventory_move_sound = item_sounds.science_inventory_move,
      pick_sound = item_sounds.science_inventory_pickup,
      drop_sound = item_sounds.science_inventory_move,
      stack_size = 200,
      default_import_location = "nauvis", -- TODO
      weight = 1*kg,
      durability = 1,
      durability_description_key = "description.science-pack-remaining-amount-key",
      factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
      durability_description_value = "description.science-pack-remaining-amount-value",
      random_tint_color = item_tints.bluish_science
    },
    {
      type = "tool",
      name = "omega-science-pack",
      localised_description = {"item-description.science-pack"},
      icon = "__procedural-systems__/graphics/icons/omega-64.png",
      icon_size = 64,
      subgroup = "procedural-science-pack",
      color_hint = { text = "Y" },
      order = "f",
      inventory_move_sound = item_sounds.science_inventory_move,
      pick_sound = item_sounds.science_inventory_pickup,
      drop_sound = item_sounds.science_inventory_move,
      stack_size = 200,
      default_import_location = "nauvis", -- TODO
      weight = 1*kg,
      durability = 1,
      durability_description_key = "description.science-pack-remaining-amount-key",
      factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
      durability_description_value = "description.science-pack-remaining-amount-value",
      random_tint_color = item_tints.bluish_science
    },

    create_procedural_raw_ore_entry("alpha", {r = 200, g = 0,  b = 0, a = 1},"a"), --rgb(200, 0, 0)
    create_procedural_raw_ore_entry("beta", {r = 222,g = 138,  b = 20,  a = 1},"b"), --rgb(222, 138, 20)
    create_procedural_raw_ore_entry("gamma", {r = 232, g = 221, b = 12, a = 1},"c"), --rgb(232, 221, 12)
    create_procedural_raw_ore_entry("delta", {r = 0,  g = 200,b = 0, a = 1},"d"), --rgb(0, 200, 0)
    create_procedural_raw_ore_entry("epilson",{r = 37,  g = 18, b = 230, a = 1},"e"), --rgb(37, 42, 230)
    create_procedural_raw_ore_entry("omega", {r = 102,  g = 18, b = 212, a = 1},"f"), --rgb(102, 18, 212)

    create_single_sprite_tinted_entry("alpha-ore-concentrate", "procedural-concentrate.png",  {r = 200, g = 0,  b = 0, a = 1},"a"),   --rgb(200, 0, 0)
    create_single_sprite_tinted_entry("beta-ore-concentrate", "procedural-concentrate.png", {r = 222,  g = 138, b = 20, a = 1},"b"),  --rgb(222, 138, 20)
    create_single_sprite_tinted_entry("gamma-ore-concentrate", "procedural-concentrate.png", {r = 232, g = 221,  b = 12, a = 1},"c"), --rgb(232, 221, 12)
    create_single_sprite_tinted_entry("delta-ore-concentrate", "procedural-concentrate.png", {r = 0, g = 200, b = 0, a = 1},"d"),    --rgb(0, 200, 0)
    create_single_sprite_tinted_entry("epilson-ore-concentrate","procedural-concentrate.png", {r = 37,  g = 18, b = 230, a = 1},"e"), --rgb(37, 42, 230)
    create_single_sprite_tinted_entry("omega-ore-concentrate", "procedural-concentrate.png", {r = 102,  g = 18, b = 212, a = 1},"f"), --rgb(102, 18, 212)

    create_item_picture_table_assit("slag","ores_malcom","",1,"z"),

    create_item_picture_table_assit("covellite","ores_malcom","",3,"b"),
    create_item_picture_table_assit("hematite","ores_malcom","", 3,"c"),
    create_item_picture_table_assit("malachite","ores_malcom","", 4,"f"),
    create_item_picture_table_assit("pyrite","ores_malcom","", 3, "a"),
    create_item_picture_table_assit("siderite","ores_malcom","",3,"e"),
    create_item_picture_table_assit("tenorite","ores_malcom","",4,"d"),
    
    create_item_picture_table_assit("fluorite","ores_malcom","",3,"z"),

    create_item_picture_table_assit("covellite","ores_malcom/low-quality","-rough",3,"h"),
    create_item_picture_table_assit("hematite","ores_malcom/low-quality","-rough", 3,"i"),
    create_item_picture_table_assit("malachite","ores_malcom/low-quality","-rough", 4,"l"),
    create_item_picture_table_assit("pyrite","ores_malcom/low-quality","-rough", 3,"g"),
    create_item_picture_table_assit("siderite","ores_malcom/low-quality","-rough",3,"k"),
    create_item_picture_table_assit("tenorite","ores_malcom/low-quality","-rough",4,"j"),

    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-alpha",4,"a",{r = 200, g = 0,  b = 0, a = 1}),
    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-beta",4,"b",{r = 222,  g = 138, b = 20, a = 1}),
    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-gamma",4,"c",{r = 232, g = 221,  b = 12, a = 1}),
    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-delta",4,"d",{r = 0, g = 200, b = 0, a = 1}),
    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-epilson",4,"e",{r = 37,  g = 18, b = 230, a = 1}),
    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-omega",4,"f",{r = 102,  g = 18, b = 212, a = 1}),

    {
      type = "item",
      name = "blast-furnace",
      icon = "__procedural-systems__/graphics/icons/blast-furnace.png",
      subgroup = "smelting-machine",
      order = "z[steel-furnace]",
      inventory_move_sound = item_sounds.metal_large_inventory_move,
      pick_sound = item_sounds.metal_large_inventory_pickup,
      drop_sound = item_sounds.metal_large_inventory_move,
      place_result = "blast-furnace",
      stack_size = 50,
      default_import_location = "nauvis",
    },
    {
      type = "item",
      name = "dangerous-cryogenic-plant",
      icon = "__procedural-systems__/graphics/icons/cryogenic-plant.png",
      subgroup = "production-machine",
      order = "z[cryogenic-plant]",
      inventory_move_sound = item_sounds.mechanical_large_inventory_move,
      pick_sound = item_sounds.mechanical_large_inventory_pickup,
      drop_sound = item_sounds.mechanical_large_inventory_move,
      place_result = "dangerous-cryogenic-plant",
      stack_size = 20,
      default_import_location = "aquilo", --TODO
      weight = 200 * kg
    },
    {
      type = "item",
      name = "froth-floatation-plant",
      icon = "__procedural-systems__/graphics/icons/froth-floatator.png",
      subgroup = "production-machine",
      order = "w[chemical-plant]",
      inventory_move_sound = item_sounds.fluid_inventory_move,
      pick_sound = item_sounds.fluid_inventory_pickup,
      drop_sound = item_sounds.fluid_inventory_move,
      place_result = "froth-floatation-plant",
      stack_size = 5,
      weight = 50 * kg,
      default_import_location = "nauvis",
    },
    {
      type = "item",
      name = "blast-fuel",
      icon = "__procedural-systems__/graphics/icons/blast-fuel.png",
      fuel_category = "chemical",
      fuel_value = "12.2MJ",
      fuel_acceleration_multiplier = 0.9,
      fuel_top_speed_multiplier = 1.00,
      subgroup = "raw-material",
      order = "b[chemistry]-b[blast-fuel]",
      inventory_move_sound = item_sounds.solid_fuel_inventory_move,
      pick_sound = item_sounds.solid_fuel_inventory_pickup,
      drop_sound = item_sounds.solid_fuel_inventory_move,
      stack_size = 50,
      weight = 1 * kg,
      random_tint_color = item_tints.yellowing_coal
    },
    {
      type = "item",
      name = "fluorine-explosion",
      icon = "__base__/graphics/icons/explosion.png",
      subgroup = "procedural-science-pack", --I want this to be at the bottom
      order = "zzzzzz",
      inventory_move_sound = item_sounds.solid_fuel_inventory_move,
      pick_sound = item_sounds.solid_fuel_inventory_pickup,
      drop_sound = item_sounds.solid_fuel_inventory_move,
      stack_size = 50,
      weight = 1 * kg,
      random_tint_color = item_tints.yellowing_coal,
      spoil_ticks = 1,
      spoil_to_trigger_result = 
      {
        items_per_trigger = 1,
        trigger = 
        {
          type = "direct",
          action_delivery = 
          {
            type = "instant",
            target_effects = 
            {
              {
                type = "create-explosion",
                entity_name = "fluorine-explosion",
              },
              {
                type = "nested-result",
                action = 
                {
                  type = "area",
                  radius = 10,
                  target_entities = true,
                  action_delivery = 
                  {
                    type = "instant",
                    target_effects = 
                    {
                      {
                        type = "damage",
                        damage = 
                        {
                          amount = 1000,
                          type = "explosion",
                        },
                        apply_damage_to_trees = true,
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

    },
    {
      type = "item",
      name = "thruster-barrel",
      icon = "__procedural-systems__/graphics/icons/thruster-barrel-fill.png",
      subgroup = "space-related",
      order = "e[thruster]",
      inventory_move_sound = item_sounds.fluid_inventory_move,
      pick_sound = item_sounds.fluid_inventory_pickup,
      drop_sound = item_sounds.fluid_inventory_move,
      stack_size = 10,
      weight = 8 * kg,
      random_tint_color = item_tints.yellowing_coal
    },
    {
      type = "item",
      name = "oxidizer-barrel",
      icon = "__procedural-systems__/graphics/icons/oxidizer-barrel-fill.png",
      subgroup = "space-related",
      order = "f[oxidizer]",
      inventory_move_sound = item_sounds.fluid_inventory_move,
      pick_sound = item_sounds.fluid_inventory_pickup,
      drop_sound = item_sounds.fluid_inventory_move,
      stack_size = 10,
      weight = 8 * kg,
      random_tint_color = item_tints.yellowing_coal
    },
    {
      type = "item",
      name = "terra-asteroid-chunk",
      icon = "__procedural-systems__/graphics/icons/terra-asteroid-chunk.png",
      subgroup = "space-material",
      order = "t[terra]-e[chunk]",
      inventory_move_sound = space_age_item_sounds.rock_inventory_move,
      pick_sound = space_age_item_sounds.rock_inventory_pickup,
      drop_sound = space_age_item_sounds.rock_inventory_move,
      stack_size = 1,
      weight = 100 * kg,
      random_tint_color = item_tints.iron_rust,
    },
}

)
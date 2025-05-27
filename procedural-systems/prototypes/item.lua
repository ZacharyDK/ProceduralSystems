local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
local meld = require("meld")
--local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
--local simulations_corrundum = require("__corrundum__.prototypes.factoriopedia-simulations")

--Moved to mineral chemistry, but I'll keep a reference here.
--[[
local explosionEffect = table.deepcopy(data.raw.explosion["big-explosion"])

explosionEffect.name = "fluorine-explosion"
explosionEffect.localised_name = { "entity-name.fluorine-explosion" }
explosionEffect.icons = {
  { icon = "__base__/graphics/icons/explosion.png" },
}

data:extend { explosionEffect }
--]]

function create_procedural_raw_ore_entry(prefix_name, input_tint, in_order)
return {
  type = "item",
  name = prefix_name .. "_ore_raw",
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

  picture_table_root = "__mineral-chemistry__/graphics/icons/" .. subfolder .. "/" .. input_name .. "/"
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
      name = "epsilon-science-pack",
      localised_description = {"item-description.science-pack"},
      icon = "__procedural-systems__/graphics/icons/epsilon-64.png",
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
    create_procedural_raw_ore_entry("epsilon",{r = 37,  g = 18, b = 230, a = 1},"e"), --rgb(37, 42, 230)
    create_procedural_raw_ore_entry("omega", {r = 102,  g = 18, b = 212, a = 1},"f"), --rgb(102, 18, 212)

    create_single_sprite_tinted_entry("alpha-ore-concentrate", "procedural-concentrate.png",  {r = 200, g = 0,  b = 0, a = 1},"a"),   --rgb(200, 0, 0)
    create_single_sprite_tinted_entry("beta-ore-concentrate", "procedural-concentrate.png", {r = 222,  g = 138, b = 20, a = 1},"b"),  --rgb(222, 138, 20)
    create_single_sprite_tinted_entry("gamma-ore-concentrate", "procedural-concentrate.png", {r = 232, g = 221,  b = 12, a = 1},"c"), --rgb(232, 221, 12)
    create_single_sprite_tinted_entry("delta-ore-concentrate", "procedural-concentrate.png", {r = 0, g = 200, b = 0, a = 1},"d"),    --rgb(0, 200, 0)
    create_single_sprite_tinted_entry("epsilon-ore-concentrate","procedural-concentrate.png", {r = 37,  g = 18, b = 230, a = 1},"e"), --rgb(37, 42, 230)
    create_single_sprite_tinted_entry("omega-ore-concentrate", "procedural-concentrate.png", {r = 102,  g = 18, b = 212, a = 1},"f"), --rgb(102, 18, 212)

   

    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-alpha",4,"a",{r = 200, g = 0,  b = 0, a = 1}),
    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-beta",4,"b",{r = 222,  g = 138, b = 20, a = 1}),
    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-gamma",4,"c",{r = 232, g = 221,  b = 12, a = 1}),
    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-delta",4,"d",{r = 0, g = 200, b = 0, a = 1}),
    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-epsilon",4,"e",{r = 37,  g = 18, b = 230, a = 1}),
    create_item_picture_table_assit_tinted("procedural-crystal","ores_malcom","-omega",4,"f",{r = 102,  g = 18, b = 212, a = 1}),

    create_item_picture_table_assit_tinted("scrap","","_epsilon",6,"z",{r = 37,  g = 18, b = 230, a = 1}),
    create_item_picture_table_assit_tinted("scrap","","_omega",6,"y",{r = 102,  g = 18, b = 212, a = 1}),


}

)
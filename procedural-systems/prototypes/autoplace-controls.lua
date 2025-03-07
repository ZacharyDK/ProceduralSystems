local function create_autoplace_control(input_name)
  return
  {
    type = "autoplace-control",
    name = input_name,
    localised_name = 
    {
      "", 
      "[entity=" .. input_name .. "]", 
      {"entity-name." .. input_name}
    },
    richness = true,
    order = "b-d",
    category = "resource"
  } 
end

data:extend(
{
  create_autoplace_control("petroleum-geyser-p"),
  create_autoplace_control("steam-geyser-p"),
  create_autoplace_control("water-geyser-p"),

  create_autoplace_control("covellite"),
  create_autoplace_control("malachite"),
  create_autoplace_control("tenorite"),
  create_autoplace_control("pyrite"),
  create_autoplace_control("siderite"),
  create_autoplace_control("hematite"),

  create_autoplace_control("covellite_rough"),
  create_autoplace_control("malachite_rough"),
  create_autoplace_control("tenorite_rough"),
  create_autoplace_control("pyrite_rough"),
  create_autoplace_control("siderite_rough"),
  create_autoplace_control("hematite_rough"),

  create_autoplace_control("fluorite"),

  create_autoplace_control("alpha_ore_raw"),
  create_autoplace_control("beta_ore_raw"), 
  create_autoplace_control("gamma_ore_raw"),
  create_autoplace_control("delta_ore_raw"),
  create_autoplace_control("epilson_ore_raw"),
  create_autoplace_control("omega_ore_raw"),

  {
    type = "autoplace-control",
    name = "procedural_volcanism",
    order = "c-z-a",
    category = "terrain",
    can_be_disabled = false
  },
}
)



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

  create_autoplace_control("covellite-rough"),
  create_autoplace_control("malachite-rough"),
  create_autoplace_control("tenorite-rough"),
  create_autoplace_control("pyrite-rough"),
  create_autoplace_control("siderite-rough"),
  create_autoplace_control("hematite-rough"),

  create_autoplace_control("fluorite"),

  create_autoplace_control("alpha-ore-raw"),
  create_autoplace_control("beta-ore-raw"), 
  create_autoplace_control("gamma-ore-raw"),
  create_autoplace_control("delta-ore-raw"),
  create_autoplace_control("epilson-ore-raw"),
  create_autoplace_control("omega-ore-raw"),


}
)



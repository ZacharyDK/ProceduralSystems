
require("__procedural-systems__.prototypes.planet.api")
local asteroid_util = require("__procedural-systems__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:extend({
    {
        type = "space-location",
        name = "main-system-alpha-edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        starmap_icon = "__space-age__/graphics/icons/solar-system-edge.png",
        gravity_pull = -10,
        magnitude = 1.0,
        label_orientation = 0.15,
        tier = 4,
        orbit = 
        {
            parent = 
            {
                type = "space-location",
                name = "star",
            },
            distance = 50, --default edge.
            orientation = 0.5,
        },
        sprite_only = false,
        --Doesn't work with planets lib this way?
        --asteroid_spawn_influence = 1,
        --asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip)
    },

})

data:extend({
	{
		type = "space-connection",
		name = "fulgora-to-main-second-edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
		subgroup = "planet-connections",
		from = "fulgora",
		to = "main-system-alpha-edge",
		order = "c",
		length = 50000,
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip),
        redrawn_connections_exclude = true,
        redrawn_connections_keep = true,
	},
})


local water_a_preset = 
{
    surface_liquid = "water",
    surface_liquid_amount = "moderate",
    major_feature = {"crude_oil_p"},
    minor_feature = {"calcite_p","sulfur_ore_p","petroleum_geyser_p","coal_p"},
    distance_min = 17,
    distance_max = 25,
}

local desert_a_preset = 
{
    surface_liquid = "water",
    surface_liquid_amount = "barren",
    major_feature = {"steam_geyser_p"},
    minor_feature = {"crude_oil_p","petroleum_geyser_p"},
    distance_min = 15,
    distance_max = 20,
}

--[[
local ocean_a_preset = 
{
    surface_liquid = "ammoniacal-solution",
    surface_liquid_amount = "oceanic",
    major_feature = {"petroleum_geyser_p"},
    minor_feature = {"tungsten-uranium-platinum"}, 
    distance_min = 35,
    distance_max = 40,
    require_heating = true,
}
--]]

local lake_b_preset = 
{
    surface_liquid = "sulfuric-acid-dilute",
    surface_liquid_amount = "very-high",
    major_feature = {"calcite_p"},
    minor_feature = {"petroleum_geyser_p"},
    distance_min = 25,
    distance_max = 30,
}

local lake_a_preset = 
{
    surface_liquid = "light-oil",
    surface_liquid_amount = "very-high",
    major_feature = {"steam_geyser_p"},
    minor_feature = {"petroleum_geyser_p"},
    distance_min = 20,
    distance_max = 30,
}
        

local scrap_a_preset = 
{
    surface_liquid = "water",
    surface_liquid_amount = "oceanic",
    major_feature = {"crude_oil_p"},
    minor_feature = {"calcite_p","sulfur_ore_p","petroleum_geyser_p","coal_p"},
    distance_min = 23,
    distance_max = 27,
}


local alpha_system =
{
    star_name = "alpha_p",
}

local alpha_system_connections = 
{
    destination = "main-system-alpha-edge",
}

Procedural.water_a_preset = water_a_preset
Procedural.desert_a_preset = desert_a_preset
Procedural.lake_b_preset = lake_b_preset
Procedural.lake_a_preset = lake_a_preset
Procedural.scrap_a_preset = scrap_a_preset
 
Procedural:create_star_system_framework(alpha_system,alpha_system_connections)
Procedural:generate_planet("alpha",{r = 250,g = 100, b = 100},water_a_preset,{ additional_resources = {"fluorite","alpha_ore_raw","siderite","malachite","hematite"},parent ="alpha_p"})
Procedural:generate_planet("beta",{r = 250,  g = 155, b = 20, a = 1},desert_a_preset,{ additional_resources = {"fluorite","beta_ore_raw","pyrite","covellite","tenorite"},parent ="alpha_p"})
Procedural:generate_planet("gamma",{r = 232, g = 221, b = 12, a = 1},lake_a_preset,{ additional_resources = {"fluorite","gamma_ore_raw","hematite_rough","tenorite_rough","pyrite_rough","covellite_rough"},parent ="alpha_p"})
Procedural:generate_planet("delta",{r = 0, g = 180, b = 0, a = 1},lake_b_preset,{ additional_resources = {"fluorite","delta_ore_raw", "siderite_rough","malachite_rough","pyrite_rough","covellite_rough"},parent ="alpha_p"})
Procedural:generate_planet("epsilon",{r = 37,  g = 18, b = 230, a = 1},scrap_a_preset,{ additional_resources = {"fluorite","epsilon_ore_raw","scrap_epsilon"},parent ="alpha_p"})
Procedural:generate_planet("omega",{r = 102,  g = 18, b = 212, a = 1},scrap_a_preset,{ additional_resources = {"fluorite","omega_ore_raw","scrap_omega"},parent ="alpha_p"})

--temporary connections to enusre functional prototype. Mapping out how to connect things is not trivial.
data:extend({
	{
		type = "space-connection",
		name = "alpha-edge-to-alpha",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
		subgroup = "planet-connections",
		from = "alpha_p_system_edge",
		to = "alpha",
		order = "c",
		length = 50000,
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip),
        redrawn_connections_exclude = false,
        redrawn_connections_keep = false,
	},
    {
		type = "space-connection",
		name = "alpha-edge-to-beta",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
		subgroup = "planet-connections",
		from = "alpha_p_system_edge",
		to = "beta",
		order = "c",
		length = 50000,
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip),
        redrawn_connections_exclude = false,
        redrawn_connections_keep = false,
	},
    {
		type = "space-connection",
		name = "alpha-edge-to-gamma",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
		subgroup = "planet-connections",
		from = "alpha_p_system_edge",
		to = "gamma",
		order = "c",
		length = 50000,
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip),
        redrawn_connections_exclude = false,
        redrawn_connections_keep = false,
	},
    {
		type = "space-connection",
		name = "alpha-edge-to-delta",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
		subgroup = "planet-connections",
		from = "alpha_p_system_edge",
		to = "delta",
		order = "c",
		length = 50000,
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip),
        redrawn_connections_exclude = false,
        redrawn_connections_keep = false,
	},
    {
		type = "space-connection",
		name = "alpha-edge-to-epsilon",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
		subgroup = "planet-connections",
		from = "alpha_p_system_edge",
		to = "epsilon",
		order = "c",
		length = 50000,
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip),
        redrawn_connections_exclude = false,
        redrawn_connections_keep = false,
	},
    {
		type = "space-connection",
		name = "alpha-edge-to-omega",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
		subgroup = "planet-connections",
		from = "alpha_p_system_edge",
		to = "omega",
		order = "c",
		length = 50000,
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip),
        redrawn_connections_exclude = false,
        redrawn_connections_keep = false,
	},
})
local planet_map_gen = require("__procedural-systems__/prototypes/planet/procedural-planet-map-gen")
local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local asteroid_util = require("__procedural-systems__.prototypes.planet.asteroid-spawn-definitions")
local tile_maker = require("__procedural-systems__.prototypes.planet.tiles-procedural")

PlanetsLib:extend({
    {
        type = "space-location",
        name = "main-system-alpha-edge",
        starmap_icon = "__space-age__/graphics/icons/solar-system-edge.png",
        magnitude = 1.0,
        orbit = 
        {
            parent = 
            {
                type = "space-location",
                name = "star",
            },
            distance = 50, --default edge.
            orientation = 0.75,
        },
        sprite_only = true,
    },
    --[[
    {
        type = "space-location",
        name = "alpha-main-lagrange",
        starmap_icon = "__space-age__/graphics/icons/solar-system-edge.png",
        magnitude = 1.0,
        orbit = 
        {
            parent = 
            {
                type = "space-location",
                name = "star",
            },
            distance = 150, 
            orientation = 0.75,
        },
        sprite_only = true,
    },
    --]]
    --]]
    --[[
    {
        type = "planet",
        name = "alpha-test",
        orbit = 
        {
            parent =
            {
                type = "space-location",
                name = "star"
            },
            distance = 20,
            orientation = 0.3,
        },
        --subgroup = "planets",
        label_orientation = 0.55,
        icon = "__procedural-systems__/graphics/icons/planet-icon-desat.png",
        icon_size = 64,
        starmap_icon = "__procedural-systems__/graphics/planet/starmap-planet-desat.png",
        starmap_icon_size = 512,
        map_gen_settings = planet_map_gen.procedural("alpha",{"fluorite","alpha_ore_raw","covellite","siderite"}),
        gravity_pull = 20,
		draw_orbit = false,
		magnitude = 1,
		order = "q[procedural]-a[alpha]",
		pollutant_type = nil,
		solar_power_in_space = 200,
		platform_procession_set = {
			arrival = { "planet-to-platform-b" },
			departure = { "platform-to-planet-a" },
		},
		planet_procession_set = {
			arrival = { "platform-to-planet-b" },
			departure = { "planet-to-platform-a" },
		},
		procession_graphic_catalogue = planet_catalogue_vulcanus,
		surface_properties = {
			["day-night-cycle"] = 10 * 60 * 60,
			["magnetic-field"] = 30, -- Fulgora is 99
			["solar-power"] = 50, -- No atmosphere
			pressure = 5,
			gravity = 20, -- 0.1 is minimum for chests
			--temperature = 251,
		},
		asteroid_spawn_influence = 1,
		asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora, 0.9),
		persistent_ambient_sounds = {},
		surface_render_parameters = {
			shadow_opacity = 0.1, 
		},
    }
    --]]
})

data:extend({
	{
		type = "space-connection",
		name = "fulgora-to-main-second-edge",
		subgroup = "planet-connections",
		from = "fulgora",
		to = "main-system-alpha-edge",
		order = "c",
		length = 40000,
		asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_edge),
	},
})


local function create_star_system_framework(in_system_parameters,in_connection_parameters)
    local star_parent_name = in_system_parameters.parant_star or "star"
    PlanetsLib:extend({
        {
            type = "space-location",
            name = in_system_parameters.star_name,
            starmap_icon = in_system_parameters.starmap_icon or "__procedural-systems__/graphics/star/starmap-star-red.png",
            starmap_icon_size = in_system_parameters.starmap_icon_size or 512,
            magnitude = in_system_parameters.magnitude or 10.0,
            orbit = 
            {
                parent = 
                {
                    type = "space-location",
                    name = in_system_parameters.parant_star or "star",
                },
                distance = in_system_parameters.distance or 250,
                orientation = in_system_parameters.orientation or 0.75,
            },
            sprite_only = true,
        },
        {
            type = "space-location",
            name = in_system_parameters.star_name .. "_system_edge",
            starmap_icon = "__space-age__/graphics/icons/solar-system-edge.png",
            magnitude = 1.0,
            orbit = 
            {
                parent = 
                {
                    type = "space-location",
                    name = in_system_parameters.star_name,
                },
                distance = in_system_parameters.radius or 50,
                orientation = (in_system_parameters.orientation - 0.5) or 0.25,
            },
            sprite_only = true,
        },
    })
    data:extend({
        {
            type = "space-connection",
            name = star_parent_name .. "_to_" .. in_system_parameters.star_name .. "_connection",
            subgroup = "planet-connections",
            from = in_connection_parameters.origin or (in_system_parameters.star_name .. "_system_edge"),
            to = in_connection_parameters.destination,
            order = "c",
            length = in_connection_parameters.connection_length or 250000,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.procedural_system_edge_langrange),
        },
    })
end

local function create_planet(in_planet_parameters)
    PlanetsLib:extend({
        {
            type = "planet",
            name = in_planet_parameters.name,
            orbit = 
            {
                parent =
                {
                    type = "space-location",
                    name = in_planet_parameters.parent
                },
                distance = in_planet_parameters.parent_distance or 20,
                orientation = in_planet_parameters.orientation or 0.3,
            },
            --subgroup = "planets",
            label_orientation = 0.55,
            icon = in_planet_parameters.icon or "__procedural-systems__/graphics/icons/planet-icon-desat.png",
            icons = in_planet_parameters.icons or {},
            icon_size = in_planet_parameters.icon_size or 64,
            starmap_icon = "__procedural-systems__/graphics/planet/starmap-planet-desat.png",
            starmap_icon_size = in_planet_parameters.starmap_icon or 512,
            map_gen_settings = planet_map_gen.procedural(in_planet_parameters.name,in_planet_parameters.resources),
            gravity_pull = in_planet_parameters.gravity_pull or 10,
            draw_orbit = false,
            magnitude = 1,
            order = "q[procedural]-a[" .. in_planet_parameters.name .. "]",
            pollutant_type = nil,
            solar_power_in_space = 200,
            platform_procession_set = {
                arrival = { "planet-to-platform-b" },
                departure = { "platform-to-planet-a" },
            },
            planet_procession_set = {
                arrival = { "platform-to-planet-b" },
                departure = { "planet-to-platform-a" },
            },
            procession_graphic_catalogue = planet_catalogue_vulcanus,
            surface_properties = {
                ["day-night-cycle"] = in_planet_parameters.day_night_cycle or 10 * 60 * 60,
                ["magnetic-field"] = in_planet_parameters.magnetic_field or 30, -- Fulgora is 99
                ["solar-power"] = in_planet_parameters.solar_power or 50, -- No atmosphere
                pressure = in_planet_parameters.pressure or 5,
                gravity = in_planet_parameters.gravity or 20, 
                --temperature = 251,
            },
            asteroid_spawn_influence = 1,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.procedural_system_inter_planets, 0.9),
            persistent_ambient_sounds = {},
            surface_render_parameters = {
                shadow_opacity = 0.1, 
            },
        }
    })
end
local planet_map_gen = require("__procedural-systems__/prototypes/planet/procedural-planet-map-gen")
local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:extend({
    --[[
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
    {
        type = "space-location",
        name = "alpha-star-p",
        starmap_icon = "__procedural-systems__/graphics/star/starmap-star-red.png",
        starmap_icon_size = 512,
        magnitude = 10.0,
        orbit = 
        {
            parent = 
            {
                type = "space-location",
                name = "star",
            },
            distance = 250,
            orientation = 0.75,
        },
        sprite_only = true,
    },
    {
        type = "space-location",
        name = "alpha-system-edge-p",
        starmap_icon = "__space-age__/graphics/icons/solar-system-edge.png",
        magnitude = 1.0,
        orbit = 
        {
            parent = 
            {
                type = "space-location",
                name = "alpha-star-p",
            },
            distance = 50,
            orientation = 0.5,
        },
        sprite_only = true,
    },
    --]]
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
        map_gen_settings = planet_map_gen.procedural("alpha",{}),
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

})

data:extend({
	{
		type = "space-connection",
		name = "test",
		subgroup = "planet-connections",
		from = "fulgora",
		to = "alpha-test",
		order = "c",
		length = 8000,
		asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora),
	},
})

local planet_map_gen = require("__procedural-systems__/prototypes/planet/procedural-planet-map-gen")
local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local asteroid_util = require("__procedural-systems__.prototypes.planet.asteroid-spawn-definitions")
local tile_maker = require("__procedural-systems__.prototypes.planet.tiles-procedural")
random_stream = require("__procedural-systems__/utility/random-stream")

Procedural:generate_planet_tile_set = tile_maker.generate_planet_tile_set

local solar_distance_table = --key distance, value solar power in space. Used from space ages values
{
    ["10"] = 600,
    ["15"] = 300,
    ["20"] = 200,
    ["25"] = 120,
    ["35"] = 60,
    ["50"] = 1,
    ["80"] = 0.1,
    ["10000"] = 0,
}

function Procedural:calculate_solar_power_in_space(in_distance,in_star_multiplier)
    local x_1 = 0
    local y_1 = 0
    local x_2 = 0
    local y_2 = 0

    for k,v in pairs(solar_distance_table) do
        if(in_distance < tonumber(k)) then
            x_2 = tonumber(k)
            y_2 = v
            break
        end
        x_1 = tonumber(k) --last nums
        y_1 = v


    end

    --in_distance is x
    --out_distance is y
    out_distance = (x_2 - x_1 / y_2 - y_1)*(in_distance - x_1) + y_1
    out_distance = out_distance*in_star_multiplier
    return out_distance

end

function Procedural:create_star_system_framework(in_system_parameters,in_connection_parameters)
    local star_parent_name = in_system_parameters.parent_star or "star"
    PlanetsLib:extend({
        {
            type = "space-location",
            name = in_system_parameters.star_name,
            starmap_icon = in_system_parameters.starmap_icon or "__procedural-systems__/graphics/star/starmap-star-red.png",
            starmap_icon_size = in_system_parameters.starmap_icon_size or 512,
            magnitude = in_system_parameters.magnitude or 10.0,
            icon = "__space-age__/graphics/icons/solar-system-edge.png", -- temp
            orbit = 
            {
                parent = 
                {
                    type = "space-location",
                    name = in_system_parameters.parent_star or "star",
                },
                distance = in_system_parameters.distance or 250,
                orientation = in_system_parameters.orientation or 0.5,
            },
            sprite_only = false,
            tier = -1,
            redrawn_connections_exclude = true,
            --asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip, 0.9),
        },
        {
            type = "space-location",
            name = in_system_parameters.star_name .. "_system_edge",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
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
                orientation = ((in_system_parameters.orientation or 0.5) - 0.5),
            },
            --sprite_only = true,
            tier = -1,
        },
    })
    data:extend({
        {
            type = "space-connection",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            name = star_parent_name .. "_to_" .. in_system_parameters.star_name .. "_connection",
            subgroup = "planet-connections",
            from = in_connection_parameters.origin or (in_system_parameters.star_name .. "_system_edge"),
            to = in_connection_parameters.destination,
            order = "c",
            length = in_connection_parameters.connection_length or 250000,
            asteroid_spawn_influence = 1,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip),
            redrawn_connections_exclude = true,
            redrawn_connections_keep = true,
        },
    })
end

function Procedural:extend_planet(in_planet_parameters)
    local solar_polar_space = Procedural:calculate_solar_power_in_space((in_planet_parameters.parent_distance or 20),0.9 )
    PlanetsLib:extend({
        {
            type = "planet",
            name = in_planet_parameters.name,
            tier = -1,
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
            icons = in_planet_parameters.icons or { {icon = (in_planet_parameters.icon or "__procedural-systems__/graphics/icons/planet-icon-desat.png"), tint = (in_planet_parameters.tint or {255,255,255})} },
            icon_size = in_planet_parameters.icon_size or 64,
            --starmap_icon = "__procedural-systems__/graphics/planet/starmap-planet-desat.png",
            starmap_icons = in_planet_parameters.starmap_icons or { {icon = (in_planet_parameters.starmap_icon or "__procedural-systems__/graphics/planet/starmap-planet-desat.png"), tint = (in_planet_parameters.tint or {255,255,255})} },
            starmap_icon_size = in_planet_parameters.starmap_icon or 512,
            map_gen_settings = planet_map_gen.procedural(in_planet_parameters.name,in_planet_parameters.resources),
            gravity_pull = in_planet_parameters.gravity_pull or 10,
            draw_orbit = false,
            magnitude = 1,
            order = "q[procedural]-a[" .. in_planet_parameters.name .. "]",
            pollutant_type = nil,
            solar_power_in_space = solar_polar_space, 
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
                ["solar-power"] = (in_planet_parameters.solar_power or 0.5 ) * solar_polar_space, 
                pressure = in_planet_parameters.pressure or 1000,
                gravity = in_planet_parameters.gravity or 15, 
                --temperature = 251,
            },
            asteroid_spawn_influence = 1,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.proc_trip, 0.9),
            persistent_ambient_sounds = {},
            surface_render_parameters = {
                shadow_opacity = 0.1, 
            },
        }
    })
end

function Procedural:create_planet_parameters(in_name,in_preset,in_secondary)
    local resource_table = in_secondary.additional_resources or {}
    table.insert(resource_table,random_stream.random_from_table_shallow(in_preset.major_feature))
    table.insert(resource_table,random_stream.random_from_table_shallow(in_preset.minor_feature))
    orient_min = in_secondary.orientation_min or 0.0
    orient_max = in_secondary.orientation_max or 0.8
    local planet_parent = in_secondary.parent or "star"
    return 
    {
        name = in_name,
        parent = planet_parent,
        orientation = random_stream.random_bound(orient_min*100,orient_max*100)/100, --bound needs integers
        resources = resource_table,
        distance = random_stream.random_bound(in_preset.distance_min*100,in_preset.distance_max*100)/100, --fine tune distance?
    }
end

function Procedural:create_liquid_expression(in_text)
    out_expression = "water_base(-2, 17000)"

    if in_text == "barren" then
        out_expression = "water_base(-2, 10)"
    elseif in_text == "moderate" then
        out_expression = "water_base(-2, 17000)"
    elseif in_text == "very-high" then
        out_expression = "water_base(-2, 28000)"
    elseif in_text == "oceanic" then
        out_expression = "water_base(-2, 800000)"
    else
        out_expression = "water_base(-2, 17000)"
    end

    return out_expression
end

--create_tiles
--create planet parameters
--extend planet
function Procedural:generate_planet(in_name,in_tint,in_preset,in_secondary)
    local tint_copy = table.deepcopy(in_tint)
    local liquid_expression = Procedural:create_liquid_expression(in_preset.surface_liquid_amount)
    tile_maker.generate_planet_tile_set(in_name,in_tint,{r = in_tint.r * 0.7, b = in_tint.b * 0.7, g = in_tint.g * 0.7},in_preset.surface_liquid,liquid_expression)
    planet_parameters = Procedural:create_planet_parameters(in_name,in_preset,in_secondary)
    planet_parameters.tint = tint_copy
    Procedural:extend_planet(planet_parameters)
    PlanetsLib.borrow_music(data.raw["planet"]["aquilo"], data.raw["planet"][in_name])
end

--Takes planet names as strings
function Procedural:borrow_music(in_from,in_target)
    PlanetsLib.borrow_music(data.raw["planet"][in_from], data.raw["planet"][in_target])
end

--See prodecural-planet-map-gen for map gen api
--tiles-procedural-lua for api related to using tile set
-- star_system_params.name ; star_system_params.connection_edges ;  star_system_params.planets
-- planets and connection_edges are tables with KV pairs, value being the name of the space location to unlock
--technology_params accepts variables related to the technology prototype.
function Procedural:create_unlock_technology(star_system_params,technology_params)

    local default_prereq = 
    {
        "planet-discovery-fulgora",
        "planet-discovery-gleba",
        "planet-discovery-vulcanus",
        "planet-discovery-corrundum",
        "electrochemical-science-pack",
        "electromagnetic-science-pack",
        "agricultural-science-pack",
        "metallurgic-science-pack",
    }
    local default_unit =
    {
      count = 4000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"electrochemical-science-pack", 1},
      },
      time = 60
    }

    local effects = 
    {
        {
            type = "unlock-space-location",
            space_location = star_system_params.name,
            use_icon_overlay_constant = true
        }
    }

    if(star_system_params.connection_edges ~= nil) then
        for k,v in pairs(star_system_params.connection_edges) do
            local unlock_teck = 
            {
                type = "unlock-space-location",
                space_location = v,
                use_icon_overlay_constant = true
            }
            table.insert(effects,unlock_teck)
        end
    end


    if(star_system_params.planets ~= nil) then
        for k,v in pairs(star_system_params.planets) do
            local unlock_teck = 
            {
                type = "unlock-space-location",
                space_location = v,
                use_icon_overlay_constant = true
            }
            table.insert(effects,unlock_teck)
        end
    end


    return
    {
        type = "technology",
        name = star_system_params.name.."-intersellar",
        localised_name = ("",(star_system_params.name.."-intersellar")),
        essential = technology_params.essential or true
        prerequisites = technology_params.prerequisites or default_prereq,
        unit = technology_params.unit or default_unit,
        icon = technology_params.icon or "__procedural-systems__/graphics/icons/planet-icon-desat.png",
        icon_size = technology_params.icon_size or 64, --default is 256
        icons = technology_params.icons = {},
        effects = effects,
    }
end

--Example
--[[
in_star_system_params = 
{
    name = "alpha_p"
    connection_edges = 
    {
        a = "main-system-alpha-edge",
        b = "alpha_p_system_edge"
    },
    planets = 
    {
        a = "alpha",
        b = "beta",
        c = "gamma",
        d = "delta",
        e = "epsilon",
        f = "omega"
    }
}

Procedural.create_unlock_technology(in_star_system_params,{})
--]]
local planet_map_gen = require("__procedural-systems__/prototypes/planet/procedural-planet-map-gen")
local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local asteroid_util = require("__procedural-systems__.prototypes.planet.asteroid-spawn-definitions")
local tile_maker = require("__procedural-systems__.prototypes.planet.tiles-procedural")
random_stream = require("__procedural-systems__/utility/random-stream")

PlanetsLib:extend({
    {
        type = "space-location",
        name = "main-system-alpha-edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        starmap_icon = "__space-age__/graphics/icons/solar-system-edge.png",
        gravity_pull = -10,
        magnitude = 1.0,
        label_orientation = 0.15,

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
	},
})

local solar_distance_table = --key distance, value solar power in space. Used from space ages values
{
    ["10"] = [600],
    ["15"] = [300],
    ["20"] = [200],
    ["25"] = [120],
    ["35"] = [60],
    ["50"] = [1],
    ["80"] = [0.1],
    ["10000"] = [0],
}

local function calculate_solar_power_in_space(in_distance,in_star_multiplier)
    local x_1 = 0
    local y_1 = 0
    local x_2 = 0
    local y_2 = 0

    local get_next_and_break = false
    for k,v in pairs(solar_distance_table) do
        if(in_distance > tonumber(k) and get_next_and_break == false) then
            x_1 = tonumber(k)
            y_1 = v
            get_next_and_break = true --Continue until next iteration
        end
        if(get_next_and_break == true) then
            x_2 = tonumber(k)
            y_2 = v
            break --we got the next numbers for our interpolation
        end

    end

    --in_distance is x
    --out_distance is y
    out_distance = (x_2 - x_1 / y_2 - y_1)*(in_distance - x_1) + y_1
    out_distance = out_distance*in_star_multiplier
    return out_distance

end

local function create_star_system_framework(in_system_parameters,in_connection_parameters)
    local star_parent_name = in_system_parameters.parant_star or "star"
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
                    name = in_system_parameters.parant_star or "star",
                },
                distance = in_system_parameters.distance or 250,
                orientation = in_system_parameters.orientation or 0.5,
            },
            sprite_only = false,
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
        },
    })
end
--TODO connect planets
--TODO figure out how to borrow music
local function extend_planet(in_planet_parameters)
    local solar_polar_space = calculate_solar_power_in_space((in_planet_parameters.parent_distance or 20),0.9 )
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
            icons = in_planet_parameters.icons or { {icon = (in_planet_parameters.icon or "__procedural-systems__/graphics/icons/planet-icon-desat.png"), tint = (in_planet_parameters.tint or {255,255,255})} },
            icon_size = in_planet_parameters.icon_size or 64,
            starmap_icon = "__procedural-systems__/graphics/planet/starmap-planet-desat.png",
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

local function create_planet_parameters(in_name,in_preset,in_secondary)
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

local function create_liquid_expression(in_text)
    out_expression = "water_base(-2, 17000)"

    if in_text == "barren" then
        out_expression = "water_base(-2, 10)"
    elseif in_text == "moderate" then
        out_expression = "water_base(-2, 17000)"
    elseif in_text == "very-high" then
        out_expression = "water_base(-2, 28000)"
    elseif in_text == "oceanic" then
        out_expression = "water_base(-2, 35000)"
    else
        out_expression = "water_base(-2, 17000)"
    end

    return out_expression
end

--create_tiles
--create planet parameters
--extend planet
local function generate_planet(in_name,in_tint,in_preset,in_secondary)
    local liquid_expression = create_liquid_expression(in_preset.surface_liquid_amount)
    tile_maker.generate_planet_tile_set(in_name,in_tint,{r = in_tint.r * 0.7, b = in_tint.b * 0.7, g = in_tint.g * 0.7},in_preset.surface_liquid,liquid_expression)
    planet_parameters = create_planet_parameters(in_name,in_preset,in_secondary)
    planet_parameters.tint = in_tint
    extend_planet(planet_parameters)
end


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

 
create_star_system_framework(alpha_system,alpha_system_connections)
generate_planet("alpha",{r = 250,g = 100, b = 100},water_a_preset,{ additional_resources = {"fluorite","alpha_ore_raw","siderite","malachite","hematite"},parent ="alpha_p"})
generate_planet("beta",{r = 250,  g = 155, b = 20, a = 1},desert_a_preset,{ additional_resources = {"fluorite","beta_ore_raw","pyrite","covellite","tenorite"},parent ="alpha_p"})
generate_planet("gamma",{r = 232, g = 221, b = 12, a = 1},lake_a_preset,{ additional_resources = {"fluorite","gamma_ore_raw","hematite_rough","tenorite_rough","pyrite_rough","covellite_rough"},parent ="alpha_p"})
generate_planet("delta",{r = 0, g = 180, b = 0, a = 1},lake_b_preset,{ additional_resources = {"fluorite","delta_ore_raw", "siderite_rough","malachite_rough","pyrite_rough","covellite_rough"},parent ="alpha_p"})
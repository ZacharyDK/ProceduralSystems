local ore_expression_util = {}

ore_expression_util.create_ore_expression_table = function(in_name)
    local addendum = in_name --remove the postfix. I tried but idk.
    local out = 
    {
        starting = 
        {
            type = "noise-expression",
            name = "procedural_starting_"..addendum,
            expression = "starting_spot_at_angle{ angle = procedural_ashlands_angle + 15 * procedural_starting_direction,\z
                                                    distance = 180 * procedural_starting_area_radius,\z
                                                    radius = 30 * procedural_" .. addendum .. "_size,\z
                                                    x_distortion = 0.5 * procedural_resource_wobble_x,\z
                                                    y_distortion = 0.5 * procedural_resource_wobble_y}"
        },
        size =
        {
            type = "noise-expression",
            name = "procedural_" .. addendum .. "_size",
            expression = "slider_rescale(control:procedural_" .. addendum .. ":size, 2)"
        },
        region = 
        {
            type = "noise-expression",
            name = "procedural_" .. addendum .."_region",
            -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
            expression = "max(procedural_starting_" .. addendum .. ",\z
                                min(1 - procedural_starting_circle,\z
                                    procedural_place_non_metal_spots(782349, 12, 1,\z
                                                                    procedural_" .. addendum .. "_size * min(1.2, procedural_ore_dist) * 25,\z
                                                                    control:procedural_" .. addendum .. ":frequency,\z
                                                                    procedural_ashlands_resource_favorability)))"
        },
        probability = 
        {
            type = "noise-expression",
            name = "procedural_" .. addendum .. "_probability",
            expression = "(control:procedural_" .. addendum .. ":size > 0) * (1000 * ((1 + procedural_".. addendum .. "_region) * random_penalty_between(0.9, 1, 1) - 1))"
        },
        richness = 
        {
            type = "noise-expression",
            name = "procedural_" .. addendum .. "_richness",
            expression = "procedural_" .. addendum .. "_region * random_penalty_between(0.9, 1, 1)\z
                            * 18000 * procedural_starting_area_multiplier\z
                            * control:procedural_" .. addendum .. ":richness / procedural_" .. addendum .. "_size"
        }
    }
    return out
end


ore_expression_util.create_geyser_expression_table = function(in_name)
    local addendum = in_name
    local out = 
    {

    
    starting = 
    {
        type = "noise-expression",
        name = "procedural_starting_" .. addendum,
        expression = "max(starting_spot_at_angle{ angle = procedural_mountains_angle + 10 * procedural_starting_direction,\z
                                                  distance = 590 * procedural_starting_area_radius,\z
                                                  radius = 30,\z
                                                  x_distortion = 0.75 * procedural_resource_wobble_x,\z
                                                  y_distortion = 0.75 * procedural_resource_wobble_y},\z
                          starting_spot_at_angle{ angle = procedural_mountains_angle + 30 * procedural_starting_direction,\z
                                                  distance = 200 * procedural_starting_area_radius,\z
                                                  radius = 25 * procedural_" .. addendum .. "_size,\z
                                                  x_distortion = 0.75 * procedural_resource_wobble_x,\z
                                                  y_distortion = 0.75 * procedural_resource_wobble_y})"
    },
    size = 
    {
        type = "noise-expression",
        name = "procedural_" .. addendum .. "_size",
        expression = "slider_rescale(control:" .. addendum .. ":size, 2)"
    },
    region = 
    {
        type = "noise-expression",
        name = "procedural_" .. addendum .. "_region",
        -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives. 7XX-->500
        expression = "max(procedural_starting_" .. addendum .. ",\z
                            min(1 - procedural_starting_circle,\z
                                procedural_place_" .. addendum .. "_spots(500, 9, 0,\z
                                                            procedural_" .. addendum .. "_size * min(1.2, procedural_ore_dist) * 25,\z
                                                            control:" .. addendum .. ":frequency,\z
                                                            procedural_" .. addendum .. "_favorability)))"
    },
    patches = 
    {
        type = "noise-expression",
        name = "procedural_" .. addendum .. "_patches",
        -- small wavelength noise (5 tiles-ish) to make geyser placement patchy but consistent between resources and decoratives
        expression = "0.8 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 21000, octaves = 2, input_scale = 0.9/3})"
    },
    region_patchy = 
    {
        type = "noise-expression",
        name = "procedural_" .. addendum .. "_region_patchy",
        expression = "(1 + procedural_sulfuric_acid_region) * (0.5 + 0.5 * procedural_sulfuric_acid_patches) - 1"
    },
    probability = 
    {
        type = "noise-expression",
        name = "procedural_" .. addendum .. "_probability",
        expression = "(control:" .. addendum .. ":size > 0) * (0.025 * ((procedural_" .. addendum .. "_region_patchy > 0) + 2 * procedural_" .. addendum .. "_region_patchy))"
    },
    richness = 
    {
        type = "noise-expression",
        name = "procedural_" .. addendum .. "_richness",
        expression = "(procedural_sulfuric_acid_region > 0) * random_penalty_between(0.5, 1, 1)\z
                        * 25000 * 40 * procedural_richness_multiplier * procedural_starting_area_multiplier\z
                        * control:" .. addendum .. ":richness / procedural_" .. addendum .. "_size"
    },
    favorability = 
    {
        type = "noise-expression",
        name = "procedural_mountains_" .. addendum .. "_favorability",
        expression = "clamp(((procedural_mountains_biome_full * (procedural_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
        local_expressions =
        {
          buffer = 0.3, -- push ores away from biome edges.
          contrast = 2
        }
    },
    spots = 
    {
        type = "noise-function",
        name = "procedural_place_" .. addendum .. "_spots",
        parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
        expression = "min(2 * favor_biome - 1, procedural_spot_noise{seed = seed,\z
                                                                    count = count,\z
                                                                    spacing = procedural_ore_spacing,\z
                                                                    span = 3,\z
                                                                    offset = offset,\z
                                                                    region_size = 450 + 450 / freq,\z
                                                                    density = favor_biome * 4,\z
                                                                    quantity = size * size,\z
                                                                    radius = size,\z
                                                                    favorability = favor_biome > 0.9})"
    },
    }
    return out
end

ore_expression_util.extend_expression_table = function(in_table)
    for k,v in pairs(in_table) do
        data:extend{v}
    end
end 

ore_expression_util.handle_expression_generation = function()
    local ore_array = 
    {
        ["A"] = "covellite",
        ["malachite"] = "malachite",
        ["tenorite"] = "tenorite",
        ["pyrite"] = "pyrite",
        ["siderite"] = "siderite",
        ["hematite"] = "hematite",
        ["fluorite"] = "fluorite",
        ["alpha"] = "alpha-ore-raw",
    }


    for k,v in pairs(ore_array) do 
        log(serpent.block("............"))
        log(serpent.block(v .. ":"))
        local exp = ore_expression_util.create_ore_expression_table(v)

        log(serpent.block(exp))
        ore_expression_util.extend_expression_table(exp)
    end
end

return ore_expression_util
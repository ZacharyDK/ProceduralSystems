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
})
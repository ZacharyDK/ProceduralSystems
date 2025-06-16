local asteroid_util = require("__mineral-chemistry__.prototypes.planet.asteroid-spawn-definitions")
local meld = require("meld")

function use_quality_glassware(in_science_pack_name,in_variant_name)
    local new_flask = quality_glassware.request_flask(
    in_science_pack_name,
    {
        { model = "cube", variant = in_variant_name},
        { variant = in_variant_name},
    }
    )
    meld(data.raw.tool[in_science_pack_name], quality_glassware.item_graphics_for(new_flask, meld))
end

new_science_packs = 
{
    "alpha-science-pack",
    "beta-science-pack",
    "gamma-science-pack",
    "delta-science-pack",
    "epsilon-science-pack",
    "omega-science-pack",
}

for k,v in pairs(new_science_packs) do
    table.insert(data.raw['lab']['lab'].inputs,v)
end

if(mods["quality_glassware"]) then
    use_quality_glassware("alpha-science-pack","liquid_red")
    use_quality_glassware("beta-science-pack","liquid_orange")
    use_quality_glassware("gamma-science-pack","liquid_yellow")
    use_quality_glassware("delta-science-pack","liquid_green")
    use_quality_glassware("epsilon-science-pack","liquid_blue")
    use_quality_glassware("omega-science-pack","liquid_purple")
end
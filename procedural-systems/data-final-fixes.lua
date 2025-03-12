
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


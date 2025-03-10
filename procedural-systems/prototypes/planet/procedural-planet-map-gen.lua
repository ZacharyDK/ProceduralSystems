local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")
local ore_expression = require("__procedural-systems__/prototypes/planet/procedural-ore-expressions")


ore_expression.handle_expression_generation()

planet_map_gen.procedural = function(in_name_postfix,in_entity_table) --Maybe a table that can hadnle stuff
  out = 
  {
    property_expression_names =
    {
      elevation = "procedural_elevation",
      temperature = "procedural_temperature",
      moisture = "procedural_moisture",
      aux = "procedural_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",

      --["entity:fluorite:probability"] = "procedural_fluorite_probability",
      --["entity:fluorite:richness"] = "procedural_fluorite_richness",


    },
    cliff_settings =
    {
      name = "cliff-procedural".. "-" ..in_name_postfix ,
      cliff_elevation_interval = 120,
      cliff_elevation_0 = 70,
    },

    autoplace_controls =
    {

      ["procedural_volcanism"] = {},

    },
    autoplace_settings = 
    {
      ["tile"] =
      {
        settings =
        {
          --nauvis tiles
          --["volcanic-soil-dark"] = {},
          --["volcanic-soil-light"] = {},
          --["volcanic-ash-soil"] = {},
          --end of nauvis tiles
          
          ["water" .. "-" .. in_name_postfix] = {},
          ["deepwater" .. "-" .. in_name_postfix] = {},

           --NOT SURE WHY EVERYTHING IS NOT COPIED?!??!?!
          ["procedural-volcanic-ash-flats" .. "-" .. in_name_postfix] = {},
          ["procedural-volcanic-ash-light".. "-" .. in_name_postfix] = {}, --WHY NOT COPIED? WHERE OTHER THINGS ARE
          ["procedural-volcanic-ash-dark".. "-" .. in_name_postfix] = {},
          ["procedural-volcanic-cracks".. "-" .. in_name_postfix] = {},
          ["procedural-volcanic-cracks-warm".. "-" .. in_name_postfix] = {},
          ["procedural-folds".. "-" .. in_name_postfix] = {},
          ["procedural-volcanic-folds-flat".. "-" .. in_name_postfix] = {},
          --["procedural-lava".. "-" .. in_name_postfix] = {}, --LAVA BROKEN
          --["procedural-lava-hot".. "-" .. in_name_postfix] = {},
          ["procedural-folds-warm".. "-" .. in_name_postfix] = {},
          ["procedural-volcanic-pumice-stones".. "-" .. in_name_postfix] = {},
          ["procedural-volcanic-cracks-hot".. "-" .. in_name_postfix] = {},
          ["procedural-volcanic-jagged-ground".. "-" .. in_name_postfix] = {},
          ["procedural-volcanic-smooth-stone".. "-" .. in_name_postfix] = {},
          ["procedural-smooth-stone-warm".. "-" .. in_name_postfix] = {},
          ["procedural-ash-cracks".. "-" .. in_name_postfix] = {},

        }
      },
      ["decorative"] =
      {
        settings =
        {
          -- nauvis decoratives
          --["v-brown-carpet-grass"] = {},
          --["v-green-hairy-grass"] = {},
          --["v-brown-hairy-grass"] = {},
          --["v-red-pita"] = {},
          -- end of nauvis
          --["procedural-rock-decal-large"] = {}, --TODO define these decoratives
          --["procedural-crack-decal-large"] = {},
          --["procedural-crack-decal-huge-warm"] = {},
          --["procedural-dune-decal"] = {},
          --["procedural-sand-decal"] = {},
          --["procedural-lava-fire"] = {},
          --["sulfur-stain"] = {}, --I'll leave these for now...
          --["sulfur-stain-small"] = {},
          --["sulfuric-acid-puddle"] = {},
          --["sulfuric-acid-puddle-small"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["small-volcanic-rock"] = {},
          ["medium-volcanic-rock"] = {},
          ["tiny-volcanic-rock"] = {},
          ["tiny-rock-cluster"] = {},
          --["small-sulfur-rock"] = {},
          --["tiny-sulfur-rock"] = {},
          --["sulfur-rock-cluster"] = {},
          ["waves-decal"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {

          ["crater-cliff"] = {},

        }
      }
    }
  }
  if(in_entity_table == nil) then
    return out
  end

  if(table_size(in_entity_table) > 0) then
    for k,v in pairs(in_entity_table) do
      local prob_key = "entity:" .. v .. ":probability"
      local prob_value = "procedural_" .. v .. "_probability"
      local richness_key = "entity:" .. v .. ":richness"
      local richness_value = "procedural_" .. v .. "_richness"
      local autoplace_control_key = v
      out.property_expression_names[prob_key] = prob_value
      out.property_expression_names[richness_key] = richness_value
      out.autoplace_controls[autoplace_control_key] = {}
      out.autoplace_settings.entity.settings[autoplace_control_key] = {}
    end
  end
--log(serpent.block(out))
return out
end

return planet_map_gen
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout
local tile_base = require("__procedural-systems__.prototypes.planet.tiles-procedural-base")



local function create_tinted_tile_set(in_tile_table,in_name_postfix,in_tint)
    local out = table.deepcopy(in_tile_table)
    --out = in_tile_table --I don't think deepcopy is working.

    for k,v in pairs(out) do
        v.tint = in_tint
        v.name = v.name .. "-" .. in_name_postfix
    end

    return out
end

local function extend_tinted_tiles(in_tinted_tile_table)
    for k,v in pairs(in_tinted_tile_table) do
        data:extend{v}
    end
end

--to do, figure out proper syntax for deepcopy...


local alpha_tile_set = create_tinted_tile_set(tile_base.get_tiles(),"alpha",{r = 250,g = 100, b = 100}) --rgb(255, 128, 128)

--[[
--Not sure why this isn't being coppied correctly. Regardless, here are the relevant post fixes
local lava_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  overlay_layer_group = "zero",
  apply_effect_color_to_overlay = true,
  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-out-of-map-transition-tintable.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  background_enabled = false,

  apply_waving_effect_on_masks = true,
  waving_effect_time_scale = 0.005,
  mask_layout =
  {
    spritesheet = "__base__/graphics/terrain/masks/water-edge-transition.png",
    count = 1,
    double_side_count = 0,
    scale = 0.5,
    outer_corner_x = 64,
    side_x = 128,
    u_transition_x = 192,
    o_transition_x = 256,
    y = 0
  }
}

alpha_tile_set["procedural-lava-alpha"]["allowed_neighbors"] = {"procedural-lava-hot-alpha"}
alpha_tile_set["procedural-lava-hot-alpha"]["allowed_neighbors"] = {"procedural-lava-hot"}

alpha_tile_set["procedural-lava-alpha"]["transitions"] = {lava_to_out_of_map_transition}
alpha_tile_set["procedural-lava-hot-alpha"]["transitions"] = {lava_to_out_of_map_transition}
--]]
log(serpent.block("Tiles:"))
log(serpent.block(alpha_tile_set))

extend_tinted_tiles(alpha_tile_set)
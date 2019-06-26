--fireplace 0.1 tumeninodes Jan. 09 2018

minetest.register_node("fireplace:fireplace_lg", {
	description = "Large Fireplace",
	drawtype = "mesh",
	mesh = "fireplace_lg.obj",
	inventory_image = minetest.inventorycube("fireplace_01_top.png", "fireplace_01_side.png", "fireplace_01_front.png"),
	wield_image = "fireplace_01_front.png",
	tiles = {"default_wood.png", "default_stone_brick.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	is_ground_content = false,
	groups = {cracky=2, stone=1, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.5, -0.5, 2.5, 0.5},
			{0.5, -0.5, -0.5, 1.5, 2.5, 0.5},
			{-0.5, 0.5, -0.5, 0.5, 2.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.5, -0.5, 2.5, 0.5},
			{0.5, -0.5, -0.5, 1.5, 2.5, 0.5},
			{-0.5, 0.5, -0.5, 0.5, 2.5, 0.5},
		},
	},
})

minetest.register_node("fireplace:fireplace_01", {
	description = "Fireplace 01",
	drawtype = "mesh",
	mesh = "fireplace.obj",
	inventory_image = minetest.inventorycube("fireplace_01_top.png", "fireplace_01_side.png", "fireplace_01_front.png"),
	wield_image = "fireplace_01_front.png",
	tiles = {
		"fireplace_01_top.png", "fireplace_01_bottom.png",
		"fireplace_01_side.png", "fireplace_01_side.png",
		"fireplace_01_front.png", "fireplace_01_side.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	is_ground_content = false,
	groups = {cracky=2, stone=1, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 1.5, 1.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 1.5, 1.5, 0.5},
		},
	},
	
	on_rightclick = function(pos, node, puncher)
		local handle = minetest.sound_play("fire_small", {pos = pos, gain = 0.20, max_hear_distance = 10, loop = true})
		minetest.get_meta(pos):set_int("handle", 0)
		minetest.swap_node(pos, {name = "fireplace:fireplace_01_active", param2 = node.param2})
	end
})

minetest.register_node("fireplace:fireplace_01_active", {
	description = "Fireplace_01_Active",
	drawtype = "mesh",
	mesh = "fireplace.obj",
	tiles = {
		"fireplace_01_top.png", "fireplace_01_bottom.png",
	"fireplace_01_side.png", "fireplace_01_side.png",
		{
			image = "fireplace_01_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 32,
				aspect_h = 32,
				length = 1.9
			},
		}, "fireplace_01_side.png",
	},
	light_source = 8,
	paramtype = "light",
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 1.5, 1.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 1.5, 1.5, 0.5},
		},
	},

	on_rightclick = function(pos, node, puncher)
	local handle = minetest.get_meta(pos):get_int("handle")
	minetest.after(1, function()
		if handle
		then minetest.sound_stop(handle) minetest.get_meta(pos):get_int("handle", nil)
		minetest.sound_stop(handle)
		end
	end)
		minetest.swap_node(pos, {name = "fireplace:fireplace_01", param2 = node.param2})
	end,
	drop = "fireplace:fireplace_01",
})

minetest.register_node("fireplace:mini_fireplace_01", {
	description = "Mini Fireplace 01",
	tiles = {"fireplace_01_top.png", "fireplace_01_bottom.png",
		"fireplace_01_side.png", "fireplace_01_side.png",
		"fireplace_01_side.png","fireplace_01_front.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	groups = {cracky=2, stone=1, oddly_breakable_by_hand=3},

	on_rightclick = function(pos, node, puncher)
		local handle = minetest.sound_play("fire_small", {pos = pos, gain = 0.20, max_hear_distance = 10, loop = true})
		minetest.get_meta(pos):set_int("handle", 0)
		minetest.swap_node(pos, {name = "fireplace:mini_fireplace_01_active", param2 = node.param2})
	end
})

minetest.register_node("fireplace:mini_fireplace_01_active", {
	description = "Mini Fireplace 01 Active",
	tiles = {"fireplace_01_top.png", "fireplace_01_bottom.png",
		"fireplace_01_side.png", "fireplace_01_side.png",
		"fireplace_01_side.png",
		{
			image = "fireplace_01_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.9
			},
		}
	},
	light_source = 6,
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1},
	
	on_rightclick = function(pos, node, puncher)
	local handle = minetest.get_meta(pos):get_int("handle")
	minetest.after(1, function()
		if handle
		then minetest.sound_stop(handle) minetest.get_meta(pos):get_int("handle", 0)
		minetest.sound_stop(handle)
		end
	end)
		minetest.swap_node(pos, {name = "fireplace:mini_fireplace_01", param2 = node.param2})
	end
})

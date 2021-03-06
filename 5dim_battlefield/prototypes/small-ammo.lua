require("prototypes.turret-function")
local color = {r = 1, g = 1, b = 0.1, a = 1}
local sounds = require("__base__.prototypes.entity.demo-sounds")
data:extend(
    {
        --Item
        {
            type = "item",
            name = "5d-gun-turret-small",
            icon = "__5dim_battlefield__/graphics/icon/icon-small-gun-turret.png",
            -- flags = {"goes-to-quickbar"},
            icon_size = 32,
            subgroup = "defense-gun",
            order = "a",
            place_result = "5d-gun-turret-small",
            stack_size = 50
        },
        --Recipe
        {
            type = "recipe",
            name = "5d-gun-turret-small",
            enabled = false,
            energy_required = 10,
            ingredients = {
                {"iron-gear-wheel", 5},
                {"copper-plate", 7},
                {"iron-plate", 15}
            },
            result = "5d-gun-turret-small"
        },
        --Entity
        {
            type = "ammo-turret",
            name = "5d-gun-turret-small",
            icon = "__5dim_battlefield__/graphics/icon/icon-small-gun-turret.png",
            flags = {"placeable-player", "player-creation"},
            minable = {mining_time = 0.5, result = "5d-gun-turret-small"},
            icon_size = 32,
            max_health = 1200,
            corpse = "medium-remnants",
            fast_replaceable_group = "turret",
            collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
            selection_box = {{-1, -1}, {1, 1}},
            rotation_speed = 0.02,
            preparing_speed = 0.15,
            folding_speed = 0.15,
            dying_explosion = "medium-explosion",
            inventory_size = 1,
            automated_ammo_count = 15,
            attacking_speed = 5.0,
            folded_animation = {
                layers = {
                    gun_turret_extension {frame_count = 1, line_length = 1},
                    dim_gun_turret_extension_mask {frame_count = 1, line_length = 1, tint = color},
                    gun_turret_extension_shadow {frame_count = 1, line_length = 1}
                }
            },
            preparing_animation = {
                layers = {
                    gun_turret_extension {},
                    dim_gun_turret_extension_mask {tint = color},
                    gun_turret_extension_shadow {}
                }
            },
            prepared_animation = gun_turret_attack {frame_count = 1, tint = color},
            attacking_animation = gun_turret_attack {tint = color},
            folding_animation = {
                layers = {
                    gun_turret_extension {run_mode = "backward"},
                    dim_gun_turret_extension_mask {run_mode = "backward", tint = color},
                    gun_turret_extension_shadow {run_mode = "backward"}
                }
            },
            base_picture = gun_turret_base {tint = color},
            vehicle_impact_sound = sounds.generic_impact,
            attack_parameters = {
                type = "projectile",
                ammo_category = "bullet",
                cooldown = 3,
                projectile_creation_distance = 1.39375,
                projectile_center = {0.0625, -0.0875}, -- same as gun_turret_attack shift
                damage_modifier = 1.5,
                shell_particle = {
                    name = "shell-particle",
                    direction_deviation = 0.1,
                    speed = 0.1,
                    speed_deviation = 0.03,
                    center = {0, 0},
                    creation_distance = -1.925,
                    starting_frame_speed = 0.2,
                    starting_frame_speed_deviation = 0.1
                },
                range = 16,
                sound = sounds.gun_turret_gunshot
            },
            call_for_help_radius = 40
        }
    }
)

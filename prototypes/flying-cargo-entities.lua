local Aircraft = require("__lex-aircraft__/prototypes/recurrent-params")
local util = require("__core__/lualib/util")
local leg = Aircraft:addLeg()
local volumeSettings = settings.startup["lex-jet-volume-control-settings"].value
local scaleSettings = settings.startup["lex-aircraft-scale-settings"].value
local speedSettings = (settings.startup["lex-flying-cargo-speed-settings"].value)/53
local inventorySize = settings.startup["lex-flying-cargo-inventory-size-settings"].value
local trashInventorySize = settings.startup["lex-flying-cargo-trash-inventory-size-settings"].value

local flying_cargo = {
    type = "spider-vehicle",
    name = "lex-flying-cargo",
    order = "z[programmable]", -- programmable in programmable-vehicles
    icon = Aircraft:addIcon("flying_cargo_icon.png"),
    minable = {mining_time = 2, result = "lex-flying-cargo"},
    --light_animation = airplaneLightAnimation("flying_cargo"),
    corpse = "medium-remnants",
    working_sound = Aircraft:addSound("flying_cargo-out-loop.ogg", volumeSettings*0.1 ),
    max_health = 550,
    energy_per_hit_point = 1,
    resistances = {
      Aircraft:addResist("fire",      2, 50),
      Aircraft:addResist("physical",  2, 30),
      Aircraft:addResist("impact",    5, 60),
      Aircraft:addResist("explosion", 2, 30),
      Aircraft:addResist("acid",     60, 20),
    },
    inventory_size = inventorySize,
    guns = {},
    graphics_set = {
      animation = Aircraft:airplaneAnimation("flying_cargo", 1.6*scaleSettings),
      shadow_animation = Aircraft:airshipShadowAnimation("flying_cargo", 1.6*scaleSettings),
      light = { Aircraft:lightdef(0, -600, 8) },
    },
    spider_engine =
    {
      legs =
      {
        {
          leg = "lex-aircraft-leg",
          mount_position = {0, -1},
          ground_position = {0, -1},
          walking_group = 1,
          leg_hit_the_ground_trigger = nil
        },
      },
    },
    height = 2,
    torso_rotation_speed = 0.005,
    chunk_exploration_radius = 3,
    movement_energy_consumption = "2000kW",
    automatic_weapon_cycling = true,
    chain_shooting_cooldown_modifier = 0.5,
    effectivity = 1,
    braking_power = "1kW",
    energy_source = {
      type = "burner",
      --fuel_category = "fusion-fuel",
      --fuel_category = "burnable-fluid-fuel",
      --fuel_category = "antimatter-fuel",
      --fuel_category = "nuclear",
      --fuel_category = "chemical",
      --fuel_category = "vehicle-fuel",
      fuel_inventory_size = 4,
      smoke =
      {
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 100,
          position = {2, 0},
          starting_frame = 0,
          starting_frame_deviation = 60,
          height = 1,
          height_deviation = 0.5,
          starting_vertical_speed = -0.2,
          starting_vertical_speed_deviation = 0.1,
          render_layer = "smoke",
        },
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 100,
          position = {-2, 0},
          starting_frame = 0,
          starting_frame_deviation = 60,
          height = 1,
          height_deviation = 0.5,
          starting_vertical_speed = -0.2,
          starting_vertical_speed_deviation = 0.1,
          render_layer = "smoke",
        }
      },
    },
    trash_inventory_size = trashInventorySize,
    equipment_grid = "lex-flying-cargo-grid",
    --consumption = "1250kW",
    friction = 0.0001,
    friction_force = 0.0001,
    braking_force = 0.01,
    --acceleration_per_energy = 0.80,
    stop_trigger_speed = 0.001,
    -- acceleration_per_energy = 0.025,
    -- breaking_speed = 0.15,
    -- rotation_speed = 0.006,
    weight = 3000,
    allow_remote_driving = true,
  }
  Aircraft:addRecurrentParams(flying_cargo)

  local flying_cargo_grid =
  {
    type = "equipment-grid",
    name = "lex-flying-cargo-grid",
    width = 10,
    height = 4,
    equipment_categories = {
      "armor",
    }
  }

  local speed_flying_cargo_sticker =
  {
    type = "sticker",
    name = "lex-flying-cargo-speed-sticker",
    flags = {"not-on-map"},
    animation = util.empty_sprite(),
    duration_in_ticks = 100,
    target_movement_modifier_from = 1,
    target_movement_modifier_to = 1,
    vehicle_speed_modifier_from = speedSettings,
    vehicle_speed_modifier_to = 1,
    vehicle_friction_modifier_from = 1,
    vehicle_friction_modifier_to = 1,
  }

data:extend({
  leg,
  speed_flying_cargo_sticker,
  flying_cargo,
  flying_cargo_grid,
})

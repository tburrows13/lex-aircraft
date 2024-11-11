local Aircraft = require("__lex-aircraft__/prototypes/recurrent-params")
local util = require("__core__/lualib/util")
local leg = Aircraft:addLeg()
local volumeSettings = settings.startup["lex-jet-volume-control-settings"].value
local scaleSettings = settings.startup["lex-aircraft-scale-settings"].value
local speedSettings = (settings.startup["lex-flying-heavyship-speed-settings"].value)/53
local inventorySize = settings.startup["lex-flying-heavyship-inventory-size-settings"].value
local trashInventorySize = settings.startup["lex-flying-heavyship-trash-inventory-size-settings"].value

local flying_heavyship = {
    type = "spider-vehicle",
    name = "lex-flying-heavyship",
    order = "z[programmable]", -- programmable in programmable-vehicles
    icon = Aircraft:addIcon("flying_heavyship_icon.png"),
    minable = {mining_time = 2, result = "lex-flying-heavyship"},
    --light_animation = airplaneLightAnimation("flying_heavyship"),
    corpse = "medium-remnants",
    working_sound = Aircraft:addSound( "flying_heavyship-out-loop.ogg", volumeSettings*0.1 ),
    max_health = 1100,
    energy_per_hit_point = 1,
    resistances = {
      Aircraft:addResist("fire",      0, 110),
      Aircraft:addResist("physical",  0, 35),
      Aircraft:addResist("impact",    0, 60),
      Aircraft:addResist("explosion", 2, 30),
      Aircraft:addResist("acid",     60, 20),
    },
    inventory_size = inventorySize,
    guns = {"lex-medium-rocket-launcher","lex-cannon"},
    graphics_set = {
      animation = Aircraft:airplaneAnimation("flying_heavyship", 1.4*scaleSettings),
      shadow_animation = Aircraft:airshipShadowAnimation("flying_heavyship", 1.4*scaleSettings),
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
          blocking_legs = {1},
          leg_hit_the_ground_trigger = nil
        }
      },
      military_target = "spidertron-military-target"
    },
    height = 2,
    torso_rotation_speed = 0.005,
    chunk_exploration_radius = 3,
    movement_energy_consumption = "1950kW",
    automatic_weapon_cycling = false,
    chain_shooting_cooldown_modifier = 0.5,
    effectivity = 1,
    braking_power = "1kW",
    burner = {
      fuel_inventory_size = 2,
      smoke =
      {
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 100,
          position = {2.5, 0},
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
          position = {-2.5, 0},
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
    equipment_grid = "lex-flying-heavyship-grid",
    --consumption = "950kW",
    friction = 0.0001,
    friction_force = 0.0001,
    braking_force = 0.01,
    --acceleration_per_energy = 0.80,
    stop_trigger_speed = 0.001,
    -- acceleration_per_energy = 0.025,
    -- breaking_speed = 0.15,
    -- rotation_speed = 0.006,
    weight = 5000,
  }
  Aircraft:addRecurrentParams(flying_heavyship)

  local flying_heavyship_grid =
  {
    type = "equipment-grid",
    name = "lex-flying-heavyship-grid",
    width = 10,
    height = 8,
    equipment_categories = {
      "armor",
    }
  }

  local speed_flying_heavyship_sticker =
  {
    type = "sticker",
    name = "lex-flying-heavyship-speed-sticker",
    flags = {"not-on-map"},
    animation = util.empty_sprite(),
    duration_in_ticks = 100,
    target_movement_modifier_from = 0.001,
    target_movement_modifier_to = 0.001,
    vehicle_speed_modifier_from = speedSettings,
    vehicle_speed_modifier_to = 0.001,
    vehicle_friction_modifier_from = 0.001,
    vehicle_friction_modifier_to = 0.001,
  }

data:extend({
  speed_flying_heavyship_sticker,
  flying_heavyship,
  leg,
  flying_heavyship_grid,
})

local Aircraft = require("__lex-aircraft__/prototypes/recurrent-params")
local util = require("__core__/lualib/util")
local leg = Aircraft:addLeg()
local volumeSettings = settings.startup["lex-jet-volume-control-settings"].value
local scaleSettings = settings.startup["lex-aircraft-scale-settings"].value
local speedSettings = (settings.startup["lex-flying-gunship-speed-settings"].value)/53
local inventorySize = settings.startup["lex-gunship-inventory-size-settings"].value
local trashInventorySize = settings.startup["lex-gunship-trash-inventory-size-settings"].value

local flying_gunship = {
    type = "spider-vehicle",
    name = "lex-flying-gunship",
    order = "z[programmable]", -- programmable in programmable-vehicles
    icon = Aircraft:addIcon("flying_gunship_icon.png"),
    minable = {mining_time = 2, result = "lex-flying-gunship"},
    --light_animation = airplaneLightAnimation("flying_gunship"),
    corpse = "medium-remnants",
    working_sound = Aircraft:addSound( "flying_gunship-out-loop.ogg",volumeSettings*0.1 ),
    max_health = 500,
    energy_per_hit_point = 1,
    resistances = {
      Aircraft:addResist("fire",      2, 50),
      Aircraft:addResist("physical",  2, 30),
      Aircraft:addResist("impact",    10, 60),
      Aircraft:addResist("explosion", 8, 30),
      Aircraft:addResist("acid",     60, 20),
    },
    collision_mask = {
      "ground-tile",
      "object-layer",
      "train-layer"
    },
    inventory_size = inventorySize,
    guns = {"lex-machine-gun","lex-rocket-launcher"},
    graphics_set = {
      animation = Aircraft:airplaneAnimation("flying_gunship", 1*scaleSettings),
      shadow_animation = Aircraft:airshipShadowAnimation("flying_gunship", 1*scaleSettings),
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
    torso_rotation_speed = 0.01,
    chunk_exploration_radius = 3,
    movement_energy_consumption = "750kW",
    automatic_weapon_cycling = false,
    chain_shooting_cooldown_modifier = 0.5,
    effectivity = 1,
    braking_power = "350kW",
    burner = {
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 100,
          position = {1, 0},
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
          position = {-1, 0},
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
    equipment_grid = "lex-flying-gunship-grid",
    --consumption = "1250kW",
    --friction = 5,
    --acceleration_per_energy = 0.80,
    -- acceleration_per_energy = 0.025,
    -- breaking_speed = 0.15,
    -- rotation_speed = 0.006,
    friction_force = 1,
    -- braking_force = 1,
    -- stop_trigger_speed = 1,
    weight = 1000,
  }
  Aircraft:addRecurrentParams(flying_gunship)

  local flying_gunship_grid =
  {
    type = "equipment-grid",
    name = "lex-flying-gunship-grid",
    width = 10,
    height = 4,
    equipment_categories = {
      "armor",
    }
  }

  local speed_flying_gunship_sticker =
  {
    type = "sticker",
    name = "lex-flying-gunship-speed-sticker",
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
  speed_flying_gunship_sticker,
  flying_gunship,
  leg,
  flying_gunship_grid,
})

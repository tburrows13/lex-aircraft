if not mods["space-age"] then return end
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")

data:extend{
  {
    type = "gun",
    name = "lex-railgun",
    icon = "__space-age__/graphics/icons/railgun.png",
    subgroup = "gun",
    order = "a[basic-clips]-h[railgun]",
    inventory_move_sound = item_sounds.weapon_large_inventory_move,
    pick_sound = item_sounds.weapon_large_inventory_pickup,
    drop_sound = item_sounds.weapon_large_inventory_move,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "railgun",
      cooldown = 80,
      movement_slow_down_factor = 0.5,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        --center = {0, 0.1},
        --creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_center = { 0, 2.2 },
      --projectile_creation_distance = 1.125,
      range = 50,
      sound = space_age_sounds.railgun_gunshot
    },
    stack_size = 1
  },
}

data.raw.technology["lex-jet-engine"].unit.ingredients = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1},
  {"production-science-pack", 1},
  {"utility-science-pack", 1},
}

-- Fulgora
data.raw.recipe["lex-flying-gunship"].ingredients = {
  {type="item", name="electric-engine-unit", amount=60},
  {type="item", name="steel-plate", amount=200},
  {type="item", name="superconductor", amount=20},
  {type="item", name="supercapacitor",amount=20},
  {type="item", name="submachine-gun", amount=2},
  {type="item", name="rocket-launcher", amount=2}
}
data.raw.technology["lex-flying-gunship-ships"].prerequisites = {"military-3", "lex-jet-engine", "rocketry", "electromagnetic-science-pack"}
data.raw.technology["lex-flying-gunship-ships"].unit = {
  count = 2000,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"military-science-pack", 1},
    {"production-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1},
    {"electromagnetic-science-pack", 1},
  },
  time = 60
}

-- Vulcanus
data.raw.recipe["lex-flying-cargo"].ingredients = {
  {type="item", name="electric-engine-unit", amount=120},
  {type="item", name="steel-plate", amount=500},
  {type="item", name="iron-plate", amount=500},
  {type="item", name="tungsten-carbide", amount=100},
  {type="item", name="processing-unit", amount=20},
}
data.raw.technology["lex-flying-cargo-ships"].prerequisites = {"lex-jet-engine", "metallurgic-science-pack"}
data.raw.technology["lex-flying-cargo-ships"].unit = {
  count = 2000,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1},
    {"metallurgic-science-pack", 1},
  },
  time = 60
}

-- Aquilo
data.raw["spider-vehicle"]["lex-flying-heavyship"].guns = {"lex-medium-rocket-launcher", "lex-cannon", "lex-railgun"}
data.raw.recipe["lex-flying-heavyship"].ingredients = {
  {type="item", name="electric-engine-unit",amount=150},
  {type="item", name="steel-plate", amount=1000},
  {type="item", name="carbon-fiber", amount=200},
  {type="item", name="processing-unit",  amount=40},
  {type="item", name="low-density-structure", amount=200},
  {type="item", name="railgun", amount=1},
}
data.raw.technology["lex-flying-heavyship-ships"].prerequisites = {"lex-flying-gunship-ships", "lex-flying-cargo-ships", "spidertron", "railgun"}
data.raw.technology["lex-flying-heavyship-ships"].unit = {
  count = 5000,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"military-science-pack", 1},
    {"production-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1},
    {"metallurgic-science-pack", 1},
    {"agricultural-science-pack", 1},
    {"electromagnetic-science-pack", 1},
    {"cryogenic-science-pack", 1}
  },
  time = 60
}

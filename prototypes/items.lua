local ICONPATH = "__lex-aircraft__/graphics/icons/"
local subgroup_aircraft = "transport"

local heavy_gun_sounds = {
  variations = {
    { filename = "__base__/sound/fight/heavy-gunshot-1.ogg", volume = 0.8 },
    { filename = "__base__/sound/fight/heavy-gunshot-2.ogg", volume = 0.8 },
    { filename = "__base__/sound/fight/heavy-gunshot-3.ogg", volume = 0.8 },
    { filename = "__base__/sound/fight/heavy-gunshot-4.ogg", volume = 0.8 }
  }
}
local flame_thrower_sounds = {
  begin_sound = { { filename = "__base__/sound/fight/flamethrower-start.ogg", volume = 0.7 } },
  middle_sound = { { filename = "__base__/sound/fight/flamethrower-mid.ogg", volume = 0.7 } },
  end_sound = { { filename = "__base__/sound/fight/flamethrower-end.ogg", volume = 0.7 } } }
local rocket_launcher_sound = { {filename = "__base__/sound/fight/rocket-launcher.ogg", volume = 0.7 } }
local cannon_sound = { { filename = "__base__/sound/fight/tank-cannon.ogg", volume = 1 } }


if mods["SchallTransportGroup"] then
  data:extend({
    {
      type = "item-subgroup",
      name = "aircrafts",
      group = "transport",
      order = "d-4"
    }
  })

  subgroup_aircraft = "aircrafts"
end

data:extend({
-----------------------------------------------SHIPS----------------------------------------------------
 {
    type = "item-with-entity-data",
    name = "lex-flying-gunship",
    icon = ICONPATH .. "flying_gunship_icon.png",
    icon_size = 64,
    flags = {},
    subgroup = subgroup_aircraft,
    order = "b[personal-transport]-e[lex-flying-gunship]",
    place_result = "lex-flying-gunship",
    stack_size = 1,
  },
  {
    type = "item-with-entity-data",
    name = "lex-flying-cargo",
    icon = ICONPATH .. "flying_cargo_icon.png",
    icon_size = 64,
    flags = {},
    subgroup = subgroup_aircraft,
    order = "b[personal-transport]-f[lex-flying-cargo]",
    place_result = "lex-flying-cargo",
    stack_size = 1,
  },
  {
    type = "item-with-entity-data",
    name = "lex-flying-heavyship",
    icon = ICONPATH .. "flying_heavyship_icon.png",
    icon_size = 64,
    flags = {},
    subgroup = subgroup_aircraft,
    order = "b[personal-transport]-h[lex-flying-heavyship]",
    place_result = "lex-flying-heavyship",
    stack_size = 1,
  },
-- -----------------------------------------------WEAPONS----------------------------------------------------
  {
    type = "gun",
    name = "lex-machine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64,
    hidden = true,
    subgroup = "gun",
    order = "a[basic-clips]-c[lex-machine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 3,
      movement_slow_down_factor = 0.5,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = { 0 , 0 },
        creation_distance = -0.6875,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_center = { 0, 2.2 },
      projectile_creation_distance = 0,
      range = 30,
      sound = heavy_gun_sounds,
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "lex-rocket-launcher",
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64,
    hidden = true,
    subgroup = "gun",
    order = "e[lex-rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      movement_slow_down_factor = 0.9,
      cooldown = 30,
      projectile_creation_distance = 0.6,
      range = 35,
      projectile_center = {-0.17, 0},
      sound = rocket_launcher_sound,
    },
    projectile_center = { 0, 2.2 },
    stack_size = 1
  },
  {
    type = "gun",
    name = "lex-cannon",
    icon = "__base__/graphics/icons/tank-cannon.png",
    icon_size = 64,
    hidden = true,
    subgroup = "gun",
    order = "z[tank]-a[lex-cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "cannon-shell",
      cooldown = 40.0,
      movement_slow_down_factor = 0.2,
      projectile_creation_distance = 0,
      projectile_center = { 0, 2.2 },
      range = 50,
      sound = cannon_sound,
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "lex-medium-machine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64,
    hidden = true,
    subgroup = "gun",
    order = "a[basic-clips]-c[lex-medium-machine-gun]",
    attack_parameters = {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 2.5,
      movement_slow_down_factor = 0.2,
      shell_particle = {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.8,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -0.6875,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 0,
      projectile_center = { 0, 2.2 },
      range = 40,
      sound = heavy_gun_sounds,
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "lex-medium-rocket-launcher",
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64,
    hidden = true,
    subgroup = "gun",
    order = "e[lex-medium-rocket-launcher]",
    attack_parameters = {
      type = "projectile",
      ammo_category = "rocket",
      movement_slow_down_factor = 0.9,
      cooldown = 20,
      projectile_creation_distance = 0.6,
      range = 50,
      projectile_center = {-0.17, 0},
      sound = rocket_launcher_sound,
    },
    stack_size = 1
  },
})
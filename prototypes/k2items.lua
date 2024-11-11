local advanced_machine_gun_sounds = {
  variations = {
    {
      filename = "__Krastorio2Assets__/sounds/weapons/advanced-tank-anti-material-rifle-1.ogg",
      volume = 0.85
    },
    {
      filename = "__Krastorio2Assets__/sounds/weapons/advanced-tank-anti-material-rifle-2.ogg",
      volume = 0.85
    }
  },
  aggregation = {
    max_count = 3,
    remove = false,
    count_already_playing = true
  }
}

if mods["Krastorio2"] and settings.startup["kr-more-realistic-weapon"].value then
  data:extend({
    {
      type = "gun",
      name = "lex-advanced-machine-gun",
      icon = "__Krastorio2Assets__/icons/guns/advanced-tank-machine-gun.png",
      icon_size = 64,
      flags = { "hidden" },
      subgroup = "gun",
      order = "z[tank]-a[advanced-machine-gun]",
      attack_parameters = {
        type = "projectile",
        ammo_category = "anti-material-rifle-ammo",
        damage_modifier = 1.5,
        cooldown = 15,
        min_range = 3.5,
        movement_slow_down_factor = 0.25,
        shell_particle = {
          name = "shell-particle",
          direction_deviation = 0.1,
          speed = 0.1,
          speed_deviation = 0.03,
          center = { 0, 0 },
          creation_distance = -0.6875,
          starting_frame_speed = 0.4,
          starting_frame_speed_deviation = 0.1,
        },
        projectile_center = { 0, 2.2 },
        projectile_creation_distance = 0,
        range = 70,
        sound = advanced_machine_gun_sounds,
      },
      stack_size = 1,
    },

  })
end

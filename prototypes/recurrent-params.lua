local _Aircrafts = {}

local SOUNDPATH = "__lex-aircraft__/sounds/"
local ICONPATH = "__lex-aircraft__/graphics/icons/"
local ENTITYPATH = "__lex-aircraft__/graphics/entity/"
local SPRITE_MULTIPLIER = 1
local HR_VERSION = 500
local util = require("__core__/lualib/util")


if lex_aircraft_high_res then
  ENTITYPATH = "__lex-aircraft-high-res__/graphics/entity/"
  SPRITE_MULTIPLIER = 0.5
  HR_VERSION = 1000
end

function _Aircrafts:addIcon(name)
  return ICONPATH .. name
end

function _Aircrafts:addLeg()
  return {
    type = "spider-leg",
    name = "lex-aircraft-leg",
    consumption = "650kW",
    friction = 1,
    localised_name = { "entity-name.spidertron-leg" },
    collision_box = nil,
    collision_mask = {layers = {}},
    selection_box = { { -0, -0 }, { 0, 0 } },
    icon = "__base__/graphics/icons/spidertron.png",
    icon_size = 64,
    walking_sound_volume_modifier = 0,
    target_position_randomisation_distance = 0,
    minimal_step_size = 0,
    working_sound = nil,
    initial_movement_speed = 1,
    movement_acceleration = 1,
    knee_height = 2.5,
    knee_distance_factor = 0.4,
    max_health = 100,
    base_position_selection_distance = 1,
    movement_based_position_selection_distance = 1,
    selectable_in_game = false,
    --graphics_set = create_spidertron_leg_graphics_set(0, 1),
    acceleration_per_energy = 0.80,
  }
end

function _Aircrafts:addCommonAnimLines(anim, size)
  for key, layer in pairs(anim.layers) do
    layer.width, layer.height = size, size
    layer.frame_count = 1
    layer.direction_count = 128
    layer.line_length = 8
    layer.max_advance = 1
  end
  return anim
end

function _Aircrafts:airplaneAnimation(name, scale, size)
  local anim = {}
  anim.layers = {
    {
      stripes = {
        {
          filename = ENTITYPATH .. name .. "/hr-" .. name .. "_1-64.png",
          width_in_frames = 8,
          height_in_frames = 8,
        },
        {
          filename = ENTITYPATH .. name .. "/hr-" .. name .. "_65-128.png",
          width_in_frames = 8,
          height_in_frames = 8,
        },
      },
      shift = { 0, 0 },
      scale = SPRITE_MULTIPLIER * scale * 0.5,
      priority = "no-atlas",
    },
    {
      stripes = {
        {
          filename = ENTITYPATH .. name .. "/hr-" .. name .. "_1-64_mask.png",
          width_in_frames = 8,
          height_in_frames = 8,
        },
        {
          filename = ENTITYPATH .. name .. "/hr-" .. name .. "_65-128_mask.png",
          width_in_frames = 8,
          height_in_frames = 8,
        },
      },
      apply_runtime_tint = true,
      shift = { 0, 0 },
      scale = SPRITE_MULTIPLIER * scale * 0.5,
      priority = "no-atlas",
    },




  }
  self:addCommonAnimLines(anim, size)
  return anim
end

function _Aircrafts:airshipShadowAnimation(name, scale, size)
  local anim = {}
  anim.layers = {
    {
      stripes = {
        {
          filename = ENTITYPATH .. name .. "/hr-" .. name .. "_1-64_shadow.png",
          width_in_frames = 8,
          height_in_frames = 8,
        },
        {
          filename = ENTITYPATH .. name .. "/hr-" .. name .. "_65-128_shadow.png",
          width_in_frames = 8,
          height_in_frames = 8,
        },
      },
      shift = { 2, 2 },
      draw_as_shadow = true,
      scale = SPRITE_MULTIPLIER * scale * 0.5,
      priority = "low",
    }
  }
  self:addCommonAnimLines(anim, size)
  return anim
end

function _Aircrafts:airplaneLightAnimation(name)
  local anim = {}
  anim.layers = {
    {
      filename = ENTITYPATH .. name .. "/hr-" .. name .. "_-light.png",
      shift = util.by_pixel(9, -10),
      draw_as_light = true,
    }
  }
  self:addCommonAnimLines(anim)
  return anim
end

function _Aircrafts:lightdef(shift, distance, intensity)
  return {
    type = "oriented",
    minimum_darkness = 0.3,
    picture = {
      filename = ENTITYPATH .. "particle/hr-light-cone.png",
      scale = 0.5,
      width = 800,
      height = 800
    },
    shift = util.by_pixel(shift, distance),
    size = 2,
    intensity = intensity / 10,
  }
end

function _Aircrafts:smokedef(shift, radius, height)
  return {
    name = "smoke",
    --name = "aircrafts-trail",
    --frequency = 200,
    frequency = 60,
    --deviation = util.by_pixel(2, 2), --position randomness
    deviation = util.by_pixel(0, 0), --position randomness
    position = util.by_pixel(shift, radius),
    height = height / 32,
    starting_frame = 3,
    starting_frame_deviation = 5,
    starting_frame_speed = 5,
    starting_frame_speed_deviation = 5,
  }
end

function _Aircrafts:addSound(idle, volume)
  return {
    sound = { filename = SOUNDPATH .. idle, volume = volume },
    idle_sound = { filename = SOUNDPATH .. idle, volume = volume },
    --activate_sound = { filename = SOUNDPATH .. activate, volume = 0.5 },
    --deactivate_sound = { filename = SOUNDPATH .. deactivate, volume = 0.5 },
    match_speed_to_activity = true,
    --apparent_volume = 1.5,
    --fade_in_ticks = 30,
    --fade_out_ticks = 20
  }
end

function _Aircrafts:addRecurrentParams(entitie)

  entitie.icon_size = 64
  entitie.flags = { "placeable-neutral", "player-creation", "placeable-off-grid", "no-automated-item-removal", "no-automated-item-insertion" }
  entitie.dying_explosion = "medium-explosion"
  entitie.terrain_friction_modifier = 0
  entitie.collision_box = { { -1.5, -1.5 }, { 1.5, 1.5 } }
  entitie.collision_mask = {layers = {}}
  entitie.selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } }
  entitie.selection_priority = 60
  entitie.graphics_set.render_layer = "air-object"
  entitie.graphics_set.final_render_layer = "air-object"
  entitie.graphics_set.base_render_layer = "air-object"
  entitie.sound_no_fuel = { { filename = "__base__/sound/fight/tank-no-fuel-1.ogg", volume = 0.6 } }
  entitie.vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
  entitie.open_sound = { filename = "__base__/sound/car-door-open.ogg", volume = 0.7 }
  entitie.close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 }
  entitie.mined_sound = { filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8 }
  entitie.create_ghost_on_death = false

  entitie.minimap_representation = {
    filename = ICONPATH .. "aircraft-minimap-representation.png",
    flags = { "icon" },
    size = { 40, 40 },
    scale = 0.5
  }
  entitie.selected_minimap_representation = {
    filename = ICONPATH .. "aircraft-minimap-representation-selected.png",
    flags = { "icon" },
    size = { 40, 40 },
    scale = 0.5
  }
  --entitie.immune_to_tree_impacts = true --craft.immune_to_rock_impacts = true
  --entitie.created_smoke = { smoke_name = "smoke" }
end

function _Aircrafts:addResist(type, decrease, percent)
  return {
    type = type,
    decrease = decrease,
    percent = percent
  }
end

return _Aircrafts

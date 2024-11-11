local base_speed = 0.0001
local sticker_life = 100

local Aircraft = {}
Aircraft.metatable = { __index = Aircraft }

local function get_speed_boost(burner)
  local burning = burner.currently_burning
  if not burning then return 1 end
  return burning.fuel_top_speed_multiplier
end

function Aircraft.new(entity, sticker_name)

  local _unit =
  {
    entity = entity,
    unit_number = entity.unit_number,
    speed = 0
  }

  setmetatable(_unit, Aircraft.metatable)
  _unit:set_speed(get_speed_boost(_unit.entity.burner), sticker_name)

end

function Aircraft:set_speed(_speed, sticker_name)

  if _speed == self.speed then return end
  self.speed = _speed

  local _ratio = _speed / (base_speed * get_speed_boost(self.entity.burner))

  if _ratio <= 1 then
    self:clear_speed_sticker()
  else
    local _sticker = self:get_speed_sticker(sticker_name)
    _sticker.time_to_live = 1 + ((sticker_life / 10) * _ratio)
  end

end

function Aircraft:get_speed_sticker(name)

  if self.speed_sticker and self.speed_sticker.valid then
    return self.speed_sticker
  end
  self.speed_sticker = self.entity.surface.create_entity
  {
    name = name .. "-speed-sticker",
    target = self.entity,
    force = self.entity.force,
    position = self.entity.position
  }
  self.speed_sticker.active = false
  return self.speed_sticker
end

function Aircraft:clear_speed_sticker()
  if not self.speed_sticker then return end
  self.speed_sticker.destroy()
  self.speed_sticker = nil
end

local function define_sticker_name(entity_name)
  local sticker_name
  if entity_name == "lex-flying-cargo" or entity_name == "lex-flying-cargo-0" then
    sticker_name = "lex-flying-cargo"
  elseif entity_name == "lex-flying-gunship" or
      entity_name == "lex-flying-gunship-lex-machine-gun" or
      entity_name == "lex-flying-gunship-lex-rocket-launcher" then
    sticker_name = "lex-flying-gunship"
  elseif entity_name == "lex-flying-heavyship" or
      entity_name == "lex-flying-heavyship-lex-medium-rocket-launcher" or
      entity_name == "lex-flying-heavyship-heavy-rocket-launcher" or
      entity_name == "lex-flying-heavyship-lex-advanced-machine-gun" or
      entity_name == "lex-flying-heavyship-lex-cannon" then
    sticker_name = "lex-flying-heavyship"
  else
    return
  end
  return sticker_name
end

local function on_built_entity(event)
  local entity = event.created_entity or event.entity
  local sticker_name
  if not (entity and entity.valid) then return end
  sticker_name = define_sticker_name(entity.name)
  if not sticker_name then return end
  Aircraft.new(entity, sticker_name)
end

local function entity_deployed(entity)
  local sticker_name
  if not (entity and entity.valid) then return end
  sticker_name = define_sticker_name(entity.name)
  if not sticker_name then return end
  Aircraft.new(entity, sticker_name)
end

remote.add_interface(
  "lex-aircraft-sticker",
  {
    on_entity_deployed = function(ev)
      local entity = ev.entity
      if entity.valid and (entity.type == "spider-vehicle") then
        entity_deployed(entity)
      end
    end
  }
)

local lib = {}

lib.events = {
  [defines.events.on_built_entity] = on_built_entity,
  [defines.events.script_raised_built] = on_built_entity,
}

return lib

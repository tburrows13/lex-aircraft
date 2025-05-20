-- K2
if mods["Krastorio2"] then
  require("prototypes.k2items")
  data.raw["spider-vehicle"]["lex-flying-cargo"].energy_source.fuel_categories = { "vehicle-fuel" }
  data.raw["spider-vehicle"]["lex-flying-gunship"].energy_source.fuel_categories = { "vehicle-fuel" }
  data.raw["spider-vehicle"]["lex-flying-heavyship"].energy_source.fuel_categories = { "vehicle-fuel" }
  data.raw["equipment-grid"]["lex-flying-cargo-grid"].equipment_categories = {
    "universal-equipment",
    "robot-interaction-equipment",
    "vehicle-robot-interaction-equipment",
    "vehicle-equipment",
    "vehicle-motor",
  }
  data.raw["equipment-grid"]["lex-flying-gunship-grid"].equipment_categories = {
    "universal-equipment",
    "robot-interaction-equipment",
    "vehicle-robot-interaction-equipment",
    "vehicle-equipment",
    "vehicle-motor",
  }
  data.raw["equipment-grid"]["lex-flying-heavyship-grid"].equipment_categories = {
    "universal-equipment",
    "robot-interaction-equipment",
    "vehicle-robot-interaction-equipment",
    "vehicle-equipment",
    "vehicle-motor",
  }
  data.raw["equipment-grid"]["lex-flying-heavyship-grid"].equipment_categories = {
    "universal-equipment",
    "robot-interaction-equipment",
    "vehicle-robot-interaction-equipment",
    "vehicle-equipment",
    "vehicle-motor",
  }
  table.insert(data.raw["spider-vehicle"]["lex-flying-heavyship"].guns, "heavy-rocket-launcher")
  if settings.startup["kr-more-realistic-weapon"].value then
    table.insert(data.raw["spider-vehicle"]["lex-flying-heavyship"].guns, "lex-advanced-machine-gun")
  end

else
  data.raw["ammo"]["cannon-shell"].ammo_type.action.action_delivery.max_range = 50
  data.raw["ammo"]["explosive-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
  data.raw["ammo"]["uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
  data.raw["ammo"]["explosive-uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
end

-- SE
if mods["space-exploration"] then
  table.insert(data.raw.technology["lex-flying-heavyship-ships"].unit.ingredients, {"se-rocket-science-pack", 1})
else
  -- TODO remove utility/production if SE is active?
  --table.insert(data.raw.technology["lex-flying-heavyship-ships"].unit.ingredients, {"utility-science-pack", 1})
  --table.insert(data.raw.technology["lex-flying-heavyship-ships"].unit.ingredients, {"production-science-pack", 1})
end

-- SE
if mods["space-exploration"] then
  local collision_mask_util = require("__core__/lualib/collision-mask-util")
  local data_util = require("__space-exploration__/data_util")

  local names = {"lex-flying-cargo", "lex-flying-gunship", "lex-flying-heavyship"}

  for _, name in pairs(names) do
      local prototype = data.raw["spider-vehicle"][name]
      prototype.collision_mask = collision_mask_util.get_mask(prototype)
      prototype.collision_mask.layers.space_tile = true

      for _, leg_specification in pairs(prototype.spider_engine.legs) do
          local leg_prototype = data.raw["spider-leg"][leg_specification.leg]
          leg_prototype.collision_mask = collision_mask_util.get_mask(leg_prototype)
          leg_prototype.collision_mask.layers.space_tile = true
          leg_prototype.collision_mask.colliding_with_tiles_only = true
      end

      data_util.collision_description(prototype)  -- Adds "Cannot be placed on..." to tooltip
  end
end


log(serpent.block(data.raw["spider-vehicle"]["lex-flying-gunship"]))
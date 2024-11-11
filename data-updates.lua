-- K2
if mods["Krastorio2"] then
  require("prototypes.k2items")
  data.raw["spider-vehicle"]["lex-flying-cargo"].burner.fuel_categories = { "vehicle-fuel" }
  data.raw["spider-vehicle"]["lex-flying-gunship"].burner.fuel_categories = { "vehicle-fuel" }
  data.raw["spider-vehicle"]["lex-flying-heavyship"].burner.fuel_categories = { "vehicle-fuel" }
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
  table.insert(data.raw.technology["lex-flying-heavyship-ships"].unit.ingredients, {"utility-science-pack", 1})
  table.insert(data.raw.technology["lex-flying-heavyship-ships"].unit.ingredients, {"production-science-pack", 1})
end

-- SE
if mods["space-exploration"] then
  local collision_mask_util_extended = require("__space-exploration__/collision-mask-util-extended/data/collision-mask-util-extended")
  local data_util = require("__space-exploration__/data_util")
  local space_collision_layer = collision_mask_util_extended.get_make_named_collision_mask("space-tile")

  local names = {"lex-flying-cargo", "lex-flying-gunship", "lex-flying-heavyship"}

  for _, name in pairs(names) do
      local prototype = data.raw["spider-vehicle"][name]
      prototype.collision_mask = collision_mask_util_extended.get_mask(prototype)
      collision_mask_util_extended.add_layer(prototype.collision_mask, space_collision_layer)

      for _, leg_specification in pairs(prototype.spider_engine.legs) do
          local leg_prototype = data.raw["spider-leg"][leg_specification.leg]
          leg_prototype.collision_mask = collision_mask_util_extended.get_mask(leg_prototype)
          collision_mask_util_extended.add_layer(leg_prototype.collision_mask, space_collision_layer)
          collision_mask_util_extended.add_layer(leg_prototype.collision_mask, "colliding-with-tiles-only")
      end

      data_util.collision_description(prototype)  -- Adds "Cannot be placed on..." to tooltip
  end
end
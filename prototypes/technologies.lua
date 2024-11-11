local TECHPATH = "__lex-aircraft__/graphics/technology/"

local function unlock(recipe)
  return {
    type = "unlock-recipe",
    recipe = recipe
  }
end

data:extend({
  {
    type = "technology",
    name = "lex-jet-engine",
    icon = TECHPATH .. "jet_engine_tech.png",
    icon_size = 256,
    prerequisites = {"automobilism", "robotics"},
    unit = {
      count = 350,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 45
    },
    order = "c-h-b"
  },
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {
    type = "technology",
    name = "lex-flying-gunship-ships",
    icon = TECHPATH .. "gunship.png",
    icon_size = 256,
    effects = { unlock("lex-flying-gunship") },
    prerequisites = {"military-3", "lex-jet-engine", "rocketry"},
    unit = {
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 60
    },
    order = "c-h-c"
  },
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {
    type = "technology",
    name = "lex-flying-cargo-ships",
    icon = TECHPATH .. "cargo_plane.png",
    icon_size = 256,
    effects = { unlock("lex-flying-cargo") },
    prerequisites = {"lex-jet-engine"},
    unit = {
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    order = "c-h-d"
  },
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {
    type = "technology",
    name = "lex-flying-heavyship-ships",
    icon = TECHPATH .. "flying_heavyship.png",
    icon_size = 256,
    effects = { unlock("lex-flying-heavyship"), unlock("spidertron-remote") },
    prerequisites = {"lex-flying-gunship-ships", "lex-flying-cargo-ships" },
    unit = {
      count = 2500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 120
    },
    order = "c-h-f"
  },
})
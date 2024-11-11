data:extend({
 {
    type = "recipe",
    name = "lex-flying-gunship",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {type="item", name="electric-engine-unit", amount=64},
      {type="item", name="steel-plate", amount=200},
      {type="item", name="iron-plate", amount=400},
      {type="item", name="electronic-circuit",amount=40},
      {type="item", name="submachine-gun", amount=2},
      {type="item", name="rocket-launcher", amount=2}
    },
    results = {{type="item", name="lex-flying-gunship", amount=1}}
  },
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 {
    type = "recipe",
    name = "lex-flying-cargo",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type="item", name="electric-engine-unit", amount=128},
      {type="item", name="steel-plate", amount=500},
      {type="item", name="iron-plate", amount=500},
      {type="item", name="advanced-circuit", amount=20},
    },
    results = {{type="item", name="lex-flying-cargo", amount=1}}
  },
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {
    type = "recipe",
    name = "lex-flying-heavyship",
    enabled = false,
    energy_required = 20,
    ingredients = {
      {type="item", name="electric-engine-unit",amount=150},
      {type="item", name="steel-plate", amount=1000},
      {type="item", name="advanced-circuit", amount=80},
      {type="item", name="processing-unit",  amount=40},
      {type="item", name="low-density-structure", amount=200},
      {type="item", name="tank", amount=2},
      {type="item", name="rocket-launcher", amount=10},
    },
    results = {{type="item", name="lex-flying-heavyship", amount=1}}
  },
})
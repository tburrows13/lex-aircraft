data:extend({
 {
    type = "recipe",
    name = "lex-flying-gunship",
    normal = {
	    enabled = false,
	    energy_required = 10,
	    ingredients = {
        {"electric-engine-unit", 64},
        {"steel-plate", 200},
        {"iron-plate", 400},
        {"electronic-circuit", 40},
        {"submachine-gun", 2},
        {"rocket-launcher", 2}
      },
	    result = "lex-flying-gunship"
	  },
    expensive = {
	    enabled = false,
	    energy_required = 20,
	    ingredients = {
	      {"electric-engine-unit", 128},
	      {"steel-plate", 400},
	      {"iron-plate", 800},
	      {"electronic-circuit", 80},
	      {"submachine-gun", 10},
	      {"rocket-launcher", 10},
	    },
	    result = "lex-flying-gunship"
    },
  },
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 {
    type = "recipe",
    name = "lex-flying-cargo",
    normal = {
	    enabled = false,
	    energy_required = 5,
	    ingredients = {
	      {"electric-engine-unit", 128},
	      {"steel-plate", 500},
	      {"iron-plate", 500},
	      {"advanced-circuit", 20},
	    },
	    result = "lex-flying-cargo"
    },
    expensive = {
	    enabled = false,
	    energy_required = 10,
	    ingredients = {
        {"electric-engine-unit", 256},
        {"steel-plate", 1000},
        {"iron-plate", 1000},
        {"advanced-circuit", 40},
      },
      result = "lex-flying-cargo"
    },
  },
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {
    type = "recipe",
    name = "lex-flying-heavyship",
    normal = {
	    enabled = false,
	    energy_required = 20,
	    ingredients = {
        {"electric-engine-unit",150},
        {"steel-plate", 1000},
        {"advanced-circuit", 80},
        {"processing-unit",  40},
        {"low-density-structure", 200},
        {"tank", 2},
        {"rocket-launcher", 10},
      },
      result = "lex-flying-heavyship",
    },
    expensive = {
	    enabled = false,
	    energy_required = 40,
	    ingredients = {
        {"electric-engine-unit", 300},
        {"steel-plate", 4000},
        {"advanced-circuit", 160},
        {"processing-unit", 80},
        {"submachine-gun", 30},
        {"rocket-launcher", 30},
      },
      result = "lex-flying-heavyship",
    },
  },
})
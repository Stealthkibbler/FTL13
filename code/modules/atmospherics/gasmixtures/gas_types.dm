var/list/hardcoded_gases = list("o2","n2","co2","plasma") //the main four gases, which were at one time hardcoded

/proc/meta_gas_list()
	. = new /list
	for(var/gas_path in subtypesof(/datum/gas))
		var/list/gas_info = new(4)
		var/datum/gas/gas = gas_path

		gas_info[META_GAS_SPECIFIC_HEAT] = initial(gas.specific_heat)
		gas_info[META_GAS_NAME] = initial(gas.name)
		gas_info[META_GAS_MOLES_VISIBLE] = initial(gas.moles_visible)
		if(initial(gas.moles_visible) != null)
			gas_info[META_GAS_OVERLAY] = new /obj/effect/overlay/gas(initial(gas.gas_overlay))
		.[initial(gas.id)] = gas_info

/*||||||||||||||/----------\||||||||||||||*\
||||||||||||||||[GAS DATUMS]||||||||||||||||
||||||||||||||||\__________/||||||||||||||||
||||These should never be instantiated. ||||
||||They exist only to make it easier   ||||
||||to add a new gas. They are accessed ||||
||||only by meta_gas_list().            ||||
\*||||||||||||||||||||||||||||||||||||||||*/

/datum/gas
	var/id = ""
	var/specific_heat = 0
	var/name = ""
	var/gas_overlay = "" //icon_state in icons/effects/tile_effects.dmi
	var/moles_visible = null

/datum/gas/oxygen
	id = "o2"
	specific_heat = 20
	name = "Oxygen"

/datum/gas/nitrogen
	id = "n2"
	specific_heat = 20
	name = "Nitrogen"

/datum/gas/carbon_dioxide //what the fuck is this?
	id = "co2"
	specific_heat = 30
	name = "Carbon Dioxide"

/datum/gas/plasma
	id = "plasma"
	specific_heat = 200
	name = "Plasma"
	gas_overlay = "plasma"
	moles_visible = MOLES_PLASMA_VISIBLE

/datum/gas/nitrous_oxide
	id = "n2o"
	specific_heat = 40
	name = "Nitrous Oxide"
	gas_overlay = "nitrous_oxide"
	moles_visible = 1

/datum/gas/oxygen_agent_b
	id = "agent_b"
	specific_heat = 300
	name = "Oxygen Agent B"

/datum/gas/volatile_fuel
	id = "v_fuel"
	specific_heat = 30
	name = "Volatile Fuel"

/datum/gas/bz
	id = "bz"
	specific_heat = 20
	name = "BZ"
	
/datum/gas/hydrogen
	id = "hydrogen"
	specific_heat = 300
	name = "Hydrogen"
	gas_overlay = "hydrogen"
	moles_visible = 1
	
/datum/gas/fusion_plasma
	id = "fusion_plasma"
	specific_heat = 600
	name = "Fusion Plasma"
	
/datum/gas/water_vapor
	id = "water_vapor"
	specific_heat = 40
	name = "Water Vapor"
	gas_overlay = "water_vapor"
	moles_visible = MOLES_PLASMA_VISIBLE

/obj/effect/overlay/gas/
	icon = 'icons/effects/tile_effects.dmi'
	mouse_opacity = 0
	layer = FLY_LAYER
	appearance_flags = RESET_COLOR|TILE_BOUND

/obj/effect/overlay/gas/New(state)
	. = ..()
	icon_state = state
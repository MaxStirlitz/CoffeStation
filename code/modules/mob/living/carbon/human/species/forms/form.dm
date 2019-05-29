/datum/species_form //The default species form is going to be uncolored human.
	var/name = "Unknown"
	var/name_plural = "Unknowns"
	// Icon/appearance vars.
	var/base = 'icons/mob/human_races/r_human.dmi'    // Normal icon set.
	var/deform = 'icons/mob/human_races/r_def_human.dmi' // Mutated icon set.
	var/face = 'icons/mob/human_face.dmi'

	// Damage overlay and masks.
	var/damage_overlays = 'icons/mob/human_races/masks/dam_human.dmi'
	var/damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	var/blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'

	// Death vars.
	var/meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/human
	var/gibber_type = /obj/effect/gibspawner/human
	var/single_gib_type = /obj/effect/decal/cleanable/blood/gibs
	var/remains_type = /obj/item/remains/xeno
	var/gibbed_anim = "gibbed-h"
	var/dusted_anim = "dust-h"

	//Death Vars
	var/death_sound
	var/death_message = "seizes up and falls limp, their eyes dead and lifeless..."
	var/knockout_message = "has been knocked unconscious!"
	var/halloss_message = "slumps to the ground, too weak to continue fighting."
	var/halloss_message_self = "You're in too much pain to keep going..."

	//Up/Downgrades
	var/primitive_form = "Monkey"     // Lesser form, if any (ie. monkey for humans)
	var/greater_form              // Greater form, if any, ie. human for monkeys.

	var/prone_icon                                      // If set, draws this from icobase when mob is prone.
	var/eyes = "eyes_s"                                 // Icon for eyes.
	var/has_floating_eyes = FALSE                       // Eyes will overlay over darkness (glow)
	var/blood_color = "#A10808"                         // Red.
	var/flesh_color = "#FFC896"                         // Pink.
	var/base_color = "#FFE0D0"                          // Used by changelings. Should also be used for icon previes..
	var/tail                                            // Name of tail state in species effects icon file.
	var/tail_animation                                  // If set, the icon to obtain tail animation states from.
	var/form_key = 0       	                            // Used for mob icon cache string.
	var/icon/icon_template                              // Used for mob icon generation for non-32x32 species.
	var/appearance_flags = 0      						// Appearance/display related features.
	var/show_ssd = "fast asleep"

	var/colorable = FALSE
	var/color_mode = ICON_MULTIPLY

	var/selectable = FALSE

	var/virus_immune = FALSE

	var/backpack_icon = 	'icons/inventory/back/mob.dmi'
	var/uniform_icon = 		'icons/inventory/uniform/mob.dmi'
	var/gloves_icon = 		'icons/inventory/hands/mob.dmi'
	var/glasses_icon = 		'icons/inventory/eyes/mob.dmi'
	var/ears_icon = 		'icons/inventory/ears/mob.dmi'
	var/shoes_icon = 		'icons/inventory/feet/mob.dmi'
	var/s_store_icon = 		'icons/inventory/on_suit/mob.dmi'
	var/hat_icon = 			'icons/inventory/head/mob.dmi'
	var/belt_icon = 		'icons/inventory/belt/mob.dmi'
	var/suit_icon = 		'icons/inventory/suit/mob.dmi'
	var/mask_icon = 		'icons/inventory/face/mob.dmi'
	var/underwear_icon = 	'icons/inventory/underwear/mob.dmi'
	var/misc_icon = 		'icons/mob/mob.dmi'

/datum/species_form/proc/get_mob_icon(var/slot, var/icon_state)
	var/icon/I
	switch(slot)
		if("misk")    	I = misc_icon
		if("uniform") 	I = uniform_icon
		if("suit")    	I = suit_icon
		if("gloves")  	I = gloves_icon
		if("glasses") 	I = glasses_icon
		if("ears")    	I = ears_icon
		if("mask")    	I = mask_icon
		if("head")    	I = hat_icon
		if("shoes")   	I = shoes_icon
		if("belt")    	I = belt_icon
		if("s_store") 	I = s_store_icon
		if("back")    	I = backpack_icon
		/*if("tie")   	I = ties_icon
		if("hidden")  	I = hidden_icon
		if("rig")     	I = rig_back*/
		else
			log_world("##ERROR. Wrong sprite group for mob icon \"[slot]\"")

	return I

/datum/species_form/proc/get_bodytype()
	return name

//Used to gain the reduced form of something that shouldn't be playable, I guess?
/datum/species_form/proc/get_station_variant()
	return name

/datum/species_form/proc/get_facial_hair_styles(var/gender)
	return GLOB.facial_hair_styles_list

/datum/species_form/proc/get_hair_styles(var/gender)
	return GLOB.hair_styles_list
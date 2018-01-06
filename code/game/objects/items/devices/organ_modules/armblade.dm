/obj/item/weapon/material/hatchet/tacknife/armblade
	icon_state = "armblade"
	item_state = null
//	sprite_group = SPRITE_MELEE
	name = "armblade"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "armblade"
	applies_material_colour = 0

/*
/obj/item/weapon/material/hatchet/tacknife/armblade/on_mob_description(mob/living/carbon/human/H, datum/gender/T, slot, slot_name)
	if(!slot in list(slot_l_hand, slot_r_hand))
		return ..()

	var/msg = "There's "
	var/end_part = "\a \icon[src] [src] sticking out from [T.his] [slot_name]"

	if(blood_DNA)
		msg = SPAN_WARN("[msg] [gender==PLURAL?"some":"a"] [(blood_color != SYNTH_BLOOD_COLOUR) ? "blood" : "oil"]-stained [end_part]!")
	else
		msg += "[end_part]."
	return msg
*/

/obj/item/organ_module/active/simple/wolverine
	name = "embed claws"
	verb_name = "Deploy embed claws"
	icon_state = "wolverine"
	allowed_organs = list(BP_R_HAND, BP_L_HAND)
	holding_type = /obj/item/weapon/material/hatchet/tacknife/armblade/claws

/obj/item/weapon/material/hatchet/tacknife/armblade/claws
	icon_state = "wolverine"
	name = "claws"

/obj/item/organ_module/active/simple/armblade
	name = "embed blade"
	verb_name = "Deploy embed blade"
	icon_state = "armblade"
	allowed_organs = list(BP_R_HAND, BP_L_HAND)
	holding_type = /obj/item/weapon/material/hatchet/tacknife/armblade


/obj/item/organ/internal/cell
	name = "microbattery"
	desc = "A small, powerful cell for use in fully prosthetic bodies."
	icon = 'icons/obj/power.dmi'
	icon_state = "scell"
	organ_tag = O_CELL
	parent_organ = "chest"
	vital = 1

/obj/item/organ/internal/cell/New()
	status |= ORGAN_ROBOT|ORGAN_ASSISTED
	..()

/obj/item/organ/internal/cell/replaced()
	..()
	// This is very ghetto way of rebooting an IPC. TODO better way.
	if(owner && owner.stat == DEAD)
		owner.stat = 0
		owner.visible_message(SPAN_DANGER("\The [owner] twitches visibly!"))

/obj/item/organ/optical_sensor
	name = "optical sensor"
	organ_tag = "optics"
	parent_organ = "head"
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "camera"
	dead_icon = "camera_broken"

/obj/item/organ/optical_sensor/New()
	status |= ORGAN_ROBOT|ORGAN_ASSISTED
	..()

// Used for an MMI or posibrain being installed into a human.
/obj/item/organ/mmi_holder
	name = "brain"
	organ_tag = "brain"
	parent_organ = "chest"
	vital = 1
	var/obj/item/device/mmi/stored_mmi

/obj/item/organ/mmi_holder/proc/update_from_mmi()
	if(!stored_mmi)
		return
	name = stored_mmi.name
	desc = stored_mmi.desc
	icon = stored_mmi.icon
	icon_state = stored_mmi.icon_state

/obj/item/organ/mmi_holder/removed(var/mob/living/user)

	if(stored_mmi)
		stored_mmi.loc = get_turf(src)
		if(owner.mind)
			owner.mind.transfer_to(stored_mmi.brainmob)
	..()

	var/mob/living/holder_mob = loc
	if(istype(holder_mob))
		holder_mob.drop_from_inventory(src)
	qdel(src)

/obj/item/organ/mmi_holder/New()
	..()
	// This is very ghetto way of rebooting an IPC. TODO better way.
	spawn(1)
		if(owner && owner.stat == DEAD)
			owner.stat = 0
			owner.visible_message(SPAN_DANGER("\The [owner] twitches visibly!"))

/obj/item/organ/mmi_holder/posibrain/New()
	status |= ORGAN_ROBOT|ORGAN_ASSISTED
	stored_mmi = new /obj/item/device/mmi/digital/posibrain(src)
	..()
	spawn(30)
		if(owner)
			stored_mmi.name = "positronic brain ([owner.name])"
			stored_mmi.brainmob.real_name = owner.name
			stored_mmi.brainmob.name = stored_mmi.brainmob.real_name
			stored_mmi.icon_state = "posibrain-occupied"
			update_from_mmi()
		else
			stored_mmi.loc = get_turf(src)
			qdel(src)

extends Node

var activeBoons : Array = []

func addBoon(boon):
	var boonGrid = get_tree().current_scene.find_child("BoonGrid")
	boonGrid.add_child(boon)

func popEvent(type):
	for boon in activeBoons:
		if is_instance_valid(boon):
			if boon.activateType == "Pop" and type == "Pop":
				boon.activate()
			if boon.activateType == "Player Pop" and type == "Player Pop":
				boon.activate()
		else:
			activeBoons.erase(boon)

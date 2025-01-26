extends Node

var activeBoons : Array = []

var activeBursts : Array = []

func addBoon(boon):
	var boonGrid = get_tree().current_scene.find_child("BoonGrid")
	boonGrid.add_child(boon)
	
func addBurst(burst):
	activeBursts.push_back(burst)
	var burstGrid = get_tree().current_scene.find_child("BurstGrid")
	burstGrid.add_child(burst)

func popEvent(type):
	for burst in activeBursts:
		if is_instance_valid(burst):
			if burst.activateType.has("Pop") and type == "Pop":
				burst.activate()
				break
			if burst.activateType.has("Player Pop") and type == "Player Pop":
				burst.activate()
				break
		else:
			activeBursts.erase(burst)

	for boon in activeBoons:
		if is_instance_valid(boon):
			if boon.activateType == "Pop" and type == "Pop":
				boon.activate()
			if boon.activateType == "Player Pop" and type == "Player Pop":
				boon.activate()
		else:
			activeBoons.erase(boon)

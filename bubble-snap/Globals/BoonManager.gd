extends Node

var activeBoons : Array = []

var activeBursts : Array = []

func resetBoons():
	for x in activeBoons:
		x.queue_free()
	for z in activeBursts:
		z.queue_free()
	activeBoons.clear()
	activeBursts.clear()

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
		print(boon)
		if is_instance_valid(boon):
			if boon.activateType.has("Pop") and type == "Pop":
				boon.activate()
			if boon.activateType.has("Player Pop") and type == "Player Pop":
				boon.activate()
		else:
			activeBoons.erase(boon)

extends Node

var activeBoons : Array = []

func popEvent():
	for boon in activeBoons:
		if boon.activateType == "Pop":
			boon.activate()

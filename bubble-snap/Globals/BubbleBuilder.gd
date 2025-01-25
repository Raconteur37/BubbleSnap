extends Node

var bubbles = 81

var mainGrid

func buildBubbles():
	var row = -1
	var col = -1
	var bubbleNum = sqrt(bubbles) # make sure this is a perfect square
	mainGrid = get_tree().current_scene.find_child("MainGrid")
	for grids in range(bubbleNum):
		row = -1
		col += 1
		var grid = GridContainer.new()
		grid.columns = bubbleNum
		mainGrid.add_child(grid)
		for z in range(bubbleNum):
			row += 1
			var bubbleButton = load("res://Cameron/BubbleButton.tscn")
			bubbleButton = bubbleButton.instantiate()
			bubbleButton.row = col
			bubbleButton.col = row
			grid.add_child(bubbleButton)

func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_W:
				buildBubbles()

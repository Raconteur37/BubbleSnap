extends Control

var commonBoons = ["Chain Pop", "Chain Pop", "Chain Pop"]
var rareBoons = []
var legendaryBoons = []

var chosenBoons = []

var animationPlayer
var audioPlayer

var rarity

var itemOneFrame
var itemTwoFrame
var itemThreeFrame

var itemOneLabel
var itemTwoLabel
var itemThreeLabel

var itemOneIcon
var itemTwoIcon
var itemThreeIcon

var itemOneDescription
var itemTwoDescription
var itemThreeDescription

func _ready() -> void:
	animationPlayer = $AnimationPlayer
	audioPlayer = $AudioStreamPlayer2D
	animationPlayer.play("Appear")
	
	itemOneFrame = $VBoxContainer/HBoxContainer/ItemOne
	itemTwoFrame = $VBoxContainer/HBoxContainer/ItemTwo
	itemThreeFrame = $VBoxContainer/HBoxContainer/ItemThree
	
	itemOneLabel = $VBoxContainer/HBoxContainer/ItemOne/ItemOneLabel
	itemTwoLabel = $VBoxContainer/HBoxContainer/ItemTwo/ItemTwoLabel
	itemThreeLabel = $VBoxContainer/HBoxContainer/ItemThree/ItemThreeLabel
	
	itemOneIcon = $VBoxContainer/HBoxContainer/ItemOne/ItemOneIcon
	itemTwoIcon = $VBoxContainer/HBoxContainer/ItemTwo/ItemTwoIcon
	itemThreeIcon = $VBoxContainer/HBoxContainer/ItemThree/ItemThreeIcon
	
	itemOneDescription = $VBoxContainer/HBoxContainer/ItemOne/ItemOneDescription
	itemTwoDescription = $VBoxContainer/HBoxContainer/ItemTwo/ItemTwoDescription
	itemThreeDescription = $VBoxContainer/HBoxContainer/ItemThree/ItemThreeDescription

func chooseItems():
	var randNum = randi_range(0,100)
	if randNum <= 75:
		rarity = "Common"
	elif randNum <= 95:
		rarity = "Rare"
	else:
		rarity = "Legendary"
	
	match rarity:
		
		"Common":
			itemOneFrame.texture = load("res://Elijah/UI/Upgrade/Upgrade_Common.png")
			itemTwoFrame.texture = load("res://Elijah/UI/Upgrade/Upgrade_Common.png")
			itemThreeFrame.texture = load("res://Elijah/UI/Upgrade/Upgrade_Common.png")
			for x in range(3):
				var chosenBoon = commonBoons.pick_random()
				commonBoons.erase(chosenBoons)
				chosenBoons.append(chosenBoon)
				
		"Rare":
			itemOneFrame.texture = load("res://Elijah/UI/Upgrade/Upgrade_Uncommon.png")
			itemTwoFrame.texture = load("res://Elijah/UI/Upgrade/Upgrade_Uncommon.png")
			itemThreeFrame.texture = load("res://Elijah/UI/Upgrade/Upgrade_Uncommon.png")
			for x in range(3):
				var chosenBoon = rareBoons.pick_random()
				rareBoons.erase(chosenBoons)
				chosenBoons.append(chosenBoon)
				
		"Legendary":
			itemOneFrame.texture = load("res://Elijah/UI/Upgrade/Upgrade_Rare.png")
			itemTwoFrame.texture = load("res://Elijah/UI/Upgrade/Upgrade_Rare.png")
			itemThreeFrame.texture = load("res://Elijah/UI/Upgrade/Upgrade_Rare.png")
			for x in range(3):
				var chosenBoon = legendaryBoons.pick_random()
				legendaryBoons.erase(chosenBoons)
				chosenBoons.append(chosenBoon)
	
	for z in range(3):
		print(chosenBoons)
		if z == 0:
			var boon = getBoon(chosenBoons[z]).instantiate()
			itemOneLabel.text = boon.boonName
			itemOneIcon = boon.icon
			itemOneDescription.text = boon.description
			itemOneFrame.show()
		if z == 1:
			var boon = getBoon(chosenBoons[z]).instantiate()
			itemTwoLabel.text = boon.boonName
			itemTwoIcon = boon.icon
			itemTwoDescription.text = boon.description
			itemTwoFrame.show()
		if z == 2:
			var boon = getBoon(chosenBoons[z]).instantiate()
			itemThreeLabel.text = boon.boonName
			itemThreeIcon = boon.icon
			itemThreeDescription.text = boon.description
			itemThreeFrame.show()

func getBoon(boonName):
	match boonName:
		
		"Chain Pop":
			return load("res://Boons/ChainPopBoon.tscn")


func _on_timer_timeout() -> void:
	chooseItems()

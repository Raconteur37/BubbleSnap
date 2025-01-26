extends Control

var commonBoons = ["Bonus Pop", "Extra Pop", "Extra Time", "Extra Hand"]
var rareBoons = ["Chain Pop","Chain Pop","Chain Pop"]
var legendaryBoons = ["Double Bubble","Double Bubble","Double Bubble"]

var commonBursts = ["Time Drain","Picky Burst"]
var rareBursts = ["Symetry Burst"] 
var legendaryBursts = ["Half Time"]

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

var itemOneParticle
var itemTwoParticle
var itemThreeParticle

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
	
	itemOneParticle = $VBoxContainer/HBoxContainer/BoonParticle
	itemTwoParticle = $VBoxContainer/HBoxContainer/BoonParticle2
	itemThreeParticle = $VBoxContainer/HBoxContainer/BoonParticle3
	

func chooseItems():
	var randNum = randi_range(0,100)
	print(randNum)
	if randNum <= 75:
		rarity = "Common"
	elif randNum <= 95:
		rarity = "Rare"
	else:
		rarity = "Legendary"
	   
	match rarity:
		
		"Common":
			itemOneFrame.texture_normal = load("res://Elijah/UI/Upgrade/Upgrade_Common.png")
			itemTwoFrame.texture_normal = load("res://Elijah/UI/Upgrade/Upgrade_Common.png")
			itemThreeFrame.texture_normal = load("res://Elijah/UI/Upgrade/Upgrade_Common.png")
			for x in range(3):
				var chosenBoon = commonBoons.pick_random()
				commonBoons.erase(chosenBoons)
				chosenBoons.append(chosenBoon)
				
		"Rare":
			itemOneFrame.texture_normal = load("res://Elijah/UI/Upgrade/Upgrade_Uncommon.png")
			itemTwoFrame.texture_normal = load("res://Elijah/UI/Upgrade/Upgrade_Uncommon.png")
			itemThreeFrame.texture_normal = load("res://Elijah/UI/Upgrade/Upgrade_Uncommon.png")
			for x in range(3):
				var chosenBoon = rareBoons.pick_random()
				rareBoons.erase(chosenBoons)
				chosenBoons.append(chosenBoon)
				
		"Legendary":
			itemOneFrame.texture_normal = load("res://Elijah/UI/Upgrade/Upgrade_Rare.png")
			itemTwoFrame.texture_normal = load("res://Elijah/UI/Upgrade/Upgrade_Rare.png")
			itemThreeFrame.texture_normal = load("res://Elijah/UI/Upgrade/Upgrade_Rare.png")
			for x in range(3):
				var chosenBoon = legendaryBoons.pick_random()
				legendaryBoons.erase(chosenBoons)
				chosenBoons.append(chosenBoon)
	
	for z in range(3):
		if z == 0:
			itemOneParticle.emitting = true
			await get_tree().create_timer(0.5).timeout
			itemOneParticle.emitting = false
			var boon = getBoon(chosenBoons[z]).instantiate()
			itemOneLabel.text = boon.boonName
			itemOneIcon.texture = load(boon.icon)
			itemOneDescription.text = boon.description
			itemOneFrame.show()
		if z == 1:
			itemTwoParticle.emitting = true
			await get_tree().create_timer(0.5).timeout
			itemTwoParticle.emitting = false
			var boon = getBoon(chosenBoons[z]).instantiate()
			itemTwoLabel.text = boon.boonName
			itemTwoIcon.texture = load(boon.icon)
			itemTwoDescription.text = boon.description
			itemTwoFrame.show()
		if z == 2:
			itemThreeParticle.emitting = true
			await get_tree().create_timer(0.5).timeout 
			itemThreeParticle.emitting = false
			var boon = getBoon(chosenBoons[z]).instantiate()
			itemThreeLabel.text = boon.boonName
			itemThreeIcon.texture = load(boon.icon)
			itemThreeDescription.text = boon.description
			itemThreeFrame.show()
		await get_tree().create_timer((.5)).timeout

func getBoon(boonName):
	match boonName:
		
		"Chain Pop":
			return load("res://Boons/ChainPopBoon.tscn")
		"Bonus Pop":
			return load("res://Boons/BonusPopBoon.tscn")
		"Double Bubble":
			return load("res://Boons/DoubleBubblePopBoon.tscn")
		"Extra Time":
			return load("res://Boons/Extra Time.tscn")
		"Extra Hand":
			return load("res://Boons/Extra Hand.tscn")

func decideBurst():
	if rarity == "Common":
		get_tree().current_scene.find_child("BurstGrid").add_child(getBurst(commonBursts.pick_random()).instantiate())
	if rarity == "Rare":
		get_tree().current_scene.find_child("BurstGrid").add_child(getBurst(rareBursts.pick_random()).instantiate())
	if rarity == "Legendary":
		get_tree().current_scene.find_child("BurstGrid").add_child(getBurst(legendaryBursts.pick_random()).instantiate())


func getBurst(burstName):
	match burstName:
		
		"Half Time":
			return load("res://Bursts/Half Time Burst.tscn")
		"Picky Burst":
			return load("res://Bursts/Picky Burst.tscn")
		"Symetry Burst":
			return load("res://Bursts/SymetryBurst.tscn")
		"Time Drain":
			return load("res://Bursts/Time Drain Burst.tscn")


func _on_timer_timeout() -> void:
	chooseItems()

func _on_item_one_mouse_entered() -> void:
	itemOneFrame.position.x -= 15
	itemOneFrame.scale.x = 1.1
	itemOneFrame.scale.y = 1.1

func _on_item_one_mouse_exited() -> void:
	itemOneFrame.position.x += 15
	itemOneFrame.scale.x = 1
	itemOneFrame.scale.y = 1

func _on_item_two_mouse_entered() -> void:
	itemTwoFrame.position.x -= 15
	itemTwoFrame.scale.x = 1.1
	itemTwoFrame.scale.y = 1.1

func _on_item_two_mouse_exited() -> void:
	itemTwoFrame.position.x += 15
	itemTwoFrame.scale.x = 1
	itemTwoFrame.scale.y = 1

func _on_item_three_mouse_entered() -> void:
	itemThreeFrame.position.x -= 15
	itemThreeFrame.scale.x = 1.1
	itemThreeFrame.scale.y = 1.1

func _on_item_three_mouse_exited() -> void:
	itemThreeFrame.position.x += 15
	itemThreeFrame.scale.x = 1
	itemThreeFrame.scale.y = 1

func disableButtons():
	itemOneFrame.disabled = true
	itemTwoFrame.disabled = true
	itemThreeFrame.disabled = true

func _on_item_one_pressed() -> void:
	get_tree().current_scene.find_child("BoonGrid").add_child(getBoon(chosenBoons[0]).instantiate())
	disableButtons()
	animationPlayer.play("FadeOut")

func _on_item_two_pressed() -> void:
	get_tree().current_scene.find_child("BoonGrid").add_child(getBoon(chosenBoons[1]).instantiate())
	disableButtons()
	animationPlayer.play("FadeOut")

func _on_item_three_pressed() -> void:
	get_tree().current_scene.find_child("BoonGrid").add_child(getBoon(chosenBoons[2]).instantiate())
	disableButtons()
	animationPlayer.play("FadeOut")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "FadeOut":
		decideBurst()
		queue_free()

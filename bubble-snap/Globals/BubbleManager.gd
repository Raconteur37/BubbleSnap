extends Node

var bubbleArray = []


func buildButtonsArray(amount):
	for x in range(amount):
		bubbleArray.append([])
		for z in range(amount):
			bubbleArray[x].append(0)
			print()

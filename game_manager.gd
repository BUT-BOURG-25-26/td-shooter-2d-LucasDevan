class_name GameManager
extends Node2D

@export var score : int =0
var mainScene
var listOfEnnemies = []
var scoreList = []

func _ready() -> void:
	mainScene = $".."
	
func _process(delta: float) -> void:
	var newListOfEnnemies = get_tree().get_nodes_in_group("Ennemy")
	if(listOfEnnemies != newListOfEnnemies):
		for i in range(len(listOfEnnemies)):
			if(listOfEnnemies[i] not in newListOfEnnemies):
				score += scoreList[i]
	scoreList.clear()
	for i in range(len(newListOfEnnemies)):
		if newListOfEnnemies[i] is EnnemieType3:
			scoreList.append(3)
		else:
			scoreList.append(1)

	listOfEnnemies = newListOfEnnemies

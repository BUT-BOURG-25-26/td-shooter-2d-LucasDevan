class_name Bullet
extends Area2D

var isFromPlayer : bool = false
@export var speed : float = 300
var player : Player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	
func _physics_process(delta: float) -> void:
	if(isFromPlayer):
		global_position.y=global_position.y-delta*speed
	else:
		global_position.y=global_position.y+delta*speed
		if(not isFromPlayer):
			if(touchesPlayer()):
				player.takeDamage()
				print("touch player!")
				free()
		else:
			touchesEnnemies()
	
func touchesPlayer(action_range : float = 80)->bool:
	if(player!=null):
		var vectorial_space_between = player.global_position - global_position
		var norme = vectorial_space_between.x**2 +vectorial_space_between.y**2
		if(norme>action_range):
			return false
		return true
	return false

func touchesEnnemies(action_range:float =80):
	var ennemiesGroupe = get_tree().get_nodes_in_group("Ennemy")
	for i in range(len(ennemiesGroupe)):
		var vectorial_space_between = ennemiesGroupe[i].global_position - global_position
		var norme = vectorial_space_between.x**2 +vectorial_space_between.y**2
		if(norme>action_range):
			ennemiesGroupe[i].free()
			queue_free()
			return


func _on_body_enter(body:Node2D)->void:
	if(body is Ennemie):
		queue_free()
	if(body is Player):
		body.takeDamage()
	print("touche new")

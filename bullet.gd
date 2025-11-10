class_name Bullet
extends Area2D

var isFromPlayer : bool = true
@export var speed : float = 500
var player : Player
var mainScene : Node2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	mainScene = $".."
	
func _physics_process(delta: float) -> void:
	if(isFromPlayer):
		global_position.y=global_position.y-delta*speed
	else:
		global_position.y=global_position.y+delta*speed

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	area.free()
	queue_free() # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	if(body is Ennemie and isFromPlayer):
		body.takeDamage()
		queue_free()
	elif(body is Player and not isFromPlayer):
		body.takeDamage()
		queue_free()

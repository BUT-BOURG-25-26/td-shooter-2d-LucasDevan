class_name EnnemieSpawner
extends Node2D
var timer : Timer 
var mainScene : Node2D
@export var ennemyScene : PackedScene
@export var ennemy2Scene : PackedScene
@export var ennemy3Scene : PackedScene

func _ready() -> void:
	mainScene = $".."
	timer = $Timer
	timer.start()

func spawnEnnemy():
	var ennemy : Ennemie
	var random = randi()
	if(random%2==0):
		ennemy= ennemyScene.instantiate()
	elif(random%3==0 or random%3==1):
		ennemy= ennemy2Scene.instantiate()
	else:
		ennemy= ennemy3Scene.instantiate()

	var camera = get_viewport().get_camera_2d()
	var visibelRect = get_viewport().get_visible_rect()
	
	var minX = camera.get_screen_center_position().x - (visibelRect.size.x/2)
	var maxX = camera.get_screen_center_position().x + (visibelRect.size.x/2)

	var minY = camera.get_screen_center_position().y - (visibelRect.size.y/2)
	var maxY = camera.get_screen_center_position().y + (visibelRect.size.y/2) + 20
	
	ennemy.global_position.x=randf_range(minX+30,maxX-30)
	ennemy.global_position.y=minY-50
	mainScene.add_child(ennemy)
	
func _on_timer_timeout() -> void:
	spawnEnnemy()

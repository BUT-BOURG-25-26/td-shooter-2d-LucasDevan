extends Node2D

@export var ennemyScene : PackedScene

func spawnEnnemy():
	var ennemy = ennemyScene.instantiate()
	
	var camera = get_viewport().get_camera_2d()
	var visibelRect = get_viewport().get_visible_rect()
	
	var minX = camera.get_screen_center_position().x - (visibelRect.size.x/2)
	var maxX = camera.get_screen_center_position().x + (visibelRect.size.x/2)

	var minY = camera.get_screen_center_position().y - (visibelRect.size.y/2)
	var maxY = camera.get_screen_center_position().y + (visibelRect.size.y/2) + 20
	
	ennemy.global_position.x=0
	
	

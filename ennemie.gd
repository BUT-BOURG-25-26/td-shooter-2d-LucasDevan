class_name Ennemie
extends CharacterBody2D
@export var speed : float = 500
var maxDiviation : float = 40
var counter : float = 0
@export var sideMovementRange : float = 7
@export var sideMovementSpeed : float = 200
@export var health : int = 1
@export var bullet_scene: PackedScene
var mainScene : Node2D

@export var beforeScreenOffSet : float = 40
func _ready() -> void:
	mainScene = $".."

func _physics_process(delta: float) -> void:
	
	velocity.y = speed/3
	if(is_on_screen()):
		velocity.x = sideMovementSpeed * sin(counter)
		counter+=sideMovementRange/100
	move_and_slide()
	

func shoot()-> void:
	var bullet : BulletEnnemie = bullet_scene.instantiate()
	mainScene.add_child(bullet)
	bullet.isFromPlayer=false
	bullet.global_position = Vector2(global_position.x,global_position.y+40)
	return
	
func is_on_screen()->bool:
	var camera = get_viewport().get_camera_2d()
	var visibelRect = get_viewport().get_visible_rect()
	
	var minX = camera.get_screen_center_position().x - (visibelRect.size.x/2)
	var maxX = camera.get_screen_center_position().x + (visibelRect.size.x/2)

	var minY = camera.get_screen_center_position().y - (visibelRect.size.y/2) - beforeScreenOffSet
	var maxY = camera.get_screen_center_position().y + (visibelRect.size.y/2) + 20
	
	if(global_position.y>minY and global_position.y<maxY and global_position.x>minX and global_position.x<maxX):
		return true
	return false
	
func takeDamage()->void:
	health = health - 1
	if(health<=0):
		queue_free()

func _on_timer_timeout() -> void:
	shoot()

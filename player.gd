class_name Player
extends CharacterBody2D
var currentHealth = 3;
@export var maxHealth	= 3;
var coolDown = 0;
@export var maxCoolDown = 30;
@export var bullet_scene: PackedScene
@export var moveThreshold = 20
var mainScene : Node2D
@export var speed:float=300;
const Bullet = preload("res://bullet.gd")

func _ready() -> void:
	mainScene = $".."

func takeDamage() -> void:
	currentHealth -= 1
	if(currentHealth<0):
		currentHealth=0

func getMovementInputs() -> float:
	var movement = Input.get_action_strength("moveRight") -  Input.get_action_strength("moveLeft")
	if Input.is_action_pressed("click"):
		var mouse_local = get_local_mouse_position()
		if(abs(mouse_local.x) > moveThreshold):
			movement = 1
		if(mouse_local.x < -moveThreshold):
			movement = -1
	return movement

func getShoot()->bool:
	return ( Input.get_action_strength("shoot")>0.5)

func _process(delta: float) -> void:
	if(coolDown<=0):
			shoot()
			coolDown = maxCoolDown
	else:
		coolDown -= 1

func _physics_process(delta: float) -> void:
	velocity.x = getMovementInputs() * speed
	move_and_slide()
	
func shoot()-> void:
	var bullet : Bullet = bullet_scene.instantiate()
	mainScene.add_child(bullet)
	bullet.isFromPlayer=true
	bullet.global_position = Vector2(global_position.x,global_position.y-50)
	return
	
func _on_area_enter(body:Node2D)->void:
	if(body is Ennemie):
		body.queue_free()
	if(body is Player):
		body.takeDamage()
	print("touche new")

extends CharacterBody2D

class_name PlayerCharacter

@export var speed: int = 1
@export var projectile: PackedScene
@export var enemy: PackedScene
@onready var spawn_point: Marker2D = $SpawnPoint
const MOVE_SPEED: float = 400.0

func _physics_process(delta: float) -> void:
	move()
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"): shoot()

func move() -> void:
	var movement: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("left"): movement.x -= 1.0
	if Input.is_action_pressed("right"): movement.x += 1.0
	if Input.is_action_pressed("up"): movement.y -= 1.0
	if Input.is_action_pressed("down"): movement.y += 1.0
	velocity = movement.normalized() * (MOVE_SPEED * speed)
	move_and_slide()

func shoot() -> void: 
	var inst: Projectile = projectile.instantiate()
	get_parent().add_child(inst)
	inst.transform = spawn_point.global_transform

func slow_move() -> void:
	print("Power Up")


func _on_button_pressed():
	var inst: Enemy_2 = enemy.instantiate()
	get_parent().add_child(inst)
	inst.transform = spawn_point.global_transform

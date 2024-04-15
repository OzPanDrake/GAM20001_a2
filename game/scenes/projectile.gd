extends Area2D

class_name Projectile

var speed: float = 15.0
var damage: float = 30.0

func _ready() -> void:
	body_entered.connect(on_body_entered)

func _physics_process(delta: float) -> void:
	position += transform.x * speed

func on_body_entered(body: Node2D) -> void:
	if body is PlayerCharacter: return
	if body is Enemy_2:
		var enemy: Enemy_2 = body as Enemy_2
		enemy.apply_damage(damage)
	queue_free()

extends Area2D

class_name Projectile

var speed: float = 15.0

func _physics_process(delta):
	position += transform.x * speed

extends Area2D

class_name Projectile

var speed: float = 15.0
var damage: float = 30.0
var time_to_live: float =  0.4

func _ready() -> void:
	body_entered.connect(on_body_entered)
	handle_time_to_live()

func handle_time_to_live() -> void:
	var ttl_timer: Timer = Timer.new()
	add_child(ttl_timer)
	ttl_timer.wait_time = time_to_live
	ttl_timer.one_shot = true
	ttl_timer.timeout.connect(func(): queue_free())
	ttl_timer.start()

func _physics_process(delta: float) -> void:
	position += transform.x * speed

func on_body_entered(body: Node2D) -> void:
	if body is PlayerCharacter: return
	if body is Enemy_2:
		var enemy: Enemy_2 = body as Enemy_2
		enemy.apply_damage(damage)
	queue_free()

extends Area2D

class_name Power_Down

var speed: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is PlayerCharacter:
		var player: PlayerCharacter = body as PlayerCharacter
		player.slow_move()
		queue_free()

extends Timer

var enemy1 = preload("res://scenes/enemy_1.tscn")
var enemy2 = preload("res://scenes/enemy_2.tscn")
var enemy3 = preload("res://scenes/enemy_3.tscn")

func _on_timeout():
	randomize()
	var enemies = [enemy1, enemy2, enemy3]
	var kinds = enemies[randi()% enemies.size()]
	var enemy = kinds.instacne()
	enemy.position = Vector2(randi_range(10, 990), 590)
	add_child(enemy)
	wait_time = randi_range(0,1)

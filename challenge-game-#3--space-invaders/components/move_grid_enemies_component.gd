extends Node
class_name MoveGridEnemiesComponent

@export var enemies: SpawnEnemiesComponent

var _speed := 100.0

func _process(delta: float) -> void:
	if not Global.player_is_alive:
		return
	
	enemies.position.x += _speed * delta
	
	if enemies.position.x > Global.edge - enemies.length:
		move_down_and_flip_direction()
	if enemies.position.x < 20:
		move_down_and_flip_direction()
	
func move_down_and_flip_direction() -> void:
	enemies.position.y += 30
	_speed = _speed * -1

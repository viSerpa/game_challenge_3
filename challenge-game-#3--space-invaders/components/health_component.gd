extends Node
class_name HealthComponent

signal enemy_died
signal game_over
signal mothership_died
signal player_hit

@export var max_health: int
var current_health: int

func _ready() -> void:
	current_health = max_health

func take_damage() -> void:
	current_health = current_health - 1
	if current_health <= 0:
		enemy_died.emit(get_parent())
		get_parent().queue_free()

func mothership_destroyed() -> void:
	current_health = current_health - 1
	if current_health <= 0:
		mothership_died.emit()
		get_parent().queue_free()

func player_damaged() -> void:
	current_health = current_health - 1
	player_hit.emit()
	print("Player health: " + str(current_health))
	if current_health <= 0:
		game_over.emit()

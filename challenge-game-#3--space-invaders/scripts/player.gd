extends CharacterBody2D
class_name Player

var start_pos := Vector2(576, 600)

func _ready() -> void:
	position = start_pos

func _process(_delta: float) -> void:
	#check if player is alive
	alive()

func _on_health_component_player_hit() -> void:
	position = start_pos
	Global.player_is_alive = false

func alive() -> void:
	if not get_tree().paused:
		if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
			Global.player_is_alive = true

func _on_health_component_game_over() -> void:
	get_tree().paused = true

func _unhandled_input(event: InputEvent) -> void:
	if get_tree().paused:
		if event.is_action_pressed("restart"):
			get_tree().paused = false
			get_tree().reload_current_scene()

extends Area2D
class_name Mothership

@export var move_component: MoveComponent
@export var score_component: ScoreComponent
@export var health_component: HealthComponent

var start_pos := Vector2(-50, 20)
var has_spawned := false

func _process(_delta: float) -> void:
	if not Global.player_is_alive:
		position = start_pos
		has_spawned = false
		return
		
	if Global.player_is_alive and not has_spawned:
		spawn_mothership()
		has_spawned = true
	

func spawn_mothership() -> void:
	var rand_timer = randi_range(10, 15)
	await get_tree().create_timer(rand_timer).timeout
	move_component.velocity = Vector2(150.0, 0)

func take_damage() -> void:
	health_component.mothership_destroyed()
	score_component.add_score()

extends Node
class_name BulletComponent

@export var bullet_scene: PackedScene
@export var actor: CharacterBody2D

var active_bullets := []

func create_bullet() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.global_position = actor.global_position
	add_child(bullet)
	active_bullets.append(bullet)

func check_out_of_bounds() -> void:
	for i in range(active_bullets.size() - 1, -1, -1):
		var bullet = active_bullets[i]
		if is_instance_valid(bullet) and bullet.position.y < 0.0:
			active_bullets.remove_at(i)

func _process(_delta: float) -> void:
	check_out_of_bounds()

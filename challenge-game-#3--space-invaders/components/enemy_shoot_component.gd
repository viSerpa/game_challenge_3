extends Node
class_name EnemyShootComponent

@export var spawn_enemies_component: SpawnEnemiesComponent
@export var enemy_bullet_scene: PackedScene

var active_enemy_bullets := []
var has_shot := false

#func _ready() -> void:
	#await get_tree().create_timer(1.0).timeout
	#rand_enemy_shoot()

func _process(_delta: float) -> void:
	check_out_of_bounds()
	
	if not Global.player_is_alive:
		has_shot = false
		return
	
	if Global.player_is_alive and not has_shot:
		rand_enemy_shoot()
		has_shot = true

func create_bullet(pos: Vector2) -> void:
	var bullet = enemy_bullet_scene.instantiate()
	bullet.global_position = pos
	add_child(bullet)
	active_enemy_bullets.append(bullet)

func rand_enemy_shoot() -> void:
	var total_enemies = spawn_enemies_component.enemy_arr.size()
	while total_enemies > 0:
		if not Global.player_is_alive:
			break
		if spawn_enemies_component.enemy_arr.is_empty():
			break
		var rand_enemy = spawn_enemies_component.enemy_arr.pick_random()
		#same as spawn_enemies_component.enemey_arr[randi_range(0,spawn_enemies_component.enemey_arr.size()-1)]
		var rand_time = randf_range(0.5, 1.5)
		if is_instance_valid(rand_enemy):
			create_bullet(rand_enemy.global_position)
		await get_tree().create_timer(rand_time).timeout

func check_out_of_bounds() -> void:
	#range( array size - 1, end when i reaches -1, step backwards through array )
	for i in range(active_enemy_bullets.size() - 1, -1, -1):
		var bullet = active_enemy_bullets[i] #bullet = current index of array
		if is_instance_valid(bullet) and bullet.position.y > 600.0: #check if bullet is still there and out of play area
			active_enemy_bullets.remove_at(i)
			bullet.queue_free()
		if not Global.player_is_alive:
			active_enemy_bullets.remove_at(i)
			bullet.queue_free()

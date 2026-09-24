extends Node2D
class_name SpawnEnemiesComponent

@export var yellow_enemy_scene: PackedScene
@export var red_enemy_scene: PackedScene
@export var green_enemy_scene: PackedScene
@export var mothership_scene: PackedScene

@export var enemy_count: int
@export var score_component: ScoreComponent

var spacing: int = 64
@warning_ignore("integer_division")
var start_pos: Vector2 = Vector2(length/2, 20)

var enemy_arr := []
var length := 0

func _ready() -> void:
	length = enemy_count * spacing
	position = start_pos
	spawn_enemies_grid()

func _process(_delta: float) -> void:
	if not Global.player_is_alive:
		@warning_ignore("integer_division")
		position.x = length / 2
		
func spawn_enemies_grid() -> void:
	for row in range(3):
		for col in range(enemy_count):
			var enemy
			if row == 0:
				enemy = green_enemy_scene.instantiate()
			elif row == 1:
				enemy = yellow_enemy_scene.instantiate()
			elif row == 2:
				enemy = red_enemy_scene.instantiate()
			var x_pos = col * spacing
			var y_pos = row * spacing
			enemy.global_position = Vector2(x_pos, y_pos)
			add_child(enemy)
			enemy_arr.append(enemy)
			
			var health_comp = enemy.get_node_or_null("HealthComponent")
			if health_comp:
				health_comp.enemy_died.connect(_on_enemy_died)
				health_comp.mothership_died.connect(_on_mothership_died)

func _on_mothership_died() -> void:
	score_component.add_mothership_score()

func _on_enemy_died(enemy_node: Node) -> void:
	if enemy_arr.has(enemy_node):
		score_component.add_score()
		enemy_arr.erase(enemy_node)
	
		if enemy_arr.is_empty():
			print("Player Wins")

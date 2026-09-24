extends Control
class_name Hud

@export var life_bar_1: TextureRect
@export var life_bar_2: TextureRect
@export var life_bar_3: TextureRect
@export var game_over_screen: Panel
@export var score_label: Label
@export var player: CharacterBody2D

func _process(_delta: float) -> void:
	show_score()

func _ready() -> void:
	game_over_screen.visible = false
	connect_signal()

func connect_signal() -> void:
	var health_comp = player.get_node_or_null("HealthComponent")
	if health_comp:
		health_comp.player_hit.connect(_on_player_hit)

func show_score() -> void:
	score_label.text = str(Global.score)

func _on_player_hit() -> void:
	var health_comp = player.get_node_or_null("HealthComponent")
	var player_health = health_comp.current_health
	if player_health == 2:
		life_bar_1.visible = false
	elif player_health == 1:
		life_bar_2.visible = false
	elif player_health == 0:
		life_bar_3.visible = false
		health_comp.game_over.connect(_on_game_over)

func _on_game_over() -> void:
	show_game_over()
	
func show_game_over() -> void:
	game_over_screen.visible = true

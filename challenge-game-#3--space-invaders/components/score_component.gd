extends Node
class_name ScoreComponent

@export var points: int

func add_score() -> void:
	Global.score += points

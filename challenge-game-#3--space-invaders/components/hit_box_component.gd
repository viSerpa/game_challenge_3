extends Area2D
class_name HitBoxComponent

@export var health_component: HealthComponent

func recieve_hit() -> void:
	health_component.take_damage()

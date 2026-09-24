extends Area2D
class_name PlayerHitBoxComponent

@export var health_component: HealthComponent

func _on_area_entered(area: Area2D) -> void:
	if area is EnemyBullet:
		health_component.player_damaged()

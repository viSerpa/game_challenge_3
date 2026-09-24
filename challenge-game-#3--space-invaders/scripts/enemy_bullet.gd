extends Area2D
class_name EnemyBullet

func _on_area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		queue_free()

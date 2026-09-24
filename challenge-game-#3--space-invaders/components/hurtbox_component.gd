extends Area2D
class_name HurtboxComponent

func _on_area_entered(area: Area2D) -> void:
	if area is HitBoxComponent:
		area.recieve_hit()
		get_parent().queue_free()
	elif area is Mothership:
		area.take_damage()
		queue_free()

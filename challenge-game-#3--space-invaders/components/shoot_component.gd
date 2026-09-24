extends Node
class_name ShootComponent

@export var bullet_component: BulletComponent

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		bullet_component.create_bullet()

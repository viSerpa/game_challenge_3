extends Node
class_name MoveInputComponent

#depends on move_component in order to function
@export var move_component: MoveComponent
const _SPEED := 400.0

func _input(_event: InputEvent) -> void:
	var input_axis = Input.get_axis("move_left", "move_right")
	move_component.velocity = Vector2(input_axis * _SPEED, 0)

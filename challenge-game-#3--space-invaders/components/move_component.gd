extends Node
class_name MoveComponent

@export var actor: Node2D
@export var velocity: Vector2

var _offset := 30

func _process(delta: float) -> void:
	actor.translate(velocity * delta)
	if actor.position.y == 600:
		actor.position.x = clamp(actor.position.x, _offset, Global.edge - _offset)

extends Node
class_name EnemyMoveComponent

@export var move_component: MoveComponent
@export var actor: CharacterBody2D

var speed := 500
const _START_POS := Vector2(20,20)

func _ready() -> void:
	actor.position = _START_POS
	move_component.velocity = Vector2(1,0) * speed
	
func _process(_delta: float) -> void:
	if actor.position.x > Global.edge - 20.0:
		move_down_and_flip_direction()
	if actor.position.x < 20:
		move_down_and_flip_direction()
	
func move_down_and_flip_direction() -> void:
	actor.position.y += 30
	speed = speed * -1
	move_component.velocity = Vector2(1,0) * speed
	print("speed changed")

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		speed = speed * -1
		actor.position.y += 30
		move_component.velocity = Vector2(1,0) * speed
		print("speed changed")

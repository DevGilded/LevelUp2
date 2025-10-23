extends Node2D

var can_interact: bool = false
var current_body

@onready var sprite: Sprite2D = $Sprite2D
@onready var close_collision: CollisionShape2D = $Area2D/closeCollision
@onready var open_collision: CollisionShape2D = $Area2D/openCollision
@onready var static_collision: CollisionShape2D = $StaticBody2D/staticCollision

func _input(_event: InputEvent) -> void:
	if !can_interact: return
	
	if Input.is_action_just_pressed('INTERACT'):
		sprite.frame = 0 if sprite.frame == 1 else 1
		static_collision.disabled = !static_collision.disabled
	
	if sprite.frame == 1:
		close_collision.disabled = true
		open_collision.disabled = false
	else:
		close_collision.disabled = false
		open_collision.disabled = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	current_body = body
	#if body is not CharacterBody2D: return
	can_interact = true


func _on_area_2d_body_exited(_body: Node2D) -> void:
	can_interact = false

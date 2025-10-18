extends Node2D

@export var UpTheLadder: Node2D
@export var DownTheLadder: Node2D

var _can_climb_up = false
var _can_climb_down = false

var _node: Node2D

func _input(_event: InputEvent) -> void:
	if !_node: return
	if Input.is_action_just_pressed('ui_accept') and _can_climb_up:
		_node.position = UpTheLadder.global_position
	elif Input.is_action_just_pressed('ui_accept') and _can_climb_down:
		_node.position = DownTheLadder.global_position

func _on_ladder_down(body: Node2D) -> void:
	_can_climb_up = true
	_node = body

func _on_ladder_down_leave(_body: Node2D) -> void:
	_can_climb_up = false


func _on_ladder_up(body: Node2D) -> void:
	_can_climb_down = true
	_node = body

func _on_ladder_up_leave(_body: Node2D) -> void:
	_can_climb_down = false

extends Node2D

@export var UpTheLadder: Node2D
@export var DownTheLadder: Node2D

@onready var path: PathFollow2D = $Path2D/PathFollow2D
@onready var ladder: Node2D = $Path2D/PathFollow2D/Node2D

var _can_climb_up = false
var _can_climb_down = false

var is_climbing = false

var _node: Node2D

func _input(_event: InputEvent) -> void:
	if !_node: return
	
	if is_climbing:
		if Input.is_action_pressed("UP"):
			path.progress_ratio = clamp(path.progress_ratio + 0.01, 0.0, 1.0)
		if Input.is_action_pressed("DOWN"):
			path.progress_ratio = clamp(path.progress_ratio - 0.01, 0.0, 1.0)

		_node.global_position = path.global_position - Vector2(5, 2)
	
	if Input.is_action_just_pressed("ui_accept") and _can_climb_up:
		if !is_climbing:
			is_climbing = true
			_node.set_physics_process(false)
			_node.rotation_degrees = 25

			# set path progress based on player's current position
			path.progress_ratio = get_progress_from_position(_node.global_position)
		else:
			is_climbing = false
			_node.set_physics_process(true)
			_node.rotation = 0
			path.progress_ratio = 0

			
		#_node.position = UpTheLadder.global_position
	elif Input.is_action_just_pressed('ui_accept') and _can_climb_down:
		pass
		#_node.position = DownTheLadder.global_position

func get_progress_from_position(pos: Vector2) -> float:
	var curve = $Path2D.curve
	if curve == null:
		return 0.0

	# Get the closest distance (offset in pixels) along the path
	var offset = curve.get_closest_offset($Path2D.to_local(pos))
	
	# Convert to progress_ratio (0.0 - 1.0)
	var total_length = curve.get_baked_length()
	return offset / total_length


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

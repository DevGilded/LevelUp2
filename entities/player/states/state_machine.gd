extends Node

@export var agent: PhysicsBody2D
@export var initial_state: State
@export var States: Dictionary[String, State] = {}

var current_state: State

func _ready() -> void:
	if initial_state:
		initial_state.Enter(agent)
		initial_state.Transitioned.connect(on_state_transition)
		current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_Update(delta)

func on_state_transition(state, new_state_name):
	if state != current_state:
		return
	
	var new_state: State = States.get(new_state_name)
	if !new_state:
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter(agent)
	if !new_state.Transitioned.is_connected(on_state_transition):
		new_state.Transitioned.connect(on_state_transition)
	
	current_state = new_state

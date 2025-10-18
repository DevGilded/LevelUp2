class_name PlayerWalk extends State

func Physics_Update(_delta: float) -> void:
	var direction = Input.get_axis('ui_left', 'ui_right')
	
	if !direction:
		Transitioned.emit(self, 'Idle')
	
	if agent is CharacterBody2D:
		agent.velocity.x = direction * agent.speed
		
	if Input.is_action_pressed('ui_accept'):
		Transitioned.emit(self, "Jump")

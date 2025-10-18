class_name PlayerIdle extends State

func Physics_Update(_delta: float) -> void:
	if agent is CharacterBody2D:
		if !agent.is_on_floor():
			Transitioned.emit(self, "Fall")
	
	if Input.is_action_pressed('ui_accept'):
		Transitioned.emit(self, "Jump")
	
	if Input.get_axis('ui_left', 'ui_right'):
		Transitioned.emit(self, "Walk")

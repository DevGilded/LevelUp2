class_name PlayerIdle extends State

func Physics_Update(_delta: float) -> void:
	if agent is CharacterBody2D:
		if !agent.is_on_floor():
			Transitioned.emit(self, "Fall")
	
	if Input.is_action_pressed('UP'):
		Transitioned.emit(self, "Jump")
	
	if Input.get_axis('LEFT', 'RIGHT'):
		Transitioned.emit(self, "Walk")

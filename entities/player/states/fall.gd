class_name PlayerFall extends State

func Physics_Update(delta: float) -> void:
	if agent is CharacterBody2D:
		if agent.is_on_floor():
			Transitioned.emit(self, 'Idle')
		
		var direction = Input.get_axis('ui_left', 'ui_right')
		agent.velocity.x = direction * (agent.speed * 0.5)
		agent.velocity.y += agent.gravity * delta

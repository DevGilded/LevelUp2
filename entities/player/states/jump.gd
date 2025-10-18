class_name PlayerJump extends State

func Physics_Update(delta: float) -> void:
	if agent is CharacterBody2D:
		var direction = Input.get_axis('ui_left', 'ui_right')
		agent.velocity.x = direction * (agent.speed * 0.75)
		agent.velocity.y = -agent.jump
		Transitioned.emit(self, 'Fall')

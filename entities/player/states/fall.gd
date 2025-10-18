class_name PlayerFall extends State

var fall_height: float = 0.0

func Physics_Update(delta: float) -> void:
	if agent is CharacterBody2D:
		if agent.is_on_floor():
			Transitioned.emit(self, 'Land', {height = fall_height})
			fall_height = 0.0
			agent.velocity.x = 0
			return
		
		var direction = Input.get_axis('ui_left', 'ui_right')
		agent.velocity.x = direction * (agent.speed * 0.5)
		agent.velocity.y += agent.gravity * delta
		fall_height += agent.gravity * delta

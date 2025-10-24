class_name PlayerWalk extends State

func Physics_Update(_delta: float) -> void:
	var direction = Input.get_axis('LEFT', 'RIGHT')
	
	if !direction:
		Transitioned.emit(self, 'Idle')
	else:
		agent.sprite.flip_h = true if direction == -1 else false
	
	agent.sprite.play('run')
	if agent is CharacterBody2D:
		agent.velocity.x = direction * agent.speed
		
		
	if Input.is_action_pressed('UP'):
		Transitioned.emit(self, "Jump")

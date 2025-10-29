class_name State extends Resource

@warning_ignore("unused_signal")
signal Transitioned

var agent: PhysicsBody2D

@warning_ignore("unused_parameter")
func Enter(body: PhysicsBody2D, ...args) -> void:
	agent = body
	
	if agent and agent.sprite is AnimatedSprite2D:
		agent.sprite.play('default')

func Exit() -> void:
	if agent and agent.sprite is AnimatedSprite2D:
		agent.sprite.play('default')

@warning_ignore("unused_parameter")
func Update(delta: float) -> void:
	pass

@warning_ignore("unused_parameter")
func Physics_Update(delta: float) -> void:
	pass

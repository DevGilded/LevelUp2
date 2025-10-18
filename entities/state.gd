class_name State extends Resource

@warning_ignore("unused_signal")
signal Transitioned

var agent: PhysicsBody2D

func Enter(body: PhysicsBody2D) -> void:
	agent = body

func Exit() -> void:
	pass

@warning_ignore("unused_parameter")
func Update(delta: float) -> void:
	pass

@warning_ignore("unused_parameter")
func Physics_Update(delta: float) -> void:
	pass

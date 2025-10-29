class_name PlayerLand extends State

var timer: Timer

func Enter(body: PhysicsBody2D, ...args) -> void:
	super(body)
	
	timer = Timer.new()
	
	agent.add_child(timer)
	
	timer.wait_time = 0.15 if args.get(0).get(0).get('height') < 150 else 0.40
	timer.one_shot = true
	timer.timeout.connect(_on_recover)
	
	timer.start()

func _on_recover():
	agent.remove_child(timer)
	Transitioned.emit(self, 'Idle')

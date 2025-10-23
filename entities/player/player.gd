class_name Player extends CharacterBody2D

var speed = 65
var gravity = 320
var jump = 60

@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(_delta: float) -> void:
	move_and_slide()

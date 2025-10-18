class_name Player extends CharacterBody2D

var speed = 80
var gravity = 320
var jump = 60

func _physics_process(_delta: float) -> void:
	move_and_slide()

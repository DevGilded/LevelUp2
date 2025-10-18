class_name Player extends CharacterBody2D

var speed = 100
var gravity = 350
var jump = 60

func _physics_process(_delta: float) -> void:
	move_and_slide()

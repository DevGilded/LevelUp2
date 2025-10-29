class_name Player extends CharacterBody2D

var speed = 65
var gravity = 320
var jump = 75

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label

func _physics_process(_delta: float) -> void:
	move_and_slide()

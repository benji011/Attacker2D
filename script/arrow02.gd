
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_process_input(true)
	set_fixed_process(false)
	pass

var speed = 800

func _fixed_process(delta):
	#var arrow = load("res://scn/arrow.tscn").instance()

	#translate(Vector2(delta*speed, 0))

	pass

func _input(event):
	if Input.is_mouse_button_pressed(true):
		print("fire")
	pass

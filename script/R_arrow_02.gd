extends RigidBody2D

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	pass

var speed = 1000

# global variable we need to get a constant mouse coordinate value
var setMouseCoordinates = Vector2(0, 0)
var force = Vector2(0,0) # The force of movement

const MODE_DIRECT = 0

export(int, "Direct") var mode = MODE_DIRECT

func _process(delta):
	speed += delta*300
	# set_linear_velocity(Vector2(speed, 0))    # This code sets a even speed for all the arrow shots fired
	set_linear_velocity(_getMouseCoordinates())
	pass

func _fixed_process(delta):
	var mpos = get_viewport().get_mouse_pos()
	look_at(mpos)
	# set_linear_velocity(get_linear_velocity() + force) # Set its velocity
	# force = force.linear_interpolate(force, delta*4)

	pass

func _input(event):
	if Input.is_mouse_button_pressed(true):
		set_process(true)
		_setMouseCoordinates(get_viewport().get_mouse_pos())
		print("fire")
		_shootArrow()
	pass

func _shootArrow():
	set_linear_velocity(_getMouseCoordinates())
	pass

# set mouse coordinates
func _setMouseCoordinates(mouseCordVector):
	setMouseCoordinates = mouseCordVector
	pass

func _getMouseCoordinates():
  return setMouseCoordinates

func _on_Arrow02_body_enter( body ):
	body.queue_free()

	print("arrow hit")
	pass # replace with function body

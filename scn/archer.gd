# archer.gd
#
# Original author: Daniel Arathoon
# Modified by: Benjamin Lo
#
# Property of BAD Games Ltd
# (You cannot and will not use this code for profitable means as this will give us
# permission to own your house, your wife, your dog and your buriel plot)

extends Node2D

var arrow = preload("res://arrow.xml")   # load the arrow sprite
var isFireButtonPressed = false          # fire button flag (to counter multiple shots per FPS)
var arrowCount = 0                       # to keep track of lasers that have been fired/instantiated
var target_x = 0                         # x coordinate of mouse position along the x coordinates
var target_y = 0                         # y coordinate of mouse position along the y coordinates
var arrowArray = []                      # we need to store the arrows in an array so we can keep track of each instance individually.

# -------------------------------------------------------------------
# initialization. Always called first, once and only once.
# -------------------------------------------------------------------
func _ready():
  set_process(true)


# -------------------------------------------------------------------
# update method. Called every frame. Use with extreme caution or I will hurt you.
# -------------------------------------------------------------------
func _process(delta):
  if Input.is_mouse_button_pressed(true):
    if isFireButtonPressed == false:
      _fire()
      isFireButtonPressed = true
  else:
    isFireButtonPressed = false

  #fire the laser
  for arrow in arrowArray:
    var arrowPos = get_node(arrow).get_pos()
    arrowPos.x = arrowPos.x + 200 * delta
    get_node(arrow).set_pos(arrowPos)


# -------------------------------------------------------------------
# Read input controls based on events
# -------------------------------------------------------------------
func _fire():
  arrowCount = arrowCount + 1
  var mousePos = get_viewport().get_mouse_pos()
  var arrow_instance = arrow.instance()
  arrow_instance.set_name("arrow" +str(arrowCount))
  add_child(arrow_instance)
  print(mousePos.y)

  # finally, we set the target position for the arrow to be fired at.
  target_x = mousePos.x
  target_y = mousePos.y

  # assign each arrow an ID (important)
  var arrowPos = get_node("arrow" +str(arrowCount)).get_pos()

  get_node("arrow" +str(arrowCount)).set_pos(arrowPos)
  arrowArray.push_back("arrow" +str(arrowCount))
  print(arrowArray)






# end of file

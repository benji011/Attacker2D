
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	pass


export (PackedScene) var arrow

func _on_border01_body_enter( body ):
	create_arrow()
	pass # replace with function body
	
func create_arrow():
	print("creating arrow")
	var a = arrow.instance()
	a.add_to_group("arrows")
	get_node("Position2D").add_child(a)

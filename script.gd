extends Control

@onready var label = %"Label"
var mouse_count = 0;
var key_count = 0;
var time_until_update = 1;

func _input(event):
	if event is InputEventKey:
		key_count += 1
	elif event is InputEventMouseMotion:
		mouse_count += 1

func _process(delta):
	time_until_update -= delta
	if time_until_update > 0:
		return
	label.text = "Total Inputs: %s" % (mouse_count + key_count)
	label.text += "\nMouse Inputs: %s" % mouse_count
	label.text += "\nKey Inputs: %s" % key_count
	mouse_count = 0
	key_count = 0
	time_until_update = 1

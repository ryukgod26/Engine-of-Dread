extends Node3D

@export var on := false
@export var on_mat: StandardMaterial3D
@export var off_mat: StandardMaterial3D
@export var light_bulb: Node3D

func _ready() -> void:
	if on:
		light_bulb.get_node('light').material_override = on_mat
	else:
		light_bulb.get_node('light').material_override = off_mat
	light_bulb.get_node('OmniLight').visible = on

func toggle_light():
	print("Toggle Function is Called")
	on = not on
	if on:
		$on.visible = true
		$off.visible = false
		light_bulb.get_node('light').material_override = on_mat
	else:
		$on.visible = false
		$off.visible = true
		light_bulb.get_node('light').material_override = off_mat
	light_bulb.get_node('OmniLight').visible = on
	$AudioStreamPlayer3D.play()

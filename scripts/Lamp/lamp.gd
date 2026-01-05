extends Node3D

@export var on := false
@export var on_mat: StandardMaterial3D
@export var off_mat: StandardMaterial3D
@export var light_color: Color

func _ready() -> void:
	$OmniLight3D.light_color = light_color
	if on:
		$lamp_head.material_override = on_mat
	else:
		$lamp_head.material_override = off_mat
	$OmniLight3D.visible = on

func toggle_light():
	on = not on
	if on:
		$lamp_head.material_override = on_mat
	else:
		$lamp_head.material_override = off_mat
	$OmniLight3D.visible = on 

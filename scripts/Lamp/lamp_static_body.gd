extends StaticBody3D

@export var lamp: Node3D

func interact():
	lamp.toggle_light()

extends StaticBody3D

@export var door:Node3D

func interact():
	door.toggle_state()

extends StaticBody3D

@export var switch: Node3D

func interact():
	print("Interact Function is Called")
	switch.toggle_light()

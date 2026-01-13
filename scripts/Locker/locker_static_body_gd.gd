extends StaticBody3D

func _ready() -> void:
	Globals.locker = self

func interact():
	Globals.UI.open_safe_ui()

func open() -> void:
	$"../AnimationPlayer".play("open")

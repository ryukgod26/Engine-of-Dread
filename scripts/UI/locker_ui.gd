extends CanvasLayer

func _ready() -> void:
	visible = false

func try_password():
	pass


func _on_cancel_pressed() -> void:
	Globals.UI.exit_safe()

extends CanvasLayer

var password = "2626"

func _ready() -> void:
	visible = false

func try_password():
	if $Password.text == password:
		Globals.locker.open()
		Globals.UI.exit_safe()

func _on_cancel_pressed() -> void:
	Globals.UI.exit_safe()

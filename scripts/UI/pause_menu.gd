extends CanvasLayer

var paused = false

func _ready() -> void:
	visible = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause") and not $Options.visible:
		paused = not paused
		$AnimationPlayer.play("Open")
		if paused:
			visible = true
			get_tree().paused = true
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			get_tree().paused = false
			visible = false
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false

func _on_settings_pressed() -> void:
	$Options.visible = true

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit(0)

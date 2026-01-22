extends CanvasLayer


func _on_give_up_pressed() -> void:
	get_tree().quit(0)


func _on_try_again_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/loading_screens/game_loading_screen.tscn")

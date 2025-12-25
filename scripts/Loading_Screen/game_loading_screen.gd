extends LoadingScreen


func _ready() -> void:
	level = "res://scenes/levels/level.tscn"
	ResourceLoader.load_threaded_request(level)

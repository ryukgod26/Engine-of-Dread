extends CanvasLayer


@onready var timer: Timer = $Timer
@onready var label: Label = $Label2


func _process(_delta) -> void:
	var time_left = timer.time_left
	var minutes = floor(time_left / 60)
	var seconds = int(time_left) % 60
	label.text = "%02d:%02d" % [minutes, seconds]

func _on_timer_timeout():
	print("Game Over!")
	label.text = "00:00"
	get_tree().paused = true

func start_game_timer() -> void:
	$Timer.start()

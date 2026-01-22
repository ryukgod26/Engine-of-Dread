extends CanvasLayer


@onready var timer: Timer = $Timer
@onready var label: Label = $Label2
var label_origin

func _ready() -> void:
	visible = false
	label_origin = label.position

func _process(_delta) -> void:
	if not timer.is_stopped():
		var time_left = timer.time_left
		var minutes = floor(time_left / 60)
		var seconds = int(time_left) % 60
		label.text = "%02d:%02d" % [minutes, seconds]
		apply_horror_effects(time_left)

func _on_timer_timeout():
	print("Game Over!")
	label.text = "00:00"
	Globals.UI.game_lose()
	get_tree().paused = true

func start_game_timer() -> void:
	$Timer.start()

func apply_horror_effects(time_left):
	var pulse_speed = 5. if time_left < 10. else 2.
	var alpha = (sin(Time.get_ticks_msec() * 0.01 * pulse_speed) + 1.) / 2.
	
	label.modulate.a =clamp(alpha,.6,1.)
	var shake_intensity = 0.

	if time_left < 10:
		shake_intensity = 5.
		label.modulate = Color(1,0,0)
	
	elif time_left < 30:
		shake_intensity = 1.
		label.modulate = Color(1,0.5,0.5)
	
	if shake_intensity > 0:
		var offset_x = randf_range(-shake_intensity,shake_intensity)
		var offset_y = randf_range(-shake_intensity,shake_intensity)
		label.position = label_origin + Vector2(offset_x,offset_y)
	else:
		label.position = label_origin

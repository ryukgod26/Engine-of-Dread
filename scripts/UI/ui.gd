extends Control

@export var dot_radius := 1.
@export var dot_color := Color.WHITE

var safe_interacted = false

func _ready() -> void:
	Globals.UI = self
	$TaskUI.add_new_task("Ring the DoorBell")
	queue_redraw()
	
func add_new_task(task_text: String):
	$TaskUI.add_new_task(task_text)
	
var reticle_visible := false:
	set(new_val):
		reticle_visible = new_val
		queue_redraw()

func open_safe_ui():
	if not safe_interacted:
		safe_interacted = true
		$LockerUI.visible = true
		get_tree().paused = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func exit_safe():
	if safe_interacted:
		safe_interacted = false
		$LockerUI.visible = false
		get_tree().paused = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _draw() -> void:
	if reticle_visible:
		draw_circle($CanvasLayer/CenterContainer.position,dot_radius,dot_color,true)

func start_game_timer() -> void:
	$TimerUI.visible = true
	$TimerUI.start_game_timer()

func game_won() ->void:
	pass

func game_lsoe() -> void:
	pass

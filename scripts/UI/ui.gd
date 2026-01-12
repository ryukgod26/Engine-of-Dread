extends Control

@export var dot_radius := 1.
@export var dot_color := Color.WHITE

func _ready() -> void:
	$TaskUI.add_new_task("Ring the DoorBell")
	queue_redraw()

var reticle_visible := false:
	set(new_val):
		reticle_visible = new_val
		queue_redraw()


func _draw() -> void:
	if reticle_visible:
		draw_circle($CanvasLayer/CenterContainer.position,dot_radius,dot_color,true)

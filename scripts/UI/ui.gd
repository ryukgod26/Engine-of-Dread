extends Control

@export var dot_radius := 1.
@export var dot_color := Color.WHITE

var reticle_visible := false:
	set(new_val):
		reticle_visible = new_val
		queue_redraw()

func _ready() -> void:
	queue_redraw()

func _draw() -> void:
	if reticle_visible:
		draw_circle($CanvasLayer/CenterContainer.position,dot_radius,dot_color,true)

extends Control

@export var dot_radius := 1.
@export var dot_color := Color.WHITE

func _ready() -> void:
	queue_redraw()

func _draw() -> void:
	draw_circle($CanvasLayer/CenterContainer.position,dot_radius,dot_color,true)

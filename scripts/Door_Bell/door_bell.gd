extends Node3D

@export var door: Node3D
var times_rung := 0

func _ready() -> void:
	door.locked = true

func interact():
	if $AnimationPlayer.current_animation != "press" and times_rung < 3:
		times_rung += 1
		$AnimationPlayer.play("press")
		$AudioStreamPlayer3D.play()
		if times_rung > 2 :
			door.locked = false
			await get_tree().create_timer(3).timeout
			Globals.UI.add_new_task("Enter The House")

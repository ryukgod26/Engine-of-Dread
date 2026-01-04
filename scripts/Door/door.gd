extends Node3D

var opened := false

func  toggle_state():
	if $AnimationPlayer.current_animation != "open" and $AnimationPlayer.current_animation != "close":
		opened = !opened
		if !opened:
			$AnimationPlayer.play("close")
		else:
			$AnimationPlayer.play("open")

extends Node3D

var opened := false

func  interact():
	if $AnimationPlayer.current_animation != "open":
		opened = !opened
		if !opened:
			$AnimationPlayer.play_backwards("open")
		else:
			$AnimationPlayer.play("open")

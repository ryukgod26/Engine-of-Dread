extends Node3D

var opened := false
var locked = false

func  interact():
	if $AnimationPlayer.current_animation != "open" and not locked:
		opened = !opened
		if !opened:
			$AnimationPlayer.play_backwards("open")
		else:
			$AnimationPlayer.play("open")

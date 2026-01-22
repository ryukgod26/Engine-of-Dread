extends Node3D

var dialogue_resource: DialogueResource  =  preload("res://Dialogues/door_locked.dialogue")

var opened := false
var locked = false

func interact():
	if $AnimationPlayer.current_animation != "open" and not locked:
		opened = !opened
		if !opened:
			$AnimationPlayer.play_backwards("open")
		else:
			$AnimationPlayer.play("open")
			if get_parent().has_node("/$AudioStreamPlayer3D/"):
				$AudioStreamPlayer3D.play()
	elif locked:
		DialogueManager.show_dialogue_balloon(dialogue_resource,"start")

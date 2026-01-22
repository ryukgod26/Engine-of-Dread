extends Node3D

var no_escape_dialogue: DialogueResource  =  preload("res://Dialogues/no_escape.dialogue")


func _on_dialogue_activator_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		DialogueManager.show_dialogue_balloon(no_escape_dialogue,"start")

extends Area3D

@export var task_text: String
var triggered := false
var house_entered: DialogueResource = preload("res://Dialogues/house_enter.dialogue")

func enter_triiger(body: Node3D) -> void:
	if body.is_in_group("Player") and not triggered:
		triggered = true
		Globals.UI.add_new_task(task_text)
		DialogueManager.show_dialogue_balloon(house_entered,"start")

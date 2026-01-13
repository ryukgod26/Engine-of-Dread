extends Area3D

@export var task_text: String
var  triggered := false


func enter_triiger(body: Node3D) -> void:
	if body.is_in_group("Player"):
		triggered = true
		Globals.TaskUI.add_new_task(task_text)

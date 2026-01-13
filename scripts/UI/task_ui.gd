extends CanvasLayer

@onready var task_container: VBoxContainer = $TaskContainer


func add_new_task(task_text: String):
	#var new_task:RichTextLabel = RichTextLabel.new()
	#new_task.text = task_text
	#task_container.add_child(new_task)
	$TaskContainer/TaskText.text = task_text

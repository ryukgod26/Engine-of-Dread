extends Path2D

@export var speed:float = 500.
@onready var path_follow: PathFollow2D = $PathFollow2D

func _process(delta: float) -> void:
	path_follow.progress += speed * delta

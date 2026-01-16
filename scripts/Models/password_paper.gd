extends RigidBody3D

@export var positions: Array[Node3D]
@onready var rng = RandomNumberGenerator.new()

func _ready() -> void:
	var chance = rng.randi_range(0, positions.size() - 1)
	global_position = positions[chance].global_position
	visible = false

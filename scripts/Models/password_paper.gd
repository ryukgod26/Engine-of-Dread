extends RigidBody3D

@export var positions: Array[Node3D]
@onready var rng = RandomNumberGenerator.new()

var target_spawn_position: Vector3
var should_teleport = false

func _ready() -> void:
	if positions.size() > 0:
		var chance = rng.randi_range(0, positions.size() - 1)
		print(chance)
		target_spawn_position = positions[chance].global_position
		should_teleport = true
		visible = false 

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	if should_teleport:
		var t = state.transform
		t.origin = target_spawn_position
		state.transform = t
		
		state.linear_velocity = Vector3.ZERO
		state.angular_velocity = Vector3.ZERO
		
		should_teleport = false
		print("Teleported to: ", state.transform.origin)

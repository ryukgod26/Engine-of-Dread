extends RayCast3D

func _physics_process(delta: float) -> void:
	if is_colliding():
		var collider = get_collider()
		if collider.name == "door":
			if Input.is_action_just_pressed("interact"):
				collider.get_parent().get_parent().get_parent().toggle_state()

extends RayCast3D

func _physics_process(delta: float) -> void:
	if is_colliding():
		var collider = get_collider()
		if collider.is_in_group("interectable") and collider.has_method('interact'):
			if Input.is_action_just_pressed("interact"):
				collider.interact()

extends RayCast3D

@onready var ui: Control = $"../../UI"

func _physics_process(_delta: float) -> void:
	if is_colliding():
		var collider = get_collider()
		if collider.is_in_group("interectable") and collider.has_method('interact'):
			ui.reticle_visible = true
			if Input.is_action_just_pressed("interact"):
				collider.interact()
			
	else:
			ui.reticle_visible = false

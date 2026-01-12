extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var spot_light: SpotLight3D = $head/SpotLight3D
var crouching := false

func _ready() -> void:
	$head/SpotLight3D.visible = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("crouch"):
		crouching = not crouching

func _physics_process(delta: float) -> void:
	if crouching and $CollisionShape3D.shape.height > 0.25:
		var crouch_height = lerp($CollisionShape3D.shape.height, 0.25, 0.2)
		$CollisionShape3D.shape.height = crouch_height
	if not crouching and $CollisionShape3D.shape.height < 2.:
		var crouch_height = lerp($CollisionShape3D.shape.height, 2.0, 0.2)
		$CollisionShape3D.shape.height = crouch_height
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	 
	if Input.is_action_just_pressed("light"):
		spot_light.visible = !spot_light.visible
	var input_dir := Input.get_vector("move_left","move_right","move_forward","move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()

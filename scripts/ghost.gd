extends CharacterBody3D


const SPEED = 3.0
const JUMP_VELOCITY = 4.5
@onready var player: CharacterBody3D = $"../player"


func _physics_process(_delta: float) -> void:
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * SPEED
		move_and_slide()


func _on_kill_area_body_entered(body: Node3D) -> void:
	if body == player:
		get_tree().reload_current_scene()

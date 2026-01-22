extends MultiplayerSpawner

var player_scene := preload("res://scenes/player/player.tscn")
@export var network_player: PackedScene

func _ready() -> void:
	multiplayer.peer_connected.connect(spawn_player)
	
func spawn_player(id: int) -> void:
	if not multiplayer.is_server(): return
	var player = player_scene.instantiate()
	player.name = str(id)
	get_node(spawn_path).call_deferred("add_child",player)

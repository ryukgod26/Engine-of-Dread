extends Node

const IP_ADDRESS: String = "localhost"
const PORT := 42301

var peer: ENetMultiplayerPeer

func start_server() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT,5)

func start_client() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS,PORT)
	multiplayer.multiplayer_peer = peer

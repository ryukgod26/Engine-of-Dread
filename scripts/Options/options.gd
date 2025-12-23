extends Control

@onready var master_volume: HSlider = $TabContainer/Audio/MasterVolume
@onready var music_volume: HSlider = $TabContainer/Audio/MusicVolume
@onready var sfx_volume: HSlider = $TabContainer/Audio/SFXVolume

var master_bus_idx: int
var music_bus_idx: int
var sfx_bus_idx: int

var volume

func _ready() -> void:
	master_bus_idx = AudioServer.get_bus_index("Master")
	music_bus_idx = AudioServer.get_bus_index("Music")
	sfx_bus_idx = AudioServer.get_bus_index("SFX")
	
	master_volume.value = db_to_linear(AudioServer.get_bus_volume_db(master_bus_idx))
	music_volume.value = db_to_linear(AudioServer.get_bus_volume_db(music_bus_idx))
	sfx_volume.value = db_to_linear(AudioServer.get_bus_volume_db(sfx_bus_idx))
	
	match DisplayServer.window_get_mode():
		
		DisplayServer.WINDOW_MODE_FULLSCREEN:
			$TabContainer/Video/WindowType.selected = 0
		
		DisplayServer.WINDOW_MODE_WINDOWED:
			$TabContainer/Video/WindowType.selected = 1
		
		_:
			$TabContainer/Video/WindowType.selected = -1
			
	
	match DisplayServer.window_get_size():
		
		Vector2i(1600,900):
			$TabContainer/Video/Resolution.selected = 0
		
		Vector2i(1080,720):
			$TabContainer/Video/Resolution.selected = 1
		
		Vector2i(1980,720):
			$TabContainer/Video/Resolution.selected = 2
		_:
			$TabContainer/Video/Resolution.selected = -1

##Video Controls
func _on_resolution_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1600,900))
		1:
			DisplayServer.window_set_size(Vector2i(1080,720))
		2:
			DisplayServer.window_set_size(Vector2i(1920,1080))

func _on_window_type_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

##Audio Controls
func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus_idx,linear_to_db(value))
	master_volume.value = value

func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus_idx,linear_to_db(value))
	music_volume.value = value

func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus_idx,linear_to_db(value))

func _on_mute_btn_toggled(toggled_on: bool) -> void:
	if toggled_on:
		volume = master_volume.value
		master_volume.value = 0
	else:
		master_volume.value = volume
##Controls Settings
func _on_fov_value_changed(value: float) -> void:
	Globals.fov = value

func _on_senstivity_value_changed(value: float) -> void:
	Globals.mouse_sensitivity = value

func _on_invert_y_axis_toggled(toggled_on: bool) -> void:
	Globals.invert_y_axis = toggled_on

#back Button
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

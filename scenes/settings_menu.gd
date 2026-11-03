extends Control

signal closed
@onready var master_volume_h_slider: HSlider = $MarginContainer/VBoxContainer/HBoxContainer/MasterVolumeHSlider
@onready var bgm_h_slider: HSlider = $MarginContainer/VBoxContainer/HBoxContainer2/BGMHSlider
@onready var sfx_h_slider: HSlider = $MarginContainer/VBoxContainer/HBoxContainer3/SFXHSlider
@onready var debug_button: Button = $MarginContainer/VBoxContainer/DebugButton
@onready var first_control: Control = $MarginContainer/VBoxContainer/HBoxContainer/MasterVolumeHSlider

func _ready() -> void:
	refresh_master_volume()
	refresh_bgm_volume()
	refresh_sfx_volume()
	refresh_debug_button()
	Navigation.control_grab_focus(first_control)

func _on_master_volume_h_slider_value_changed(value: float) -> void:
	MasterVolume.set_volume(value)

func _on_bgmh_slider_value_changed(value: float) -> void:
	Bgm.set_volume(value)

func _on_sfxh_slider_value_changed(value: float) -> void:
	Sfx.set_volume(value)

func _on_debug_button_pressed() -> void:
	Debug.toggle_debug_on()
	refresh_debug_button()

func _on_close_button_pressed() -> void:
	closed.emit()

func refresh_master_volume() -> void:
	master_volume_h_slider.value = MasterVolume.volume

func refresh_bgm_volume() -> void:
	bgm_h_slider.value = Bgm.volume

func refresh_sfx_volume() -> void:
	sfx_h_slider.value = Sfx.volume

func refresh_debug_button() -> void:
	if Debug.is_debug_on():
		debug_button.text = "Debug: On"
	else:
		debug_button.text = "Debug: Off"

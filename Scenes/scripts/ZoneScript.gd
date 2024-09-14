extends Node2D

signal zone_selected

var dispatch_button: Button

func set_dispatch_button(button: Button):
	dispatch_button = button
	dispatch_button.disabled = true

func _ready():
	$TextureButton.connect("toggled", Callable(self, "_on_texture_button_toggled"))


func _on_texture_button_toggled(toggled_on: bool):
	if dispatch_button != null:
		dispatch_button.disabled = not toggled_on

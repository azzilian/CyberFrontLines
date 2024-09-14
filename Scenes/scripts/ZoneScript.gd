extends Node2D

#Declaire signal
signal zone_selected  

func _ready():
	var texture_button = $TextureButton
	if texture_button:
		texture_button.connect("toggled", Callable(self, "_on_zone_toggled"))

func _on_zone_toggled(toggled_on: bool):
	if toggled_on:
#		Emit signal
		print("Zone selected: ", self.name)  
		emit_signal("zone_selected", self)  


func _on_texture_button_pressed():
	print("Zone selected: ", self.name)  
	emit_signal("zone_selected", self)   # Replace with function body.

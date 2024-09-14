extends Node2D

#Declaire signal
signal zone_selected  

var texture_button: TextureButton

func _ready():
	texture_button = $TextureButton
	if texture_button:
		texture_button.connect("pressed", Callable(self, "_on_texture_button_pressed"))

func _on_texture_button_pressed():
	if texture_button.pressed:
		print("Zone selected: ", self.name)
		emit_signal("zone_selected", self)
		self.set("is_active", true)  # 

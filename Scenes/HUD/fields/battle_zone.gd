extends Node2D

var dispatch_button: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	dispatch_button = $DispatchButton
	for zone in get_children():
		if zone.has_method("set_dispatch_button"):
			zone.set_dispatch_button(dispatch_button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_radio_zone_zone_selected():
	$DispatchButton.disabled = false

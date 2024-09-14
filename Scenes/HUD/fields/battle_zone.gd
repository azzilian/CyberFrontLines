extends Node2D

#Unit and zones
var zones = []
var units = []
var selected_zone = null
var current_unit = 0

#Buttons
var dispatch_button: Button
var reset_button: Button
var end_turn_button: Button

func _ready():
	# Find all zones
	zones.append($RadioZone)
	zones.append($AssemblyZone)
	zones.append($MicroControlerZone)
	
	#Find all units
	units.append($Recon)
	units.append($Defender)
	units.append($Assault)
	
#	Find all buttons
	dispatch_button = $DispatchButton
	reset_button = $ResetButton
	end_turn_button = $EndTurnButton
	
#	Disable all buttons
	reset_button.disabled = true
	end_turn_button.disabled = true
	dispatch_button.disabled = true
	
#	Connect signals to zones
	for zone in zones:
		zone.connect("zone_selected", Callable(self, "_on_zone_selected"))
		
#	Signal from $DispatchButton
	dispatch_button.connect("pressed", Callable(self,"_on_dispatch_button_pressed"))
	reset_button.connect("pressed", Callable(self, "_on_reset_button_pressed"))
	
#Enable $DispatchButton afte zone selected
func _on_zone_selected(selected):
	selected_zone = selected
	print("Selected zone: ", selected_zone.name)
	if selected_zone != null:
		dispatch_button.disabled = false
		print("DispatchButton activated")

func _on_dispatch_button_pressed():
#	Send unit
	if selected_zone != null and current_unit < units.size():
		var unit = units[current_unit]
		unit.position = selected_zone.position
#	DisableZone for other units
	#selected_zone.disabled = true - crash because of Node2D
	for child in selected_zone.get_children():
		if child is CollisionShape2D:
			child.disabled = true
	selected_zone = null
	
#	$DispatchButton disable
	dispatch_button.disabled = true
	
#	Next unit
	current_unit += 1
	
#	Check no units left
	if current_unit >= units.size():
		reset_button.disabled = false
		end_turn_button.disabled = false

func _on_reset_button_pressed():
#	Return Units
	for unit in units:
		unit.position = Vector2(0,0)
#	Activate zones
	for zone in zones:
		zone.disable = false
#	Reset conditions
	selected_zone = null
	current_unit = 0
	dispatch_button.disabled = true
	dispatch_button.disabled = true
	dispatch_button.disabled = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_micro_controler_zone_zone_selected():
	pass # Replace with function body.


func _on_assembly_zone_zone_selected():
	pass # Replace with function body.

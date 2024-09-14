extends Node2D

var speed = 400
var angular_speed = PI

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.
	position += velocity


func _on_button_pressed():
	set_process(not is_processing())


func _on_timer_timeout():
	visible = not visible

extends RigidBody2D

var tracking = false
var startPos = Vector2()
const FORCE = 10

func _input(evt):
	if( evt is InputEventMouseButton and evt.button_index == MOUSE_BUTTON_LEFT):
		if(evt.is_pressed()):
			tracking = true
			startPos = evt.position
		else:
			tracking = false
			
			var kickDir = startPos - evt.position
			gravity_scale = 1
			linear_velocity = kickDir * FORCE
			

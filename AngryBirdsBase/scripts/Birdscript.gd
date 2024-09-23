extends RigidBody2D

var tracking = false
var startPos = Vector2()
const FORCE = 10
var flingable = true

func _input(evt):
	if(evt is InputEventMouseButton and evt.button_index == MOUSE_BUTTON_LEFT and flingable):
		if(evt.is_pressed()):
			tracking = true
			startPos = evt.position
		else:
			change_parent(self, $"..", $"../../DeadFish")
			$DespawnTimer.start()
			tracking = false
			flingable = false
			
			var kickDir = startPos - evt.position
			gravity_scale = 1
			linear_velocity = kickDir * FORCE
			

func _on_despawn_timer_timeout():
	queue_free()

func change_parent(child: Node, old_parent: Node, new_parent: Node):
	old_parent.remove_child(child)
	new_parent.add_child(child)

extends RigidBody2D

var tracking = false
var flingable = true
var startPos = Vector2()
const FORCE = 10

func _input(evt):
	if(evt is InputEventMouseButton and evt.button_index == MOUSE_BUTTON_LEFT and flingable):
		if(evt.is_pressed()):
			tracking = true
			startPos = evt.position
			$AnimatedSprite2D.play("fly")
			$PullBackSound.play()
		else:
			$DespawnTimer.start()
			$SpawnTimer.start()
			$AnimatedSprite2D.play("noFly")
			$ReleaseSound.play()
			tracking = false
			flingable = false
			
			var kickDir = startPos - evt.position
			gravity_scale = 1
			linear_velocity = kickDir * FORCE

func _on_despawn_timer_timeout():
	queue_free()

func _on_spawn_timer_timeout():
	$"../../UI".spawn_fish()

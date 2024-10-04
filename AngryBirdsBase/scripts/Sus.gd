extends RigidBody2D

@export var particle_resource: Resource

func _on_body_entered(_body):
	
	# pop bird
	$HitSound.play()
	var particle_effect = particle_resource.instantiate()
	particle_effect.position = position
	particle_effect.emitting = true
	get_parent().add_child(particle_effect)
	
	# update score
	get_parent().get_parent().get_node("UI").call_deferred("add_score")
	
	# remove enemy
	set_deferred("visible", false)
	$CollisionShape2D.set_deferred("disabled", true)
	$KillTimer.start()

func _on_kill_timer_timeout() -> void:
	queue_free()

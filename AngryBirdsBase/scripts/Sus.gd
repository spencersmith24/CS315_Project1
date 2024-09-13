extends RigidBody2D

@export var particle_resource: Resource

func _on_body_entered(body):
	
	# pop bird
	var particle_effect = particle_resource.instantiate()
	particle_effect.position = position
	particle_effect.emitting = true
	get_parent().add_child(particle_effect)
	
	# update score
	get_parent().get_parent().get_node("UI").add_score()
	
	# remove enemy
	queue_free()

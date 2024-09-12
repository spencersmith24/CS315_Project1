extends RigidBody2D

@export var particle_resource: Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	#TODO:
	#create a particle effect at this object's location
	var particle_effect = particle_resource.instantiate()
	particle_effect.position = position
	particle_effect.emitting = true
	get_parent().add_child(particle_effect)

	#find the game UI script and send it a message that the score has increased
	
	#and then destroy this object using queue_free
	queue_free()
	pass # Replace with function body.


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#print("OK")
	pass # Replace with function body.

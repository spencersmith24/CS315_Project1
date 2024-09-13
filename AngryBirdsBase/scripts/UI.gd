extends Control

@export var fish_resource: Resource
var score = 0
var num_enemies

func add_score():
	
	score += 1
	$Label.text = str(score)
	
	#if score is at max - return to main page
	if (score == num_enemies):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	#else:
	##if not at max - spawn a new fish
		#var fish = fish_resource.instantiate()
		#add_child(fish)
	pass


#TODO: Add button to return to menu


# Called when the node enters the scene tree for the first time.
func _ready():
	num_enemies = get_parent().find_child("Enemies").get_child_count()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Control

@export var fish_resource: Resource
var score = 0
var maxScore = 1

func add_score():
	
	score += 1
	$Label.text = str(score)
	
	#if score is at max - return to main page
	#TODO: figure out how to check the number of enemies
	# currently in the game... set that to maxscore
	if (score == maxScore):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	else:
	#if not at max - spawn a new fish
		var fish = fish_resource.instantiate()
		add_child(fish)
	pass


#TODO: Add button to return to menu


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

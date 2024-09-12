extends Control

@export var fish_resource: Resource
var score = 0

func add_score():
	score += 1
	$Label.text = str(score)
	#if score is at max - return to main page
	#if not at max - spawn a new fish
	pass


#TODO: Add button to return to menu


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

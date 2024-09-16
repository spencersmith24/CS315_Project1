extends Control

@export var fish_resource: Resource
var score = 0
var num_enemies
@onready var fish_node = $"../Fishies"

func add_score():
	
	score += 1
	$Label.text = str(score)
	
	#if score is at max - return to main page
	if (score == num_enemies):
		$menuBtn.visible = true
		$menuBtn.disabled = false
	else:
	#if not at max - spawn a new fish
	
	#TODO: if you miss, spawn a new fish
		if (fish_node.get_child_count() <= 1):
			var fish = fish_resource.instantiate()
			fish_node.add_child(fish)
	pass


func _ready():
	num_enemies = get_parent().find_child("Enemies").get_child_count()


func _on_menu_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

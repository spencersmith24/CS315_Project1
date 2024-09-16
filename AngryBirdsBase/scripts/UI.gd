extends Control

@export var fish_resource: Resource

@onready var fish_node = $"../Fishies"
@onready var current_level = get_tree().get_current_scene().name

var score = 0
var num_enemies

func add_score():
	
	score += 1
	$Label.text = str(score)
	
	#if score is at max - show two buttons: menu and lvl2
	if (score == num_enemies):
		$menuBtn.visible = true
		$menuBtn.disabled = false
		print(current_level)
		
		if(current_level == "level1"):
			$lvl2Btn.visible = true
			$lvl2Btn.disabled = false
		elif(current_level == "level2"):
			$lvl3Btn.visible = true
			$lvl3Btn.disabled = false
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


func _on_lvl_2_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")


func _on_lvl_3_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/level3.tscn")

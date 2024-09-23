extends Control

@export var fish_resource: Resource

@onready var fish_node = $"../DeadFish"
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
		
		# display next level buttons depending on what level is currently on
		if(current_level == "level1"):
			$lvl2Btn.visible = true
			$lvl2Btn.disabled = false
		elif(current_level == "level2"):
			$lvl3Btn.visible = true
			$lvl3Btn.disabled = false
	else:
		spawn_fish()

func spawn_fish():
	if (fish_node.get_child_count() <= 1):
		var fish = fish_resource.instantiate()
		fish.position = Vector2(220, 220)
		fish_node.add_child(fish)

func _ready():
	num_enemies = get_parent().find_child("Enemies").get_child_count()

# go to the menu
func _on_menu_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

# go to level 2
func _on_lvl_2_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")

# go to level 3
func _on_lvl_3_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/level3.tscn")

# delete and respawn fish if hits right border
func _on_r_border_body_entered(body: Node2D) -> void:
	if(body == fish_node.get_child(0)):
		body.queue_free()
		spawn_fish()

# delete and respawn fish if hits left border
func _on_l_border_body_entered(body: Node2D) -> void:
	if(body == fish_node.get_child(0)):
		body.queue_free()
		spawn_fish()

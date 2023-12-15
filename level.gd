extends Node3D

@export var level_number = 0
@export_file("*.tscn") var scene_name = "LEVEL NOT SET"
var counter = 0
const MAX_HOLD = 1.5
@onready var text_label_level = $UI/CenterContainer/BoxContainer/Label
@onready var held_progress_bar = $UI/CenterContainer/BoxContainer/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	text_label_level.text = "Level " + str(level_number)
	held_progress_bar.max_value = MAX_HOLD
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("hold_to_skip"):
		_action_held(delta)
	if Input.is_action_just_released("hold_to_skip"):
		counter = 0
		held_progress_bar.value = counter
	pass


func _action_held(delta):
	counter = counter + delta
	print(counter)
	
	
	if(counter >= MAX_HOLD):
		counter = MAX_HOLD
		print(MAX_HOLD)
		get_tree().change_scene_to_file(scene_name)
	
	held_progress_bar.value = counter
	pass

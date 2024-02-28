extends Node2D
class_name Checkpoint

@export var spawn_point = false

var activated = false

func _ready():
	if spawn_point:
		activate()

func activate():
	GameManager.current_checkpoint = self
	activated = true
	$flag.play("default")

func _on_area_2d_area_entered(area):
	if area.get_parent() is main_character && !activated :
		activate()

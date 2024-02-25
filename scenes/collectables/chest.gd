extends Area2D

@onready var game_manager = %gameManager
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var target_level : PackedScene

func _on_body_entered(body):
	if (body.name == "CharacterBody2D" && game_manager.key > 0):
		animated_sprite_2d.play("unlocked")
		game_manager.remove_key(1)
		get_tree().change_scene_to_packed(target_level)

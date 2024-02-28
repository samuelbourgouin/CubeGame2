extends Area2D

#exported variable to input the path of the next scene 
#change it in the chess of the scene you want to change from
#just drag scene.tscn into export var in the place you want to change scene from
@export var target_level : PackedScene

@onready var game_manager = %gameManager
@onready var animated_sprite_2d = $AnimatedSprite2D

func _on_body_entered(body):
	if (body.name == "main_character" && game_manager.key > 0):
		animated_sprite_2d.play("unlocked")
		game_manager.remove_key(1)
		await get_tree().create_timer(2).timeout
		call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_packed(target_level)

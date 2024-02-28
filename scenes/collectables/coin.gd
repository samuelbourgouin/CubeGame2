extends Area2D

@onready var game_manager = %gameManager
@onready var animated_sprite_2d = $AnimatedSprite2D

func _on_body_entered(body):
	if (body.name == "main_character"):
		game_manager.add_coin()
		animated_sprite_2d.play("effect")

func _on_animated_sprite_2d_animation_finished():
	queue_free()

extends Area2D

@onready var game_manager = %gameManager
@onready var animated_sprite_2d = $AnimatedSprite2D

func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		queue_free()
		game_manager.add_coin()
		animated_sprite_2d.animation = "effect"

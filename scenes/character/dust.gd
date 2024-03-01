extends AnimatedSprite2D

func play_animation(animation_name: String):
	animation = animation_name
	play(animation_name)

func _on_animation_finished():
	queue_free()

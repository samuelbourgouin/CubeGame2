extends Sprite2D


var speed = 50  # Adjust the speed as needed

func _process(delta):
	# Move the cloud to the left
	position.x -= speed * delta

	# Check if the cloud is off-screen
	if position.x < get_viewport_rect().position.x - (texture.get_size().x * 2) :
		# Reset the cloud's position to the right of the screen
		position.x = get_viewport_rect().size.x + 2 + texture.get_size().x
		print(get_viewport_rect().position.x - texture.get_size().x)
		print(texture.get_size().x)

extends Sprite2D

var speed = 60  # Adjust the speed as needed

func _process(delta):
	# Move the cloud to the left
	position.x -= speed * delta
	var camera_node = get_tree().current_scene.get_node_or_null("main_character/Camera2D")
	# Check if the cloud is off-screen
	if camera_node:
		var camera_position = camera_node.global_position
		
		if position.x < (camera_position.x - get_viewport_rect().size.x * 1.2 - (texture.get_size().x * 2)) :
			# Reset the cloud's position to the right of the screen
			position.x = camera_position.x + get_viewport_rect().size.x + texture.get_size().x
		
	else: if position.x < get_viewport_rect().position.x - (texture.get_size().x * 2) :
		# Reset the cloud's position to the right of the screen
		position.x = get_viewport_rect().size.x + 2 + texture.get_size().x

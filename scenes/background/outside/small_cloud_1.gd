extends Sprite2D


var speed = 25  # Adjust the speed as needed

func _process(delta):
	# Move the cloud to the left
	position.x -= speed * delta
	var camera_node = get_tree().current_scene.get_node_or_null("CharacterBody2D/Camera2D")
	# Check if the cloud is off-screen
	if camera_node:
		var camera_position = camera_node.global_position
		
		if position.x < (camera_position.x - get_viewport_rect().size.x * 1.2 - (texture.get_size().x * 2)) :
			# Reset the cloud's position to the right of the screen
			position.x = camera_position.x + get_viewport_rect().size.x + texture.get_size().x
			print(camera_position.x - get_viewport_rect().size.x * 1.1 - (texture.get_size().x * 2))
			print(camera_position.x - get_viewport_rect().size.x - (texture.get_size().x * 2))
	else:
		print("camera_node not found")

extends Node2D

func _on_area_2d_area_entered(area):
	if area.get_parent() is main_character:
		area.get_parent().die()

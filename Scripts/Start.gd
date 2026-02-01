extends Control




func _on_quit_button_pressed():
	get_tree().quit()


func _on_rope_test_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/RopeTest.tscn")


func _on_bunnings_door_hit() -> void:
	get_tree().change_scene_to_file("res://Scenes/pick_tape_wall.tscn")

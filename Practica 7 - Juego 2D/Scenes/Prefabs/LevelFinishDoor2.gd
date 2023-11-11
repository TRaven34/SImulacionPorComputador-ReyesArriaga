extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		SoundsEffects.Door.play()
		get_tree().call_group("Player", "death_tween") # death_tween is called here just to give the feeling of player entering the door.
		get_tree().change_scene_to_file("res://Scenes/Levels/Level_03.tscn")

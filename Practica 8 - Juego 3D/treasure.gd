extends Area3D

signal taked
var counter = 0

func _on_body_entered(body):
	if body.is_in_group("player"):
		counter += 1
		if counter <= 3:
			$Coins.play()
			taked.emit()
			GameEngine.add_treasure()
		else:
			queue_free()

extends Label
var cooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_level_timer_timeout():
	GameEngine.add_time()
	text = "Time: " + str(GameEngine.time)
	if GameEngine.time % 10 == 0:
		GameEngine.on_speed()
		print("Velocidad")
		cooldown = GameEngine.time + 5
		print(cooldown)
	
	if cooldown == GameEngine.time:
		print("off speed")
		GameEngine.off_speed()
	
	if GameEngine.time == 25:
		get_tree().change_scene_to_file("res://Level2.tscn")
		

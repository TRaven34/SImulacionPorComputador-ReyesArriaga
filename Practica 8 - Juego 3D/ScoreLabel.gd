extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Score: " + str(GameEngine.score)

func _on_mob_squashed():
	GameEngine.add_score()
	
	
func _on_treasure_taked():
	GameEngine.add_treasure()

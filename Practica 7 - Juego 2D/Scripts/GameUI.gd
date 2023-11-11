extends Control

@onready var score_texture = %Score/ScoreTexture
@onready var score_label = %Score/ScoreLabel
@onready var Contador = %Time/TimeLabel

func _process(_delta):
	# Set the score label text to the score variable in game maanger script
	score_label.text = "x %d" % GameManager.score
	Contador.text = "Tiempo: %d" % GameManager.time
	


func _on_timer_timeout():
	GameManager.add_time()

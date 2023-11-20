extends Node

var score = 0
var time = 0
var speedup = false
var timestop = false

func add_score():
	score += 1

func add_time():
	time += 1

func on_speed():
	speedup = true
func off_speed():
	speedup = false

func add_treasure():
	score = score + 10
#	SoundsEffect.playcoins()

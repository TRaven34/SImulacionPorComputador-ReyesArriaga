extends Control

@onready var Record = $Record
@onready var Tiempo = $Tiempo

func _ready():
	Record.text = "Monedas Obtenidas: " + str(GameManager.score)
	Tiempo.text = "Tiempo: " + str(GameManager.time)

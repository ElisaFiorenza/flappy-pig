extends Node2D
@onready var points = $Camera2D/points
@onready var punteggiofinale = $punteggiofinale

func _ready():
	punteggiofinale.text += str(Globals.punteggio)

func _on_riprova_pressed():
	get_tree().change_scene_to_file("res://mainscene/node_2d.tscn")

func _on_esci_pressed():
	get_tree().quit()

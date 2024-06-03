extends Node2D
@onready var musica_menu = $MusicaMenu

func _ready():
	musica_menu.play()

func _on_gioca_pressed():
	get_tree().change_scene_to_file("res://mainscene/node_2d.tscn")


func _on_esci_pressed():
	get_tree().quit()

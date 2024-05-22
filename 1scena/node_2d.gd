extends Node2D
@onready var pig = $Pig
const KEBABBONI = preload("res://kebabboni.tscn")
var kebap_position = 10
func _ready():
	while true:
		var new_kebap = KEBABBONI.instantiate()
		add_child(new_kebap)
		new_kebap.position.x = kebap_position
		new_kebap.position.y = randf_range(0,200)
		print(kebap_position)
		kebap_position += 360
		await get_tree().create_timer(2.0).timeout
		


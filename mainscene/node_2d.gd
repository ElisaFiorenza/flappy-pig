extends Node2D
@onready var pig = $Pig
const KEBABBONI = preload("res://kebabboni.tscn")
var kebap_position = 10
var arraykebap = [0,0]
var i
func _ready():
	var first_kebap = KEBABBONI.instantiate()
	arraykebap[0] = first_kebap;
	await get_tree().create_timer(2.0).timeout
	first_kebap.position.x = kebap_position
	first_kebap.position.y = randf_range(-100,100)
	kebap_position += 360
	while true:
		var new_kebap = KEBABBONI.instantiate()
		add_child(new_kebap)
		new_kebap.position.x = kebap_position
		new_kebap.position.y = randf_range(-100,100)
		kebap_position += 360
		var last_kebap = arraykebap[1]
		arraykebap[1] = first_kebap
		arraykebap[0] = new_kebap
		first_kebap = new_kebap
		if kebap_position > 1080: 
			last_kebap.queue_free() 
		await get_tree().create_timer(4.2).timeout
		


extends Node2D
@onready var pig = $Pig
@onready var parallax_background = $ParallaxBackground


const FLAMES = preload("res://kebabboni.tscn")
var scroll_speed = Vector2(0, 10) # Velocità di scorrimento (X, Y)
var flame_position = 10
var arrayflame = [0,0]
var i
func _ready():
	var first_flame = FLAMES.instantiate()
	arrayflame[0] = first_flame;
	await get_tree().create_timer(2.0).timeout
	first_flame.position.x = flame_position
	first_flame.position.y = randf_range(-100,100)
	flame_position += 360
	
	while true:
		var new_flame = FLAMES.instantiate()
		add_child(new_flame)
		new_flame.position.x = flame_position
		new_flame.position.y = randf_range(-100,100)
		flame_position += 360
		var last_flame = arrayflame[1]
		arrayflame[1] = first_flame
		arrayflame[0] = new_flame
		first_flame = new_flame
		if flame_position > 1080: 
			last_flame.queue_free() 
		await get_tree().create_timer(4.2).timeout
func _process(delta):
	parallax_background.scroll_offset += scroll_speed * delta

func _on_hitbox_body_entered(body):
	if body.name == "flame1" || body.name == "flame2" || body.name == "ceiling" || body.name == "floor":
		pig._death()
		get_tree().change_scene_to_file("res://gameover/gameover.tscn")

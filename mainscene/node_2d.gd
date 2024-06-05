extends Node2D
@onready var pig = $Pig
@onready var parallax_background = $ParallaxBackground
@onready var points = $Camera2D/points
@onready var point_audio = $"Pig/point-audio"


const FLAMES = preload("res://kebabboni.tscn")
var scroll_speed = Vector2(0, 10) # Velocità di scorrimento (X, Y)
var flame_position = 320
var arrayflame = [0,0]
func _ready():
	var first_flame = FLAMES.instantiate()
	arrayflame[0] = first_flame;
	first_flame.position.x = flame_position
	first_flame.position.y = randf_range(-120,80)
	flame_position += 360
	points.text = "0" 
	add_child(first_flame)
	await get_tree().create_timer(6).timeout
	
	while true:
		var new_flame = FLAMES.instantiate()
		add_child(new_flame)
		new_flame.position.x = flame_position
		new_flame.position.y = randf_range(-120,80)
		flame_position += 360
		var last_flame = arrayflame[1]
		arrayflame[1] = first_flame
		arrayflame[0] = new_flame
		first_flame = new_flame
		if flame_position > 1080: 
			last_flame.queue_free() 
		await get_tree().create_timer(4).timeout
func _process(delta):
	parallax_background.scroll_offset += scroll_speed * delta

func _on_hitbox_body_entered(body):
	if body.name == "flame1" || body.name == "flame2" || body.name == "ceiling" || body.name == "floor":
		points.visible = false
		pig._death()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://gameover/gameover.tscn")
	elif body.name == "punto":
		point_audio.play()
		points.text = str(int(points.text) + 1)
		Globals.punteggio = int(points.text)

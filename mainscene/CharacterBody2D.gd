extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var flap_audio = $"flap-audio"

var gravity: float = 800.0
var flap_strength: float = -200.0
var death = false

func _ready() -> void:
	velocity = Vector2.ZERO
	velocity.x += 90
	add_to_group("player")

func _physics_process(delta: float) -> void:
		if death == false:
			velocity.y += gravity * delta
			move_and_slide()

func _death():
	animated_sprite_2d.play("death")
	death = true

func _input(event):
	if (Input.is_action_just_pressed("flap") or event is InputEventScreenTouch) && death == false:
		if event.pressed:
			animated_sprite_2d.play("flap")
			flap_audio.play()
			velocity.y = flap_strength

extends CharacterBody2D
var gravity: float = 800.0
var flap_strength: float = -200.0
var death = false

func _ready() -> void:
	velocity = Vector2.ZERO
	velocity.x += 80
	add_to_group("player")

func _physics_process(delta: float) -> void:
		if death == false:
			velocity.y += gravity * delta
			# Se si preme la barra spaziatrice, il personaggio vola
			if Input.is_action_just_pressed("flap"):
				velocity.y = flap_strength
			# Applica il movimento
			move_and_slide()

func _death():
	death = true

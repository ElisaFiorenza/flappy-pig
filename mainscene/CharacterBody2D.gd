extends CharacterBody2D
var dead
# Velocità di movimento verticale
var gravity: float = 800.0
var flap_strength: float = -200.0

func _ready() -> void:
	velocity = Vector2.ZERO
	velocity.x += 80
	dead = false
	# Configura l'input per la barra spaziatrice

func _physics_process(delta: float) -> void:
	if dead == false:
		# Applica gravità
		velocity.y += gravity * delta
		
		# Se si preme la barra spaziatrice, il personaggio vola
		if Input.is_action_just_pressed("flap"):
			velocity.y = flap_strength
		
		# Applica il movimento
		move_and_slide()
		


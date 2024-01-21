extends CharacterBody2D


const SPEED = 100.0
var direccion = Vector2.ZERO

var en_aire = false
var altura_act = 1

func _physics_process(delta):
	direccion = Vector2.ZERO
	
	for i in range(1,4):
		set_collision_layer_value(i,altura_act != i)
		set_collision_mask_value(i,altura_act != i)
		if en_aire:
			set_collision_layer_value(i,altura_act > i+1)
			set_collision_mask_value(i,altura_act > i+1)
	
	direccion.x = Input.get_axis("ui_left", "ui_right")
	direccion.y = Input.get_axis("ui_up", "ui_down")
	
	direccion = direccion.normalized()
	
	if direccion:
		velocity = direccion * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	$Label.text = str(altura_act)
	
	move_and_slide()

extends CharacterBody2D

var direccion = Vector2.ZERO
var movimiento = Vector2.ZERO
var posicion_escape = Vector2.ZERO

var rapidez = 110

var personaje = null

func _physics_process(delta):
	movimiento = Vector2.ZERO
	
	if posicion_escape != Vector2.ZERO:
		if $RayCast2D.is_colliding():
			var dis_recorrida = abs(global_position.distance_to(posicion_escape)-50)
			var nueva_pe = to_global(-global_position.direction_to(posicion_escape).orthogonal().normalized()*dis_recorrida)
			posicion_escape = nueva_pe
			$RayCast2D.target_position = to_local(posicion_escape)
		
		if global_position.distance_to(posicion_escape) >= 10:
			movimiento = global_position.direction_to(posicion_escape)
		else:
			posicion_escape = Vector2.ZERO
	else:
		if personaje != null:
			if global_position.distance_to(personaje.global_position) < 100:
				posicion_escape = to_global(-position.direction_to(personaje.position)*100)
				$RayCast2D.target_position = to_local(posicion_escape)
	
	velocity = movimiento*rapidez
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Personaje"):
		personaje = body

func _on_area_2d_body_exited(body):
	if body.is_in_group("Personaje"):
		personaje = null

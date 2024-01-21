extends Node2D

@onready var angulo_sube = Vector2(sin(self.rotation),cos(self.rotation))

@onready var angulo_baja = -angulo_sube

func _on_sube_body_exited(body):
	if body.is_in_group("Personaje"):
		if body.direccion.y == -angulo_sube.y:
			body.altura_act += 1


func _on_baja_body_exited(body):
	if body.is_in_group("Personaje"):
		if body.direccion.y == angulo_sube.y:
			body.altura_act -= 1

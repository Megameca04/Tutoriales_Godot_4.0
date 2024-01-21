extends Node2D

var pos_inicial : Vector2

#variables que afectan en la camara lenta.
const VALOR_FINAL = 1

var activado = false
var momento_inicial
var duracion_miliseg
var valor_inicial
#-------------------------------------------#

func _ready():
	pos_inicial = $Jugador.global_position

func _process(delta):
	_mover_plataforma(delta)
	_camara_lenta()

func _camara_lenta():
	#codigo que hace funcionar la camara lenta
	if activado:
		var momento_actual = Time.get_ticks_msec() - momento_inicial
		var valor = suavizado_cir(momento_actual,valor_inicial,VALOR_FINAL,duracion_miliseg)
		if momento_actual >= duracion_miliseg:
			activado = false
			valor = VALOR_FINAL
		Engine.time_scale = valor
	else:
		if Input.is_action_just_pressed("control"):
			iniciar_cam_lenta(5,0.9)

#t: momento actual
#vi: valor inicial
#vf: valor final
#d: duracion
func suavizado_cir(t, vi, vf, d):
	t /= d
	return -vf*(sqrt(1 -  pow(t,2)) - 1) + vi

#funcion para iniciar la camara lenta
func iniciar_cam_lenta(duracion, fuerza):
	momento_inicial = Time.get_ticks_msec()
	duracion_miliseg = duracion*1000
	valor_inicial = 1 - fuerza
	Engine.time_scale = valor_inicial
	activado = true

func _mover_plataforma(delta):
	$Path2D/PathFollow2D.progress += 500*delta

func _on_area_2d_body_entered(body):
	$Jugador.global_position = pos_inicial

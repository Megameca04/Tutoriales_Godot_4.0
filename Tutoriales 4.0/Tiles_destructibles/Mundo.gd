extends Node2D

const  BALA = preload("res://Bala.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		crear_bala(0,-1)
	if Input.is_action_just_pressed("ui_down"):
		crear_bala(0,1)
	if Input.is_action_just_pressed("ui_left"):
		crear_bala(-1,0)
	if Input.is_action_just_pressed("ui_right"):
		crear_bala(1,0)


func crear_bala(x,y):
	var bala = BALA.instantiate()
	bala.direccion = Vector2(x,y)
	bala.global_position = $Marker2D.global_position
	add_child(bala)

func borrar_tile(posicion):
	var tile = $TileMap.local_to_map($TileMap.to_local(posicion))
	$TileMap.erase_cell(0,tile)

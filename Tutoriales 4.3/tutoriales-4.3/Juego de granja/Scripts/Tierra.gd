extends TileMapLayer

const PLANTA : PackedScene = preload("res://Juego de granja/Nodos/Planta.tscn")

var conj_plantas = []

func click_a_mapa(pos : Vector2) -> Vector2i:
	var pos_click : Vector2 = to_local(pos)
	var pos_mapa : Vector2i = local_to_map(pos_click)
	return pos_mapa

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		
		if event.pressed:
			
			var lugar_click = click_a_mapa(event.global_position)
			
			if event.button_index == 1:
				
				set_cell(lugar_click,1,Vector2i(0,0))
				
				for i in conj_plantas: 
					if i.global_position == to_global(map_to_local(lugar_click)):
						i.cell = get_cell_tile_data(lugar_click)
				
			elif event.button_index == 2:
				
				var puede_col = true
				
				for i in conj_plantas: 
					if i.global_position == to_global(map_to_local(lugar_click)):
						puede_col = false
						break
				
				if puede_col:
					
					var datos_tile : TileData = get_cell_tile_data(lugar_click)
					var planta = PLANTA.instantiate()
					
					planta.cell = datos_tile
					planta.global_position = to_global(map_to_local(lugar_click))
					
					conj_plantas.append(planta)
					
					add_child(planta)

func _on_timer_timeout():
	
	for i in get_used_cells():
		
		if get_cell_tile_data(i).get_custom_data("Agua"):
			
			set_cell(i,1,Vector2(1,0))
			
			for p in conj_plantas:
				if map_to_local(i) == p.global_position:
					p.cell = get_cell_tile_data(i)
					break

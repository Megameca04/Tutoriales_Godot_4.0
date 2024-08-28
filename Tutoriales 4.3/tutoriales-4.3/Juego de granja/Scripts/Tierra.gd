extends TileMapLayer



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			var pos_click = to_local(event.global_position)
			var pos_mapa = local_to_map(pos_click)
			
			set_cell(pos_mapa,1,Vector2i(0,0))

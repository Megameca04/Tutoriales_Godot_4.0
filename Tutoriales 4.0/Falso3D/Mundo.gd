extends Node2D

func altura_obj(posicion:Vector2):
	var pos_tile = $TileMap.local_to_map($TileMap.to_local(posicion))
	var info = $TileMap.get_cell_tile_data(0,pos_tile)
	return info.get_custom_data("altura")

extends Node2D

var cell : TileData = null

func _on_crecimiento_timeout():
	if cell.get_custom_data("Agua"):
		$AnimatedSprite2D.frame += 1

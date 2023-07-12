extends CharacterBody2D

var direccion = Vector2.ZERO

var rapidez = 300

signal golpea_pared(pos)

func _ready():
	set_velocity(direccion*rapidez)
	
	$Sprite2D.rotation = direccion.angle()
	
	self.connect("golpea_pared",Callable(get_parent(),"borrar_tile"))

func _physics_process(delta):
	move_and_slide()

func _process(delta):
	if is_on_wall():
		emit_signal("golpea_pared",$Sprite2D/Marker2D.global_position)
		self.queue_free()

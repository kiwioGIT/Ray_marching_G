extends Camera
tool

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	get_surface_material(0).set_shader_param("cam_pos",global_transform.origin)
	pass

extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var mat : Material = get_parent().get_node("MeshInstance").get_surface_material(0)

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().get_class() != "Viewport":
		mat = get_parent().get_node("MeshInstance").get_surface_material(0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Node2D2/iterations").text = str(get_node("IterationsSlider").value)
	get_node("Node2D2/prec").text = str(get_node("PrecisionSlider").value)
	get_node("Node2D2/shadow_prec").text = str(get_node("ShadowPrecisionSlider").value)
	
	get_node("ColorInfo/Label").text = str(get_node("RSlider").value/100)
	get_node("ColorInfo/Label2").text = str(get_node("GSlider").value/100)
	get_node("ColorInfo/Label3").text = str(get_node("BSlider").value/100)
	
	get_node("Label11").text = str(Engine.get_frames_per_second())
	
	if mat == null:
		return
	mat.set_shader_param("Iterations",get_node("IterationsSlider").value)
	mat.set_shader_param("precision",1.0/get_node("PrecisionSlider").value)
	mat.set_shader_param("shadow_precision",1.0/get_node("ShadowPrecisionSlider").value)
	
	mat.set_shader_param("use_darkening",get_node("Control/Node2D/Darkening").pressed)
	
	mat.set_shader_param("main_color_r",get_node("RSlider").value/100.0)
	mat.set_shader_param("main_color_g",get_node("GSlider").value/100.0)
	mat.set_shader_param("main_color_b",get_node("BSlider").value/100.0)
	
	mat.set_shader_param("main_d_pow_r",get_node("RPSlider").value)
	mat.set_shader_param("main_d_pow_g",get_node("GPSlider").value)
	mat.set_shader_param("main_d_pow_b",get_node("BPSlider").value)
	
	mat.set_shader_param("ambient_light_scale",get_node("LightControl/ALS").value)
	mat.set_shader_param("ambient_oclusion_scale",get_node("LightControl/AOS").value)
	
	mat.set_shader_param("specular_strenght",get_node("LightControl/SSS").value)
	mat.set_shader_param("smoothness",get_node("LightControl/SS").value)
	
	mat.set_shader_param("light_normal",Vector3(get_node("LightControl/LNX").value,get_node("LightControl/LNY").value,get_node("LightControl/LNZ").value))
	
	get_parent().speed = get_node("CSS").value
	get_parent().sensitivity = get_node("CSNS").value
	


func _on_Button_pressed():
	get_node("hint").visible = true
	pass # Replace with function body.

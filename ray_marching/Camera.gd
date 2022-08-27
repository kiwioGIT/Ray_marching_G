extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var capt = false
var speed = 0.1;

var sensitivity = 1.0

onready var cam = get_node("Camera")

# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventMouseMotion and capt:
		cam.rotation_degrees.x -= event.relative.y * 0.1 * sensitivity
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -90, 90)
		cam.rotation_degrees.y -= event.relative.x * 0.1 * sensitivity
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		cam.transform.origin += Vector3(0,0,-speed).rotated(Vector3(0,1,0),cam.rotation.y)
	if Input.is_action_pressed("ui_down"):
		cam.transform.origin += Vector3(0,0,speed).rotated(Vector3(0,1,0),cam.rotation.y)
	if Input.is_action_pressed("ui_left"):
		cam.transform.origin += Vector3(-speed,0,0).rotated(Vector3(0,1,0),cam.rotation.y)
	if Input.is_action_pressed("ui_right"):
		cam.transform.origin += Vector3(speed,0,0).rotated(Vector3(0,1,0),cam.rotation.y)
	if Input.is_action_pressed("space"):
		cam.transform.origin += Vector3(0,speed,0).rotated(Vector3(0,1,0),cam.rotation.y)
	if Input.is_action_pressed("shift"):
		cam.transform.origin += Vector3(0,-speed,0).rotated(Vector3(0,1,0),cam.rotation.y)
	
	get_node("Control").visible = !capt
	
	if Input.is_action_just_pressed("esc"):
		if capt == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			capt = true
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			capt = false

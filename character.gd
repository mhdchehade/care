extends Node

var childName = "Bunny"
var childNode
var cameraNode
var cameraRelativeV3 = Vector3(0.0, 4.0, -7.0)
var cameraRelativeV3length
var center
var rotationX = 0.0
var rotationY = 0.0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	center = get_viewport().size * 0.5
	childNode = get_node(childName)
	cameraNode = get_node(childName + "/CamSpatial")
#	cameraRelativeV3length = cameraRelativeV3.length()
	set_process(true)

func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		childNode.translate(Vector3(-1.0, 0.0, 0.0))
	if Input.is_action_just_pressed("ui_left"):
		childNode.translate(Vector3(1.0, 0.0, 0.0))
	if Input.is_action_just_pressed("ui_up"):
		childNode.translate(Vector3(0.0, 0.0, 1.0))
	if Input.is_action_just_pressed("ui_down"):
		childNode.translate(Vector3(0.0, 0.0, -1.0))
	if Input.is_action_just_pressed("c_rrot"):
		childNode.rotate_y(0.05)
	if Input.is_action_just_pressed("c_lrot"):
		childNode.rotate_y(-0.05)
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	
	
	var mouse_pos = get_viewport().get_mouse_position()
	print(mouse_pos)
#	var xrotation = Vector2(cameraNode.get_translation().x, cameraNode.get_translation().z).angle_to_point(Vector2(childNode.get_translation().x, childNode.get_translation().z)) - PI * 0.5
#	print(xrotation)
	var xrotation = mouse_pos.x * 0.001 #center.angle_to_point(Vector2(mouse_pos.x, 0.0))
	var yrotation = mouse_pos.y * 0.001 #center.angle_to_point(Vector2(0.0, mouse_pos.y)) * 0.1
	#var rotation = center.angle_to_point(Vector2(mouse_pos.x, 0.0)) * 0.1
#
	rotationX = xrotation
	rotationY = yrotation
##	print(rotationY)
##	if rotationY > 0.0:
##		rotationY = min(rotationY, PI * 0.2)
##	else:
##		rotationY = max(rotationY, -PI * 0.2)
	cameraNode.set_rotation(Vector3(rotationY, -rotationX, 0.0))
#
#	#cameraRelativeV3 = cameraRelativeV3.rotated(Vector3(0.0, 1.0, 0.0), rotation * 0.1)
#	var childNodeTranslation = childNode.to_global(cameraRelativeV3)
#	var cameraTranslation = cameraNode.get_translation()
#	var cameraTranslate = childNodeTranslation - cameraTranslation
#	var i = cameraRelativeV3length - cameraTranslate.length()
#	cameraTranslate = cameraTranslate #* 0.1
#	cameraNode.translate(cameraTranslate)
#
#	get_viewport().warp_mouse(center)





extends SpringArm3D
class_name PlayerCameraController

@export_group("Resources")
@export var input_handler: PlayerCharacterInputHandler

@export_group("Camera Settings")
@export var use_keyboard_rotation := false
@export var use_mouse_rotation := true
@export var keyboard_rotate_speed := 0.02


func _physics_process(delta: float) -> void:
	handle_camera_rotation(delta)

func handle_camera_rotation(delta: float):
	var added_rotation = 0
	if use_keyboard_rotation:
		added_rotation += input_handler.get_keyboard_cam_rotation_input() * keyboard_rotate_speed
	if use_mouse_rotation and false: #Needs some work. Something isn't right
		added_rotation -= input_handler.get_mouse_x_movement() * keyboard_rotate_speed * delta
	rotate_y(added_rotation)

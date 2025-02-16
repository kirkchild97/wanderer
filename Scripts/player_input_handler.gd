extends Node
class_name PlayerCharacterInputHandler

var mouse_x_movement := 0.0

func get_move_input() -> Vector3:
	var raw_input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	return Vector3(raw_input.x, 0, raw_input.y)

func get_keyboard_cam_rotation_input() -> float:
	return Input.get_axis("rotate_cam_left", "rotate_cam_right")

func get_mouse_x_movement() -> float:
	if Input.is_action_pressed("trigger_mouse_cam_rotation"):
		var send_rotation = mouse_x_movement
		mouse_x_movement = 0.0
		return send_rotation
	return 0.0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:# and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		mouse_x_movement = event.screen_velocity.x
	

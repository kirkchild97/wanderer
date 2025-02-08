extends Node
class_name PlayerCharacterInputHandler

var mouse_x_movement := 0.0

func get_move_input() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")

func get_keyboard_cam_rotation_input() -> float:
	return Input.get_axis("rotate_cam_left", "rotate_cam_right")

func get_mouse_x_movement() -> float:
	return mouse_x_movement

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:# and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		mouse_x_movement = event.screen_relative

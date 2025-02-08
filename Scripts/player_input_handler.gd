extends Node
class_name PlayerCharacterInputHandler

func get_move_input() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")

extends PlayerCharacterInputHandler
class_name EnemyCharacterInputHandler

@export var player_character: CharacterBody3D

func give_enemy_resources(data):
	print("Give the enemy all necessary information to kill the player")

func get_move_input() -> Vector2:
	return Vector2.ZERO;

func get_keyboard_cam_rotation_input() -> float:
	print("Enemies cannot rotate a camera stupid");
	return 0.0;

func get_mouse_x_movement() -> float:
	print("What does an enemy care about the mouse movement?")
	return 0.0

func _unhandled_input(event: InputEvent) -> void:
	pass

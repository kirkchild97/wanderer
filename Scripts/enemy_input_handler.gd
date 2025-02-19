extends PlayerCharacterInputHandler
class_name EnemyCharacterInputHandler

@export_group("Resources")
@export var player_character: CharacterBody3D
@export var enemy_character: CharacterBody3D
@export var agent: NavigationAgent3D

func give_enemy_resources(data):
	print("Give the enemy all necessary information to kill the player")

func get_move_input() -> Vector3:
	get_player_location()
	var destination := agent.get_next_path_position()
	var current_location = enemy_character.global_transform.origin
	var new_velocity = (destination - current_location).normalized()
	return new_velocity

func get_player_location():
	if player_character != null:
		agent.target_position = player_character.global_position

#Because I'm a slave to OOP and want to access intellisense
func _unhandled_input(event: InputEvent):
	pass
func get_keyboard_cam_rotation_input():
	pass
func get_mouse_x_movement():
	pass

extends State
class_name TankBasedMovementState

@export_group("Movement Resources")
@export var rotation_speed := 0.5
@export var speed := 1.0
@export var acceleration := 100.0

var character_body: CharacterBody3D
var input_handler: PlayerCharacterInputHandler

func feed_resources(data):
	character_body = data.character_body
	input_handler = data.input_handler

func state_physics_process(delta: float):
	var raw_input := input_handler.get_move_input()
	var forward := character_body.global_basis.z
	var char_rotation := raw_input.x
	var char_movement := (forward * raw_input.y).normalized()
	character_body.rotate_y(-char_rotation * rotation_speed * delta)
	print("Char Movement =? ", char_movement)
	character_body.velocity = character_body.velocity.move_toward(char_movement * speed, acceleration * delta)
	character_body.move_and_slide()

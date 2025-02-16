extends State
class_name TankBasedMovementState

@export_group("Movement Resources")
@export var tank_base: Node3D
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
	var forward := tank_base.global_basis.z #Maybe use different base for tank based movement and rotation
	var char_rotation := raw_input.x
	var char_movement := (forward * raw_input.z).normalized()
	tank_base.rotate_y(-char_rotation * rotation_speed * delta)
	character_body.velocity = character_body.velocity.move_toward(char_movement * speed, acceleration * delta)
	character_body.move_and_slide()

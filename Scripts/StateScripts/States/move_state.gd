extends State
class_name MoveState

@export var is_player: bool = false
@export_group("Movement") #Maybe these could be replaced with Resources later on
@export var speed: float = 1.0
@export var acceleration: float = 1.0

var camera: Camera3D
var character_body: CharacterBody3D
var input_handler#: PlayerCharacterInputHandler or EnemyCharacterInputHandler

func feed_resources(data):
	character_body = data.character_body
	input_handler = data.input_handler
	camera = get_viewport().get_camera_3d()

func on_state_enter(data = {}):
	pass

func on_state_exit():
	# Cleanup State once it is removed from current State
	pass

func state_process(_delta: float):
	#To be called from State machine process func when set as active
	pass

func state_physics_process(delta: float):
	handle_character_movement(delta)

func handle_character_movement(delta: float):
	var raw_input = input_handler.get_move_input()
	var move_direction: Vector3
	if is_player:
		var forward := camera.global_basis.z
		var right := camera.global_basis.x
		move_direction = forward * raw_input.z + right * raw_input.x
	else:
		move_direction = raw_input
	move_direction.y = 0.0
	move_direction = move_direction.normalized()
	character_body.velocity = character_body.velocity.move_toward(move_direction * speed, acceleration * delta)
	character_body.move_and_slide()

extends StateMachine
class_name EnemyStateMachine

@export_group("MachineResources")
@export var character_body: CharacterBody3D
@export var input_handler: EnemyCharacterInputHandler


func _ready() -> void:
	feed_child_states_resources()

func feed_child_states_resources():
	var states = get_children() as Array[State]
	for state in states:
		state.feed_resources({
			"character_body": character_body,
			"input_handler": input_handler
		})
	current_state = states[0]

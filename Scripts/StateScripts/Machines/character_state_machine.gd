extends StateMachine
class_name CharacterStateMachine

@export_group("MachineResources")
@export var character_body: CharacterBody3D
@export var player_input: PlayerCharacterInputHandler


func _ready() -> void:
	feed_child_states_resources()

func feed_child_states_resources():
	var states = get_children() as Array[State]
	for state in states:
		state.feed_resources({
			"character_body": character_body,
			"input_handler": player_input
		})
	current_state = states[0]

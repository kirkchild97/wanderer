extends StateMachine
class_name EnemyStateMachine

@export_group("MachineResources")
@export var character_body: CharacterBody3D
@export var input_handler: EnemyCharacterInputHandler


func _ready() -> void:
	feed_child_states_resources()

func feed_child_states_resources():
	var states = get_children() as Array[State]
	var resources:= StateMachineResources.new(character_body, input_handler)
	for state in states:
		state.feed_resources(resources)
	current_state = states[0]

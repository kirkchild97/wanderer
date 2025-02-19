extends StateMachine
class_name CharacterStateMachine

@export_group("MachineResources")
@export var character_body: CharacterBody3D
@export var input_handler: PlayerCharacterInputHandler
@export var stats: CharacterInfo #Determine if this is the right place for this
# It may be better to place this at a higher level to better access stuff. Not sure 
# right now because I'm half awake trying to get this to not break anything

var character_info: CharacterInfo


func _ready() -> void:
	character_info = stats.duplicate(true)
	feed_child_states_resources()

func feed_child_states_resources():
	var states = get_children() as Array[State]
	var resources:= StateMachineResources.new(character_body, input_handler, stats)
	for state in states:
		state.feed_resources(resources)
	current_state = states[0]

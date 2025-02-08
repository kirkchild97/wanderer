extends Node
class_name StateMachine

var current_state: State

func _init() -> void:
	#Setup Child States with all necessary information and supplemental Nodes
	pass

func _process(delta: float) -> void:
	if current_state != null: current_state.state_process(delta)

func _physics_process(delta: float) -> void:
	if current_state != null: current_state.state_physics_process(delta)

func change_state(newState: State, data = {}) -> void:
	if current_state != null:
		current_state.leave_state.disconnect(change_state)
		current_state.on_state_exit()
	current_state = newState
	current_state.on_state_enter(data)
	current_state.leave_state.connect(change_state)

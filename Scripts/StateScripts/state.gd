extends Node
class_name State

# Maybe Godot will allow this?? Not tested yet.
signal leave_state(new_state: State)

func feed_resources(_resources: StateMachineResources):
	pass

func on_state_enter(_data = {}):
	# Setup State once it is triggered as the current state
	pass

func on_state_exit():
	# Cleanup State once it is removed from current State
	pass

func state_process(_delta: float):
	#To be called from State machine process func when set as active
	pass

func state_physics_process(_delta: float):
	# Same as state_process but add Bill Nye in the mix
	pass

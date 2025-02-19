extends Resource
class_name StateMachineResources

var character_body: CharacterBody3D
var input_handler: PlayerCharacterInputHandler
var character_info: CharacterInfo

func _init(
	_character_body: CharacterBody3D = null,
	_input_handler: PlayerCharacterInputHandler = null,
	character_info: CharacterInfo = null
	) -> void:
		character_body = _character_body
		input_handler = _input_handler
		self.character_info = character_info

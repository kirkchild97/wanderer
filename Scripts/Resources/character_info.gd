extends Resource
class_name CharacterInfo

# Could just use a boolean like isPlayer or something but this leaves it open
# Player team is 0
@export var team: int = 0

@export_group("Movement")
@export var speed: float = 3.0
@export var acceleration: float = 1.0

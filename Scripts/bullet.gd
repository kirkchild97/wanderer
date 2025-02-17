extends Area3D
class_name Bullet

@export_group("Bullet Settings")
@export var speed: float = 10

var spawn_position: Vector3
var spawn_rotation: Vector3

func _ready() -> void:
	global_position = spawn_position
	global_rotation = spawn_rotation
	top_level = true

func _physics_process(delta: float) -> void:
	var go_speed:= Vector3.FORWARD * speed * delta
	translate(go_speed)

extends Node3D
class_name DirectAimTurret

@export_group("Turret Settings")
@export var bullet: PackedScene

func _process(delta: float) -> void:
	handle_turret_fire()

func _physics_process(delta: float) -> void:
	handle_mouse_look_at()

func handle_mouse_look_at():
	var space_state = get_world_3d().direct_space_state
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_origin = %PlayerCamera.project_ray_origin(mouse_pos)
	var ray_end = ray_origin + %PlayerCamera.project_ray_normal(mouse_pos) * 2000
	var ray_query = PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
	var ray_array = space_state.intersect_ray(ray_query)
	if ray_array.has("position"):
		var actual_look_at:= Vector3(ray_array["position"].x, global_position.y, ray_array["position"].z)
		look_at(actual_look_at, Vector3.UP)

func handle_turret_fire():
	if Input.is_action_just_pressed("fire") and bullet != null:
		var shot = bullet.instantiate() as Bullet
		shot.spawn_position = %BulletPosition.global_position
		shot.spawn_rotation = global_rotation
		add_child(shot)

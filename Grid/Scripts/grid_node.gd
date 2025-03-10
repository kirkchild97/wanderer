extends Area3D
class_name GridNode

func _ready() -> void:
	print("Measurement -=> ", $"32x32x32EmptyBoxOutline".get_aabb());


extends Node3D
@onready var spinner: Node3D = $Spinner
@onready var spinner_distance: Node3D = $Spinner/SpinnerDistance
@onready var spinner_rotation_reset: Node3D = $Spinner/SpinnerDistance/RotationReset
@export var length: float = 1.0
@export var radius: float = 4
@export var counter_clockwise: bool = false

func _ready() -> void:
	refresh_radius()

func _process(delta: float) -> void:
	process_rotate(delta)

func refresh_radius() -> void:
	spinner_distance.position.y = radius

func process_rotate(delta: float) -> void:
	var angle: float = TAU / length * delta
	if counter_clockwise:
		angle *= -1
	spinner.rotate_z(angle)
	spinner_rotation_reset.global_rotation = Vector3.ZERO

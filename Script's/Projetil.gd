extends KinematicBody2D

const NORMAL = Vector2(0,-1)
var GRAVITY = 0
export var mov = 5
export var dir = "-"
var motion = Vector2()

func _ready():
	direct()

func direct():
	if dir == "-":
		mov = mov
		rotation_degrees = 0
	elif dir == "+":
		mov = -mov
		rotation_degrees = 180

func _physics_process(delta):
	_move(delta)

func _move(_delta):
	motion.x -= GRAVITY
	motion = move_and_slide(motion, NORMAL)

func _on_VisibilityNotifier2D_screen_exited():
	if GRAVITY == mov:
		queue_free()


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		$Particles2D.emitting = true
		GRAVITY = mov

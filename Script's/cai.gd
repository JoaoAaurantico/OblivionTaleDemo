extends KinematicBody2D

const NORMAL = Vector2(0,-1)
var GRAVITY = 0
var motion = Vector2()

func _physics_process(delta):
	_move(delta)

func _move(_delta):
	motion.y += GRAVITY
	motion = move_and_slide(motion, NORMAL)

func _on_Deteco_area_entered(area):
	if area.is_in_group("Player"):
		GRAVITY = 20

func _on_VisibilityNotifier2D_screen_exited():
	if GRAVITY == 20:
		queue_free()

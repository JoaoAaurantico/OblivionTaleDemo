extends KinematicBody2D

const NORMAL = Vector2(0,-1)

var GRAVITY = 30
var SPEED = 200
var motion = Vector2()

func _physics_process(delta):
	_move(delta)

func _move(_delta):
	motion.y += GRAVITY
	motion = move_and_slide(motion, NORMAL)
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		motion.x = SPEED
	else:
		 motion.x = 0


func _on_Area2D_area_exited(area):
	if area.is_in_group("Player"):
		motion.x = 0
	elif global_position.y > OS.window_size.y:
		queue_free()


func _on_Area2D2_area_entered(area):
	if area.is_in_group("Player"):
		motion.x = -SPEED
	else:
		 motion.x = 0


func _on_Area2D2_area_exited(area):
	if area.is_in_group("Player"):
		motion.x = 0
	elif global_position.y > OS.window_size.y:
		queue_free()

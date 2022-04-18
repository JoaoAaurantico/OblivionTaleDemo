extends Node2D

func _on_Area2D_area_entered(area):
	$AnimatedSprite.play()
	if area.is_in_group("Player"):
		Global.checkpoint = $AnimatedSprite/Area2D/CollisionShape2D.global_position


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.set_frame(11)
	

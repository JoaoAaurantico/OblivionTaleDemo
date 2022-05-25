extends Node2D

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		Global.add_lampiao()
		$AnimationPlayer.play("Collected")


func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()

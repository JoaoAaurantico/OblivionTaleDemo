extends Node2D

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		Global.add_espelho()
		print(Global.espelho)
		$AnimationPlayer.play("VidroPego")
		$Area2D/CollisionShape2D.queue_free()
		if Global.checkpoint != Vector2(0,0):
			Global.checkpoint = Vector2(0,0)


func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()

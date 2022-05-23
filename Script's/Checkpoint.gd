extends Node2D

var pegado = false

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player") && pegado == false:
		$AnimationPlayer.play("Collected")
		Global.checkpoint = $Sprite.global_position
	


func _on_AnimationPlayer_animation_finished(_anim_name):
	pegado = true
	$AnimationPlayer.play("Stand")



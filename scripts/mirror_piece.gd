extends Node2D

export var espelhonum = 0

func _ready():
	if Global.espelho >= espelhonum:
		queue_free()
	$Area2D/Vidro.frame = Global.espelho

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		Global.chave = false
		Global.add_espelho()
		$AnimationPlayer.play("VidroPego")
		$Area2D/CollisionShape2D.queue_free()
		if Global.checkpoint != Vector2(0,0):
			Global.checkpoint = Vector2(0,0)


func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()

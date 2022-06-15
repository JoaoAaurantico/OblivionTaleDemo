extends Node2D

export var lampiaonumero= 0

func _ready():
	if Global.dict_lamp.has(lampiaonumero):
		queue_free()

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		$Area2D.queue_free()
		Global.add_lampiao()
		Global.dict_lamp[lampiaonumero] = lampiaonumero
		$AnimationPlayer.play("Collected")


func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()

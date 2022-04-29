extends Node

signal iniciar
signal parar


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro": 
		$AnimationPlayer.play("LoopMenu")


func _on_Audio_parar():
	$AnimationPlayer.stop()



func _on_Audio_iniciar(musica):
	if musica == "abertura":
		$AnimationPlayer.play("Intro")
	if musica == "LoopMenu":
		$AnimationPlayer.play("LoopMenu")

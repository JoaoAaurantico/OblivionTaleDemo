extends Node

signal iniciar
signal parar

func _on_PlayerUI_animation_finished(_anim_name):
	#UI EFFECT
	$PlayerUI.stop()
func _on_AnimationPlayer_animation_finished(anim_name):
	#SOUNDTRACK EFFECT
	if anim_name == "Intro": 
		$PlayerSoundtrack.play("LoopMenu")
	if anim_name == "Hover":
		$PlayerSoundtrack.stop()

func _on_Audio_parar():
	$PlayerSoundtrack.stop()
func _on_Audio_iniciar(musica):
	if musica == "fadesoundtrack":
		$PlayerFades.play("FadeSoundtrack")
	
	if musica == "abertura":
		$PlayerSoundtrack.play("Intro")
	if musica == "LoopMenu":
		$PlayerSoundtrack.play("LoopMenu")
	
	if musica == "hover":
		$PlayerUI.play("Hover")
	if musica == "click":
		$PlayerUI.play("Click")
	
	if musica == "memorieshover":
		$PlayerUI.play("MemoriesHover")
	if musica == "memoriesclick":
		$PlayerUI.play("MemoriesClick")
	
	if musica == "uiambience":
		$PlayerAmbience.play("UIAmbience")

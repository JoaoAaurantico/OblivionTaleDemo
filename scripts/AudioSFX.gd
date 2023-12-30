extends Node2D

var tv = true

func level1(type):
	if type == "play":
		$levels/Level1/LevelAP.play("LEVEL1")
	if type == "stop":
		$levels/Level1/LevelAP.stop()

func Item(type):
	if type == "lamp" and !$itens/lamp.playing:
		$itens/lamp.play()
	if type == "glass" and !$itens/glass.playing:
		$itens/glass.play()

func Player(type):
	if type == "grassLow" and !$player/WalkGrass.playing:
		$player/WalkGrass.pitch_scale = 1.5
		$player/WalkGrass.play()
	if type == "grassHigh" and !$player/WalkGrass.playing:
		$player/WalkGrass.pitch_scale = 3
		$player/WalkGrass.play()
	if type == "jump":
		$player/Jump.play()
	if type == "slide":
		$player/Slide.play()

func GUI(type):
	if type == "death" and !$gui/death.playing:
		$gui/death.pitch_scale = 1
		$gui/death.play()
	if type == "select":
		$gui/select.pitch_scale = 3
		$gui/select.play()
	if type == "press":
		$gui/select.pitch_scale = 1
		$gui/select.play()
	if type == "menuplay" and !$gui/piano.playing:
		$gui/piano.play()
	if type == "menustop":
		tv = false
		$gui/piano.stop()
		$gui/TV.stop()
		$gui/death.pitch_scale = 1.5
		$gui/death.play()
		



func _on_piano_finished():
	if tv == true:
		$gui/TV.play()

func _on_TV_finished():
	$gui/TV.play()

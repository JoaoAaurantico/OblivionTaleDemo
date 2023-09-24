extends Node2D

var ms = 0
var s = 0
var m = 0

var timerInit = false
var timervisible = false

func visibleTimer(button_pressed):
	if button_pressed == true:
		GlobalTimer.timervisible = true
		$CanvasLayer/RichTextLabel.visible = true
	else:
		GlobalTimer.timervisible = false
		$CanvasLayer/RichTextLabel.visible = false

func resetTimer():
	ms = 0
	s = 0
	m = 0
	$Timer.start()
	
func continueTimer():
	$Timer.start()

func stopTimer():
	$Timer.stop()

func _on_Timer_timeout():
	ms += 1
	if ms > 9:
		ms = 0
		s += 1
	if s > 59:
		s = 0
		m += 1
	$CanvasLayer/RichTextLabel.text = str(m) + ":" + str(s) + ":" + str(ms)


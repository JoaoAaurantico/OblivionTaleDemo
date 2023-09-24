extends CanvasLayer

func _ready():
	$Pause/MenuPause/VBoxContainer/Resume.grab_focus()
	$Control.visible = true
	$"Pressão".visible = true

extends Control

#Sistema de Pause

var pausado = false setget esta_pausado



func _unhandled_input(event):
	if event.is_action_pressed("ui_start") && Global.chao == true:
		self.pausado = !pausado
		move_to_previous_menu()
		$MenuPause/VBoxContainer/Resume.grab_focus()
		Global.toggleCapturarMouse()
	else:
		self.pausado = pausado
		move_to_previous_menu()


func esta_pausado(value):
	pausado = value
	get_tree().paused = pausado
	visible = pausado
	
func _process(_delta):
	$MenuPause/Espelho.set_frame(Global.espelho)

func _on_Resume_pressed():
	_on_press()
	self.pausado = false
	Global.toggleCapturarMouse()
	
func _on_Restart_pressed():
	_on_press()
	Global.mortes = 0
	Global.espelho = 0
	Global.lampiao = 0
	Global.checkpoint = Vector2(0,0)
	Global.chave = false
	Global.dict_lamp = {}
	GlobalTimer.timerInit = false
	SceneChanger.change_scene("res://scenes/world/level.tscn")
	self.pausado = false

func _on_Quit_pressed():
	_on_press()
	self.pausado = false
	SceneChanger.change_scene("res://other/menu.tscn")
	GlobalTimer.stopTimer()
	AudioSFX.level1("stop")

func _on_Save_pressed():
	_on_press()
	SaveLoader.save_game()

func _on_Memories_pressed():
	move_to_next_menu("menu_memorias")


#Sistema de transição
var menu_transition_time := 0.5

var menu_origin_position := Vector2.ZERO
var menu_origin_size := Vector2.ZERO

var current_menu
var menu_stack := []

onready var menu_pausa = $MenuPause
onready var menu_memorias = $MenuMemorias
onready var tween = $Tween

func _ready() -> void:
	IdiomaPause()
	menu_origin_position = Vector2(0,0)
	menu_origin_size = get_viewport_rect().size
	current_menu = menu_pausa
	if Global.mouseLock == true:
		Global.toggleCapturarMouse()

func move_to_next_menu(next_menu_id: String):
	var next_menu = get_menu_from_menu_id(next_menu_id)
	tween.interpolate_property(current_menu, "rect_global_position", current_menu.rect_global_position, Vector2(-menu_origin_size.x, 0), menu_transition_time)
	tween.interpolate_property(next_menu, "rect_global_position", next_menu.rect_global_position, menu_origin_position, menu_transition_time)
	tween.start()
	menu_stack.append(current_menu)
	current_menu = next_menu

func move_to_previous_menu():
	var previous_menu = menu_stack.pop_back()
	if previous_menu != null:
		tween.interpolate_property(previous_menu, "rect_global_position", previous_menu.rect_global_position, menu_origin_position, menu_transition_time)
		tween.interpolate_property(current_menu, "rect_global_position", current_menu.rect_global_position, Vector2(menu_origin_size.x, 0), menu_transition_time)
		tween.start()
		current_menu = previous_menu

func get_menu_from_menu_id(menu_id: String) -> Control:
	match menu_id:
		"menu_pausa":
			return menu_pausa
		"menu_memorias":
			return menu_memorias
		_:
			return menu_pausa

# Sistema de memorias
var frameMemoria = 0


func _on_Voltar_pressed():
	move_to_previous_menu()

func _on_Frente_pressed():
	frameMemoria += 1
	if frameMemoria  > Global.espelho:
		frameMemoria = Global.espelho
	else:
		$MenuMemorias/ImagensMemorias.set_frame(frameMemoria)
func _on_Tras_pressed():
	frameMemoria -= 1
	if frameMemoria <= 0:
		frameMemoria = 0
	else:
		$MenuMemorias/ImagensMemorias.set_frame(frameMemoria)

func IdiomaPause():
	$MenuPause/VBoxContainer/Resume.text = Global.idioma.Pause["resume"]
	$MenuPause/VBoxContainer/Save.text = Global.idioma.Pause["save"]
	$MenuPause/VBoxContainer/Restart.text = Global.idioma.Pause["restart"]
	$MenuPause/VBoxContainer/Memories.text = Global.idioma.Pause["memory"]
	$MenuPause/VBoxContainer/Quit.text = Global.idioma.Pause["exit"]
	$MenuPause/achievement/VBoxContainer/achievement1/Label.text = Global.idioma.Achievements[1]
	$MenuPause/achievement/VBoxContainer/achievement2/Label.text = Global.idioma.Achievements[2]
	$MenuPause/achievement/VBoxContainer/achievement3/Label.text = Global.idioma.Achievements[3]
	achievementPause()

func achievementPause():
	if Achievement.TimeAchievement == true:
		$MenuPause/achievement/VBoxContainer/achievement1/starFinish.set_frame(1)
	if Achievement.LampAchievement == true:
		$MenuPause/achievement/VBoxContainer/achievement2/starLamp.set_frame(1)
	if Achievement.DeathAchievement == true:
		$MenuPause/achievement/VBoxContainer/achievement3/starDeath.set_frame(1)


# Audio

func _on_focus_entered():
	if visible == true:
		AudioSFX.GUI("select")


func _on_press():
	AudioSFX.GUI("press")

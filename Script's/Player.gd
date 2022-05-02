extends KinematicBody2D

const NORMAL = Vector2(0,-1)
var motion = Vector2()
var Gravidade = 30
var Pulo = -600
var impulso = 20
var MaxVelocidade = 500
var MinVelocidade = 180
var Velocidade = 180
var Escorregar = 250

var Escorregando =  false
var Parede = false
var Empurrando = false
var Andando = false
var Pulando = false
var Parado = false

func _physics_process(delta):
	states()
	animations()
	_listener(delta)
	motion.y += Gravidade
	if Velocidade >= MaxVelocidade:
		Velocidade = MaxVelocidade

func states():
	if is_on_floor() && motion.x == 0 && !is_on_wall():
		Parado = true
	else:
		Parado = false
	if is_on_floor() && motion.x == Velocidade:
		Andando = true
	elif is_on_floor() && motion.x == -Velocidade:
		Andando = true
	else:
		Andando = false
	if !is_on_floor() && motion.y != 0:
		Pulando = true
	else:
		Pulando = false
	if is_on_floor() && motion.x == Escorregar && !is_on_wall():
		Escorregando = true
	elif is_on_floor() && motion.x == -Escorregar && !is_on_wall():
		Escorregando = true
	else:
		Escorregando = false
	if  motion.x == 0 && motion.y == 30 && is_on_wall():
		Empurrando = true
	else:
		Empurrando = false
func animations():
	if Parado == true:
		$AnimatedSprite.play("Parado")
		$AnimationPlayer.play("CaixaPadrão")
	elif Andando == true:
		$AnimatedSprite.play("Andando")
		$AnimationPlayer.play("CaixaPadrão")
	elif Pulando == true:
		$AnimatedSprite.play("Pulando")
		$AnimationPlayer.play("CaixaPadrão")
	elif Escorregando == true:
		$AnimationPlayer.play("CaixaSlide")
		$AnimatedSprite.play("Deslizando")
	elif Empurrando == true:
		$AnimatedSprite.play("Empurrando")
		$AnimationPlayer.play("CaixaPadrão")

func _listener(_delta):
	if Input.is_action_pressed("ui_right"):
		move("right")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		move("left")
		$AnimatedSprite.flip_h = true
	else:
		move("null")
	if Input.is_action_pressed("ui_down"):
		move("slideCont")
	if Input.is_action_just_pressed("ui_down"):
		move("slidepress")
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		move("up")
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		move("drop")
	
	motion = move_and_slide(motion, NORMAL)
func move(direcao):
	if direcao == "right":
		motion.x = Velocidade
	elif direcao == "left":
		motion.x = -Velocidade 
	elif direcao == "up":
		jump()
	elif direcao == "slideCont":
		slide("pressionando")
	elif direcao == "slidepress":
		slide("pressionou")
	elif direcao == "null":
		motion.x = 0
	elif direcao == "drop":
		Velocidade = MinVelocidade

func jump():
	motion.y = Pulo
	Velocidade = Velocidade + impulso
func jump_cut():
	if motion.y < -100:
		motion.y = -50
func slide(tipo):
	if tipo == "pressionando":
		if $AnimatedSprite.flip_h == false && $TimerSlide.time_left:
			motion.x = Escorregar
		elif $AnimatedSprite.flip_h == true && $TimerSlide.time_left:
			motion.x = -Escorregar
	if tipo == "pressionou":
		$TimerSlide.start()
		Velocidade = Velocidade + impulso

func _on_Area2D_area_entered(area):
	if area.is_in_group("Dano"):
		Global.morto()
	
	if area.is_in_group("Desce_dano"):
		Global.morto()
	
	if area.is_in_group("Portal"):
		Velocidade = 0
		Pulo = 0

func _on_VisibilityNotifier2D_screen_exited():
	if Global.portal == false :
		avisar_morte()
func avisar_morte():
	Global.add_morte()
	Global.morto()

func _on_Timer_timeout():
	if !is_on_ceiling() && is_on_floor():
		Escorregando = false

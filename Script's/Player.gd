extends KinematicBody2D

const NORMAL = Vector2(0,-1)
var motion = Vector2()
var Gravidade = 30
var Pulo = -600
var impulso = 25
var MaxVelocidade = 300
var MinVelocidade = 180
var Velocidade = 180
var Escorregar = 250

var state = 0

func _process(delta):
	states()
	animations()
	_listener(delta)

func _physics_process(_delta):
	altergravity()
func altergravity():
	motion.y += Gravidade
	if Velocidade >= MaxVelocidade:
		Velocidade = MaxVelocidade
	if have_wall() && motion.y > 0:
		Gravidade = 5
	else:
		Gravidade = 30

func states():
	if motion.x == 0 && is_on_floor():
		state = 0
	if motion.x >= impulso && is_on_floor():
		state = 1
	elif motion.x <= -impulso && is_on_floor():
		state = 1
	if !is_on_floor():
		state = 2
	if $TimerSlide.time_left or $RayCima.is_colliding():
		state = 3
	elif $TimerSlide.time_left or $RayCima.is_colliding():
		state = 3
	if  is_on_wall() && is_on_floor() && motion.x == 0 && !$TimerSlide.time_left:
		state = 4
	if !is_on_floor() && have_wall():
		state = 5
func animations():
	if state == 0:
		$AnimatedSprite.play("Parado")
		$AnimationPlayer.play("CaixaPadrão")
	elif state == 1:
		$AnimatedSprite.play("Andando")
		$AnimationPlayer.play("CaixaPadrão")
	elif state == 2:
		$AnimatedSprite.play("Pulando")
		$AnimationPlayer.play("CaixaPulo")
	elif state == 3:
		$AnimationPlayer.play("CaixaSlide")
		$AnimatedSprite.play("Deslizando")
	elif state == 4:
		$AnimatedSprite.play("Empurrando")
		$AnimationPlayer.play("CaixaPadrão")
	elif state == 5:
		$AnimationPlayer.play("CaixaPulo")
		$AnimatedSprite.play("Parede")

func _listener(_delta):
	if Input.is_action_pressed("ui_right") && !$TimerSlide.time_left:
		move("right")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left") && !$TimerSlide.time_left:
		move("left")
		$AnimatedSprite.flip_h = true
	else:
		move("null")

	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			move("up")
		elif have_wall():
			walltimer()
	elif Input.is_action_just_released("ui_up") && !have_wall():
		move("jumpcut")
	if $TimerWallJump.time_left:
		move("walljump")

	if Input.is_action_just_pressed("ui_down") && is_on_floor() && !$TimerSlide.time_left:
		slidetimer()
	if $TimerSlide.time_left && $AnimatedSprite.flip_h == false:
		motion.x = Escorregar
	elif $TimerSlide.time_left && $AnimatedSprite.flip_h == true:
		motion.x = -Escorregar

	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		move("drop")
	
	motion = move_and_slide(motion, NORMAL)
func move(direcao):
	if direcao == "right":
		motion.x = min(motion.x + impulso, Velocidade)
	elif direcao == "left":
		motion.x = max(motion.x - impulso, -Velocidade)
	elif direcao == "up":
		jump()
	elif direcao == "jumpcut":
		jump_cut()
	elif direcao == "walljump":
		wall_jump()
	elif direcao == "slide":
		slide()
	elif direcao == "null":
		motion.x = 0
	elif direcao == "drop":
		Velocidade = MinVelocidade


func have_wall():
	return $RayDireita.is_colliding() or $RayDireita2.is_colliding() or $RayEsquerda.is_colliding() or $RayEsquerda2.is_colliding()
func wall_jump():
	if $RayDireita.is_colliding() && $TimerWallJump.time_left or $RayDireita2.is_colliding() && $TimerWallJump.time_left:
		motion.y = Pulo
		motion.x = -Velocidade 
	elif $RayEsquerda.is_colliding() && $TimerWallJump.time_left or $RayEsquerda2.is_colliding() && $TimerWallJump.time_left:
		motion.y = Pulo
		motion.x = Velocidade 
func jump():
	motion.y = Pulo
	if motion.x != 0:
		Velocidade = Velocidade + impulso
func jump_cut():
	if motion.y < -100:
		motion.y = -50
func slide():
	motion.x = Velocidade
func slidetimer():
	$TimerSlide.start()
func walltimer():
	$TimerWallJump.start()

func _on_Area2D_area_entered(area):
	if area.is_in_group("Dano"):
		Global.morto()
	
	if area.is_in_group("Desce_dano"):
		Global.morto()
	
	if area.is_in_group("Portal"):
		Escorregar = 0
		Velocidade = 0
		Pulo = 0
func _on_VisibilityNotifier2D_screen_exited():
	if Global.portal == false :
		avisar_morte()
func avisar_morte():
	Global.add_morte()
	Global.morto()

func _on_TimerSlide_timeout():
	if $RayCima.is_colliding():
		$TimerSlide.wait_time = 0.05
		$TimerSlide.start()
	else:
		$TimerSlide.wait_time = 0.5

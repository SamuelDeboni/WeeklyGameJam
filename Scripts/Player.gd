extends KinematicBody2D

const G = 50
var g_mult = 1
var vel_mod = 1
var vel = Vector2()

func _ready():
	pass

func _process(delta):
	var normal = Vector2(0,-1)
	move_and_slide(vel*vel_mod,normal)
	
	vel.y += G*g_mult
	
	
	if Input.is_action_pressed("ui_right"):
		vel.x = 100
	elif Input.is_action_pressed("ui_left"):
		vel.x = -100
	elif vel.x > 0:
		vel.x -= 400*delta
	elif vel.x < 0:
		vel.x += 400*delta
		
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		vel.y = -800
	elif not is_on_floor() and Input.is_action_pressed("ui_up"):
		g_mult = 0.8
		vel_mod = 0.7
	elif not is_on_floor():
		vel_mod = 0.7
		g_mult = 1
	else:
		g_mult = 1
		vel_mod = 1
		vel.y = 0

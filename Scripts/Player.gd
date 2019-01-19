extends KinematicBody2D

const G = 1500
var g_mult = 1
var g_mod = 1
var vel_mod = 1
var vel = Vector2()

func _ready():
	pass

func _process(delta):
	
	move_and_slide(vel*vel_mod,Vector2(0,-1))
	
	if Input.is_action_pressed("ui_right") and vel.x <= 150:
		vel.x += 400*delta
	elif Input.is_action_pressed("ui_left") and vel.x >= -150:
		vel.x += -400*delta
	elif vel.x > 0:
		vel.x -= 400*delta
	elif vel.x < 0:
		vel.x += 400*delta
	
	if not is_on_floor():
		if Input.is_action_pressed("ui_up"):
			g_mult = 0.5
		else:
			g_mult = 1
		
		if vel.y > 0:
			g_mod = 2
		else:
			g_mod = 1
			
		vel.y += G*g_mult*g_mod*delta
		
	elif Input.is_action_just_pressed("ui_up"):
		vel.y = -350
	
	if is_on_ceiling():
		vel.y = 1
	

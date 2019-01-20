extends KinematicBody2D

onready var Axe = preload("res://Prefabs/Axe.tscn")

const G = 1500
var g_mult = 1
var g_mod = 1
var vel_mod = 1
var vel = Vector2()

func _ready():
	pass

func _process(delta):
	
	move_and_slide(vel*vel_mod,Vector2(0,-1))
	
	if Input.is_action_pressed("go_right"):
		vel.x += 400*delta
	elif Input.is_action_pressed("go_left"):
		vel.x += -400*delta
	elif vel.x > 10:
		vel.x -= 400*delta
	elif vel.x < -10:
		vel.x += 400*delta
	else:
		vel.x = 0
	
	vel.x = clamp(vel.x,-100*vel_mod,100*vel_mod)
	
	if not is_on_floor():
		if Input.is_action_pressed("jump"):
			g_mult = 0.5
		else:
			g_mult = 1
		
		if vel.y > 200:
			g_mod = 1.5
		else:
			g_mod = 1
			
		vel.y += G*g_mult*g_mod*delta
		
		$Sprite.animation = "jump"
	elif Input.is_action_just_pressed("jump"):
		vel.y = -350
	else:
		if Input.is_action_pressed("go_right"):
			$Sprite.flip_h = false
			if vel.x < 0:
				$Sprite.animation = "turning"
			else:
				if vel_mod < 1:
					$Sprite.animation = "walking"
				else:
					$Sprite.animation = "run"
			
		elif Input.is_action_pressed("go_left"):
			$Sprite.flip_h = true
			if vel.x > 0:
				$Sprite.animation = "turning"
			else:
				if vel_mod < 1:
					$Sprite.animation = "walking"
				else:
					$Sprite.animation = "run"
		else:
			$Sprite.animation = "default"
		
		if vel.y > 30:
			vel.y = 0
	
	if Input.is_action_pressed("run"):
		vel_mod = 1.2
	else:
		vel_mod = 0.9
	
	if Input.is_action_just_pressed("run"):
		var axe = Axe.instance()
		get_node("..").add_child(axe)
		axe.position = position
		if $Sprite.flip_h:
			axe.dir = - 1
	
	if is_on_ceiling():
		vel.y = 1

	if is_on_ceiling() and get_slide_collision(0).collider.filename == "res://Prefabs/ItemBlock.tscn":
		get_slide_collision(0).collider.hit()
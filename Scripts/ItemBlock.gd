extends StaticBody2D

onready var Block = preload("res://Sprites/Block.png")
export (bool) var is_powerup
var is_item_block = true
var has_item = true

func hit():
	$Sprite.position.y = -4
	if self.has_item:
		print("item_givem")
		self.has_item = false
	
	while $Sprite.position.y < 0:
		yield(get_tree().create_timer(0.01), "timeout")
		$Sprite.position.y += 1
	
	$Sprite.texture = Block
	
	
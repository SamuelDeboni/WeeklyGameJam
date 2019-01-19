extends KinematicBody2D

var dir = 1
var t = 0

func _process(delta):
	t += delta
	move_and_collide(Vector2(delta*300*dir,0))
	if t > 1:
		self.queue_free()
	rotate(20*delta*dir)

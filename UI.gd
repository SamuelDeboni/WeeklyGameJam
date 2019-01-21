extends CanvasLayer

var t = 200

func _process(delta):
	t -= delta
	$Time.text = str(round(t))
	if t <= 0:
		time_is_over()

func time_is_over():
	print("time is over")
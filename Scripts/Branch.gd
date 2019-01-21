extends Node

export (Array, String) var branches
# Since I cant export an array of a custom resource, branches is an array of Strings, where the
# index is the branch condition (as per the table below) and the String is the scene to load,
# going back to the start if it's "".

# DEATH_PIT_0 = 0,
# DEATH_PIT_1 = 1,
# DEATH_PIT_2 = 2,
# DEATH_PIT_3 = 3,
# DEATH_ENEMY = 4,
# DEATH_TIME = 5,

func branch(death_type):
	if branches[death_type] != "":
		get_tree().change_scene(branches[death_type])
	else:
		get_tree().change_scene("res://Level.tscn")

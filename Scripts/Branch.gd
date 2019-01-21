extends Node

enum DeathType {
	DEATH_ENEMY,
	DEATH_PIT_0,
	DEATH_PIT_1,
	DEATH_PIT_2,
	DEATH_PIT_3,
	DEATH_TIME,
}

class BranchCondition:
	var condition
	var scene_to_load
	
	func _init(cond, scene):
		condition = cond
		scene_to_load = scene
	

export (Array, BranchCondition) var branches = []

func branch(death_type):
	if branches.has(death_type):
		get_tree().change_scene(branches[death_type])
	else:
		j# If there are no branches for the death_type, go back to the start
		get_tree().change_scene("res://Level.tscn")

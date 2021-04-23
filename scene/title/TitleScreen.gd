extends Node2D


func _ready():
	pass 

func _process(delta):
	$Red.rotate(deg2rad(1))
	$Yellow.rotate(deg2rad(2))
	$Green.rotate(deg2rad(3))
	$Blue.rotate(deg2rad(4))

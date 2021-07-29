extends Container

func _ready():
	pass 

func _process(delta):
	$animViewportContainer/squaresViewportContainer/squaresViewport/squaresNode/Red.rotate(deg2rad(10*delta))
	$animViewportContainer/squaresViewportContainer/squaresViewport/squaresNode/Yellow.rotate(deg2rad(20*delta))
	$animViewportContainer/squaresViewportContainer/squaresViewport/squaresNode/Green.rotate(deg2rad(30*delta))
	$animViewportContainer/squaresViewportContainer/squaresViewport/squaresNode/Blue.rotate(deg2rad(40*delta))


func _on_PlayButton_pressed():
	get_tree().change_scene("res://scene/game_setup/GameSetupScene.tscn")

extends Container

# Import game grid

var _gameGridCont
var _gameScene
var _boardSize
var size

func _on_3x3Button_pressed():
	Global.boardSize = 3
	_size_of_board(Global.boardSize)

func _on_4x4Button_pressed():
	Global.boardSize = 4
	_size_of_board(Global.boardSize)

func _on_5x5Button_pressed():
	Global.boardSize = 5
	_size_of_board(Global.boardSize)

func _on_6x6Button_pressed():
	Global.boardSize = 6
	_size_of_board(Global.boardSize)

func _on_7x7Button_pressed():
	Global.boardSize = 7
	_size_of_board(Global.boardSize)

func _on_8x8Button_pressed():
	Global.boardSize = 8
	_size_of_board(Global.boardSize)

func _size_of_board(size):
	get_tree().change_scene("res://scene/game/GameScene.tscn")

func _on_backButton_pressed():
	get_tree().change_scene("res://scene/title/TitleScreen.tscn")

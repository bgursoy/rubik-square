extends Container

var _gridRect
var _sep

func _ready():
	self._gridRect = $backgroundContainer/Control/GridContainer.get_rect()
	print(self._gridRect)
	self._sep = ((self._gridRect.size.x - 150)/4)
	print(self._sep)
	$backgroundContainer/Control/GridContainer.add_constant_override("hseparation", self._sep)
	$backgroundContainer/Control/GridContainer.add_constant_override("vseparation", self._sep)
	$backgroundContainer/Control/GridContainer.margin_left = $backgroundContainer/Control/GridContainer.margin_left + self._sep
	$backgroundContainer/Control/GridContainer.margin_right = $backgroundContainer/Control/GridContainer.margin_right - self._sep
	print($backgroundContainer/Control/GridContainer.margin_left)
	print($backgroundContainer/Control/GridContainer.margin_right)

func _on_3x3Button_pressed():
	Global.boardSize = 3
	Global.color_1 = "F2C94C" 
	Global.color_2 = "EB5757" 
	_size_of_board(Global.boardSize)

func _on_4x4Button_pressed():
	Global.boardSize = 4
	Global.color_1 = "EB5757"
	Global.color_2 = "2F80ED" 
	_size_of_board(Global.boardSize)

func _on_5x5Button_pressed():
	Global.boardSize = 5
	Global.color_1 = "2F80ED" 
	Global.color_2 = "219653"
	_size_of_board(Global.boardSize)

func _on_6x6Button_pressed():
	Global.boardSize = 6
	Global.color_1 = "219653"
	Global.color_2 = "9B51E0" 
	_size_of_board(Global.boardSize)

func _on_7x7Button_pressed():
	Global.boardSize = 7
	Global.color_1 = "9B51E0" 
	Global.color_2 = "F2994A" 
	_size_of_board(Global.boardSize)

func _on_8x8Button_pressed():
	Global.boardSize = 8
	Global.color_1 = "F2994A"
	Global.color_2 = "F2C94C"
	_size_of_board(Global.boardSize)

func _size_of_board(size):
	get_tree().change_scene("res://scene/levels/LevelSetupScene.tscn")

func _on_backButton_pressed():
	get_tree().change_scene("res://scene/title/TitleScreen.tscn")

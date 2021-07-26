extends Container

# Import game grid
var GameScene = preload("res://scene/game/GameScene.gd")

var _gameScene

func _ready():
	pass 

func _on_3x3Button_pressed():
	#self._gameScene = GameScene.new(3)
	get_tree().change_scene("res://scene/game/GameScene.tscn")

func _on_4x4Button_pressed():
	self._gameScene = GameScene.new(4)

func _on_5x5Button_pressed():
	self._gameScene = GameScene.new(5)

func _on_6x6Button_pressed():
	self._gameScene = GameScene.new(6)

func _on_7x7Button_pressed():
	self._gameScene = GameScene.new(7)

func _on_8x8Button_pressed():
	self._gameScene = GameScene.new(8)

func _on_backButton_pressed():
	get_tree().change_scene("res://scene/title/TitleScreen.tscn")

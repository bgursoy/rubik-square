extends Container

var LevelBtn = preload("res://Button.gd")
var Grad = preload("res://Gradient.gd")

var _gridRect
var _sep

func _ready():
	var gridContainer = get_node("backgroundContainer/Control/ScrollContainer/GridContainer")
	for level in range(Global.num_level):
		Grad.new(level)
		var levelBtn = LevelBtn.new(level)
		gridContainer.add_child(levelBtn)
	
	self._gridRect = gridContainer.get_rect()
	print(self._gridRect.size.x)
	self._sep = ((self._gridRect.size.x - 150)/4)
	print(self._sep)
	gridContainer.add_constant_override("hseparation", self._sep)
	gridContainer.add_constant_override("vseparation", self._sep)
	print(gridContainer.margin_left)
	print(gridContainer.margin_right)
	gridContainer.margin_left = gridContainer.margin_left + self._sep
	gridContainer.margin_right = gridContainer.margin_right + self._sep
	print(gridContainer.margin_left)
	print(gridContainer.margin_right)


func _on_backButton_pressed():
	Global.lvl_btn_colors = []
	get_tree().change_scene("res://scene/game_setup/GameSetupScene.tscn")

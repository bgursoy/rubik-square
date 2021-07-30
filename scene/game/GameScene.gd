extends Container

# Import game grid
var GameGrid = preload("res://component/game_grid/GameGrid.gd")

var _gameGrid
var _gameGridContainerRect
var _boardSize
var _num_colors
var _gamePanelRowRect
var _gameActionBarContainerRect
var _dataPanelContainerRect
var _hsep 
var _add

# Called when the node enters the scene tree for the first time.
func _ready():
	print("All ready")
	self._boardSize = Global.boardSize
	self._num_colors = Global.num_colors
	print(self._boardSize)
	self._gameGridContainerRect = $VBoxContainer/gameGridContainer.get_rect()
	print(_gameGridContainerRect)
	$VBoxContainer/gameGridContainer.set_custom_minimum_size(Vector2(self._gameGridContainerRect.size.x, self._gameGridContainerRect.size.x))
	self._gameGrid = GameGrid.new(self._gameGridContainerRect.size.x, self._boardSize, self._num_colors)
	$VBoxContainer/gameGridContainer.add_child(self._gameGrid)
	
	self._gamePanelRowRect = $VBoxContainer/gamePanelRow.get_rect()
	self._gameActionBarContainerRect = $VBoxContainer/gameActionbarContainer.get_rect()
	self._dataPanelContainerRect = $VBoxContainer/gamePanelRow/dataPanelContainer.get_rect()
	
	self._hsep = self._gameActionBarContainerRect.size.x - (141 + 78)
	$VBoxContainer/gameActionbarContainer.add_constant_override("hseparation", self._hsep)
	
	self._add = self._gamePanelRowRect.size.x - (176 + 100 + 5)
	$VBoxContainer/gamePanelRow/dataPanelContainer.set_custom_minimum_size(Vector2($VBoxContainer/gamePanelRow/dataPanelContainer.rect_size.x + self._add, 100))
	$VBoxContainer/gamePanelRow/dataPanelContainer/dataColumn.add_constant_override("separation", self._hsep)

func _on_gameGridContainer_gui_input(event):
	if event is InputEventScreenDrag:
		self._gameGrid.on_drag(event)
	elif event is InputEventMouseButton:
		if not event.is_pressed():
			self._gameGrid.on_drag_release(event)

func _on_HelpButton_pressed():
	Global.lvl_btn_colors = []
	get_tree().change_scene("res://scene/title/TitleScreen.tscn")

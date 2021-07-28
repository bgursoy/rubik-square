extends Container

# Import game grid
var GameGrid = preload("res://component/game_grid/GameGrid.gd")
onready var Setup = get_node("/root/GameSetupScene")
onready var BoardSize = get_node("/root/BoardSize")
#var BoardSize = preload("res://component/game_grid/BoardSize.gd")

var _gameGrid
var _gameGridContainerRect
var _boardSize
var _getRect

# Called when the node enters the scene tree for the first time.
func _ready():
	print("All ready")
	#var board = BoardSize.ready()
	self._boardSize = Global.boardSize
	print(self._boardSize)
	self._gameGridContainerRect = $VBoxContainer/gameGridContainer.get_rect()
	print(_gameGridContainerRect)
	$VBoxContainer/gameGridContainer.set_custom_minimum_size(Vector2(self._gameGridContainerRect.size.x, self._gameGridContainerRect.size.x))
	self._gameGrid = GameGrid.new(self._gameGridContainerRect.size.x, self._boardSize, 6)
	$VBoxContainer/gameGridContainer.add_child(self._gameGrid)
	# Replace with function body.

func _on_gameGridContainer_gui_input(event):
	if event is InputEventScreenDrag:
		self._gameGrid.on_drag(event)
	elif event is InputEventMouseButton:
		if not event.is_pressed():
			self._gameGrid.on_drag_release(event)

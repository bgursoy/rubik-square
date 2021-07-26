extends Container

# Import game grid
var GameGrid = preload("res://component/game_grid/GameGrid.gd")

var _gameGrid
var _gameGridContainerRect
var _boardSize
onready var gameGridContainer = get_node("VBoxContainer/gameGridContainer")

func _init(_boardSize):
	self._boardSize = _boardSize

# Called when the node enters the scene tree for the first time.
func _ready():
	self._gameGridContainerRect = gameGridContainer.get_rect()
	#self._gameGridContainerRect = $VBoxContainer/gameGridContainer.get_rect()
	gameGridContainer.set_custom_minimum_size(Vector2(self._gameGridContainerRect.size.x, self._gameGridContainerRect.size.x))
	self._gameGrid = GameGrid.new(self._gameGridContainerRect.size.x, _boardSize, 6)
	gameGridContainer.add_child(self._gameGrid)
	# Replace with function body.

func _on_gameGridContainer_gui_input(event):
	if event is InputEventScreenDrag:
		self._gameGrid.on_drag(event)
	elif event is InputEventMouseButton:
		if not event.is_pressed():
			self._gameGrid.on_drag_release(event)

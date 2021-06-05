extends Container

# Import game grid
var GameGrid = preload("res://component/game_grid/GameGrid.gd")

var _gameGrid

# Called when the node enters the scene tree for the first time.
func _ready():
	var gameGridContainerRect = $VBoxContainer/gameGridContainer.get_rect()
	$VBoxContainer/gameGridContainer.set_custom_minimum_size(Vector2(gameGridContainerRect.size.x, gameGridContainerRect.size.x))
	self._gameGrid = GameGrid.new(gameGridContainerRect.size.x, 4, 6)
	$VBoxContainer/gameGridContainer.add_child(self._gameGrid)
	pass # Replace with function body.

func _on_gameGridContainer_gui_input(event):
	if event is InputEventScreenDrag:
		self._gameGrid.on_drag(event)
	elif event is InputEventMouseButton:
		if not event.is_pressed():
			self._gameGrid.on_drag_release(event)

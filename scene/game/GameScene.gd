extends Container

# Import game grid
var GameGrid = preload("res://component/game_grid/GameGrid.gd")

var _gameGrid

# Called when the node enters the scene tree for the first time.
func _ready():
	var containerViewPort = $gameGridContainer.get_viewport()
	self._gameGrid = GameGrid.new(containerViewPort, 6, 3)
	$gameGridContainer.add_child(self._gameGrid)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

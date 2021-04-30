extends Container

# Import game grid
var GameGrid = preload("res://component/game_grid/GameGrid.gd")

var _gameGrid

# Called when the node enters the scene tree for the first time.
func _ready():
	var gameGridContainerRect = $VBoxContainer/gameGridContainer.get_rect()
	# $VBoxContainer/gameGridContainer.rect_clip_content(true)
	$VBoxContainer/gameGridContainer.set_custom_minimum_size(Vector2(gameGridContainerRect.size.x, gameGridContainerRect.size.x))
	self._gameGrid = GameGrid.new(gameGridContainerRect.size.x, 8, 6)
	$VBoxContainer/gameGridContainer.add_child(self._gameGrid)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_gameGridContainer_mouse_entered():
	self._gameGrid.on_drag()


func _on_gameGridContainer_resized():
	print($VBoxContainer/gameGridContainer.get_rect())

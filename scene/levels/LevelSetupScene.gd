extends Container

var LevelBtn = preload("res://Button.gd")

var _gridRect
var _sep

func _ready():
	var level = 0
	for row in range(12):
		level += 1
		var levelBtn = LevelBtn.new(level)
		$backgroundContainer/Control/GridContainer.add_child(levelBtn)
	
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

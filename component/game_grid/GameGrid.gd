extends ReferenceRect

const SQUARE_SIZE = 6
const SCALE = 0.5
var RubikCell = preload("res://component/rubik_cell/RubikCell.gd")

func _init():
	pass

func _ready():
	# Add squares to the scene
	for row in range(SQUARE_SIZE):
		for col in range(SQUARE_SIZE):
			var colorCode = randi() % 6
			var squareSprite = RubikCell.new(colorCode)
			var positionX = SCALE * (75 + col*150)
			var positionY = SCALE * (75 + row*150)
			squareSprite.set_scale(Vector2(SCALE, SCALE))
			squareSprite.position = Vector2(positionX, positionY)
			self.add_child(squareSprite)

func _input(event):
	if event is InputEventScreenDrag:
		print(event.as_text())

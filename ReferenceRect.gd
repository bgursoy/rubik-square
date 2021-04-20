extends ReferenceRect

const SQUARE_SIZE = 6
const SCALE = 3
var RubikCell = preload("res://RubikCell.gd")
var texture = preload("res://assets/blue.png")


func _ready():
	# Add squares to the scene
	for row in range(SQUARE_SIZE):
		for col in range(SQUARE_SIZE):
			var colorCode = randi() % 6
			var squareSprite = RubikCell.new(colorCode)
			var positionX = SCALE * (8 + col*16)
			var positionY = SCALE * (8 + row*16)
			squareSprite.set_scale(Vector2(SCALE, SCALE))
			squareSprite.position = Vector2(positionX, positionY)
			self.add_child(squareSprite)

func _input(event):
	if event is InputEventScreenDrag:
		print(event.as_text())

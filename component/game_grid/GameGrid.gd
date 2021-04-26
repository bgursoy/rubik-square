extends ReferenceRect

const SQUARE_SIZE = 6
const SCALE = 0.333
var RubikCell = preload("res://component/rubik_cell/RubikCell.gd")

var square_width = 0
var num_colors = 0

func _init(viewport, square_width, num_colors):
	print("Game board initiated")
	self.square_width = square_width
	self.num_colors = num_colors
	
	# Calculate scale according to the available space
	# Prefer the smaller dimension
	var dim_x = viewport;
	print(dim_x)

func _ready():
	print("Game board ready")
	# Add squares to the scene
	for row in range(self.square_width):
		for col in range(self.square_width):
			var colorCode = randi() % self.num_colors
			var squareSprite = RubikCell.new(colorCode)
			var positionX = SCALE * (75 + col*150)
			var positionY = SCALE * (75 + row*150)
			squareSprite.set_scale(Vector2(SCALE, SCALE))
			squareSprite.position = Vector2(positionX, positionY)
			self.add_child(squareSprite)

# Touch drag event listener
func _input(event):
	if event is InputEventScreenDrag:
		print(event.as_text())


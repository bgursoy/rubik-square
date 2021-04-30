extends ReferenceRect
const CELL_SPRITE_WIDTH = 150
const SQUARE_SIZE = 6
const SCALE = 0.30
var RubikCell = preload("res://component/rubik_cell/RubikCell.gd")

var square_width = 0
var num_colors = 0
var cell_scale = 1.0
var rubic_cell_map = [] 

func _init(dim_x, square_width, num_colors):
	print("Game board initiated")
	self.square_width = square_width
	self.num_colors = num_colors
	
	# Calculate scale, fit to screen automatically
	self.cell_scale = dim_x / (CELL_SPRITE_WIDTH * square_width)
	print("Render game grid into " + str(dim_x) + " pixels.")
	print("Scale computed for game grid: " + str(self.cell_scale) )

func _ready():
	print("Game board ready")
	# Add squares to the scene
	for row in range(self.square_width):
		var rubic_cell_row = []
		for col in range(self.square_width):
			var colorCode = randi() % self.num_colors
			var squareSprite = RubikCell.new(colorCode)
			var positionX = self.cell_scale * (75 + col*150)
			var positionY = self.cell_scale * (75 + row*150)
			squareSprite.set_scale(Vector2(self.cell_scale, self.cell_scale))
			squareSprite.position = Vector2(positionX, positionY)
			self.add_child(squareSprite)
			rubic_cell_row.append(squareSprite)
		rubic_cell_map.append(rubic_cell_row)

# Touch drag event listener
#func _input(event):
#	if event is InputEventScreenDrag:
#		print(event.as_text())
		

func detect_col_row():
	pass

func on_drag():
	print("Drag")

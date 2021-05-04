extends ReferenceRect
const CELL_SPRITE_WIDTH = 150
const SQUARE_SIZE = 6
const SCALE = 0.30
var RubikCell = preload("res://component/rubik_cell/RubikCell.gd")

var square_width 
var num_colors 
var cell_scale = 1.0
var rubic_cell_map = [] 

func _init(dim, square_width, num_colors):
	print("Game board initiated")
	self.square_width = square_width
	self.num_colors = num_colors
	
	# Calculate scale, fit to screen automatically
	self.cell_scale = dim / (CELL_SPRITE_WIDTH * square_width)
	print("Render game grid into " + str(dim) + " pixels.")
	print("Scale computed for game grid: " + str(self.cell_scale) )

func _ready():
	print("Game board ready")
	# Add squares to the scene
	for row in range(self.square_width):
		var rubic_cell_row = []
		for col in range(self.square_width):
			var colorCode = randi() % self.num_colors
			var squareSprite = RubikCell.new(colorCode)
			var positionX = self.cell_scale * (75 + col*CELL_SPRITE_WIDTH)
			var positionY = self.cell_scale * (75 + row*CELL_SPRITE_WIDTH)
			squareSprite.set_scale(Vector2(self.cell_scale, self.cell_scale))
			squareSprite.position = Vector2(positionX, positionY)
			self.add_child(squareSprite)
			rubic_cell_row.append(squareSprite)
		rubic_cell_map.append(rubic_cell_row)

func detect_col_row(position):
	var pos = position
	var row = int(pos.y / (self.cell_scale * self.CELL_SPRITE_WIDTH))
	if row < 0:
		row = 0
	if row > self.square_width - 1:
		row = self.square_width - 1 
	var col = int(pos.x / (self.cell_scale * self.CELL_SPRITE_WIDTH))
	if col < 0:
		col = 0
	if col > self.square_width - 1:
		col = self.square_width - 1
	return Vector2(row, col)
	

func on_drag(event):
	print(event.as_text())
	var relative = event.get_relative()
	var position = event.get_position()
	var target = detect_col_row(position)
	slide_row(target.x, relative.x)

func slide_row(row, del_x):
	var target_row = self.rubic_cell_map[row]
	
	for cell in target_row:
		cell.position.x += del_x 

extends ReferenceRect
const CELL_SPRITE_WIDTH = 150
const SQUARE_SIZE = 6
const SCALE = 0.30
var RubikCell = preload("res://component/rubik_cell/RubikCell.gd")

var reference_dim
var square_width 
var num_colors 
var cell_scale = 1.0
var rubic_cell_map = [] 

# Event tracking variables
var touch_event_direction;
var touch_event_index = -1
var touch_event_target = null

func _init(dim, square_width, num_colors):
	print("Game board initiated")
	self.square_width = square_width
	self.num_colors = num_colors
	self.reference_dim = dim
	
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
	# Check if its a new touch event, dont recompute target col row
	if self.touch_event_index != event.get_index():
		print("New drag event: " + event.as_text())
		# New touch, update target row and last event index
		self.touch_event_index = event.get_index();
		var position = event.get_position()
		self.touch_event_target = detect_col_row(position)
		
	var relative = event.get_relative()
	
	if relative.x > 0:
		self.touch_event_direction = "right"
	else:
		self.touch_event_direction = "left"
	
	slide_row(event, self.touch_event_target.x, relative.x)
	
func on_drag_release(event):
	# When user releases the drag event, rebalance gameboard
	print("User release dragging:" + event.as_text())
	
	# Horizontal, balance row
	var row = self.touch_event_target.x
	var target_row = self.rubic_cell_map[row]
	
	# Calculate grid misplacement according to the first element
	var one_cell_width = self.cell_scale * self.CELL_SPRITE_WIDTH
	var cell_center = one_cell_width / 2
	
	var target_position =  target_row[0].position.x
	var pivot_position = target_position - cell_center
	
	var pivot_element_off_screen = target_row[0].position.x - cell_center
	print(pivot_element_off_screen)
	
	var difference = 0
	if self.touch_event_direction == "left" || len(target_row) == self.square_width:
		difference = pivot_element_off_screen
	elif self.touch_event_direction == "right" && len(target_row) > self.square_width:
		difference = pivot_element_off_screen + one_cell_width
		
	print("Misplacement: " + str(difference))
	
	if abs(difference) < cell_center:
		# Not misplaced more than half of the distance. Return to the initial position
		self.slide_row(event, row, -1 * difference);
		print("Move: " + str(-1 * difference))
		pass
	else:
		# Calculate del_x
		var del_x = (0)
		if difference < 0: del_x = (one_cell_width - abs(difference)) * -1
		else: del_x = one_cell_width - difference
		self.slide_row(event, row, del_x)
		print("Mpve: " + str(del_x))
		pass
		
	self.touch_event_index = -1
	self.touch_event_target = null
	self.touch_event_direction = null
	pass

func slide_row(event, row, del_x):
	var target_row = self.rubic_cell_map[row]
	
	for cell in target_row:
		cell.position.x += del_x 
	
	# Calculate cell positions for drawing clone cells
	var one_cell_width = self.cell_scale * self.CELL_SPRITE_WIDTH
	var one_cell_shift = one_cell_width / 2
	
	if del_x < 0:
		# Sliding to left, calculate the pixels outside the left edge
		var pivot_element_off_screen = target_row[0].position.x - one_cell_shift
		
		if (pivot_element_off_screen < 0 && len(target_row) == self.square_width):
			# The pivot element is out of ref rect. Create a clone at tail
			var cloneCell = RubikCell.new(target_row[0].get_color())
			cloneCell.position = target_row[-1].position
			cloneCell.position.x += one_cell_width
			cloneCell.set_scale(target_row[0].get_scale())
			# Add to scene
			self.add_child(cloneCell)
			target_row.append(cloneCell)
		
		elif abs(pivot_element_off_screen) >= one_cell_width && len(target_row) > self.square_width:
			var cell_to_remove = target_row[0]
			self.remove_child(cell_to_remove)
			target_row.remove(0)
	else:
		# Sliding to right, calculate the pixels outside right edge
		var last_element_off_screen = (target_row[-1].position.x + one_cell_shift) - self.reference_dim
		
		if last_element_off_screen > 0 && len(target_row) == self.square_width:
			# The last element is out of the boundaries of reference rect. Create a clone at beginning.
			var clone_cell = RubikCell.new(target_row[-1].get_color())
			clone_cell.position = target_row[0].position
			clone_cell.position.x -= one_cell_width
			clone_cell.set_scale(target_row[0].get_scale())
			# Add to scene
			self.add_child(clone_cell)
			target_row.push_front(clone_cell)
			
		elif last_element_off_screen >= one_cell_width && len(target_row) > self.square_width:
			var cell_to_remove = target_row[-1]
			self.remove_child(cell_to_remove)
			target_row.remove(len(target_row)-1)
			
func slide_col(event, col, del_y):
	pass


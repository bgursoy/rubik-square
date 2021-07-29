extends Button

var level
var new_stylebox_normal

func _init(level):
	self.level = level
	self.rect_min_size.x = 50
	self.rect_min_size.y = 50
	self.text = str(Global.boardSize) + "." + str(self.level)
	#self.new_stylebox_normal = self.get_stylebox("normal").duplicate()
	#self.new_stylebox_normal.set_border_width_all(3)
	#self.new_stylebox_normal.border_color = Color(0, 1, 0.5)
	#self.add_stylebox_override("normal", new_stylebox_normal)


func _ready():
	pass

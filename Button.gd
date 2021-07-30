extends Button

var new_stylebox_normal = preload("res://assets/style/btn_blue.tres")
var new_stylebox_hover = preload("res://assets/style/btn_blue.tres")

var new_font = preload("res://assets/style/title.tres")
var color = Color(1, 1, 1, 1)

func _init(level):
	self.rect_min_size.x = 50
	self.rect_min_size.y = 50
	self.text = str(Global.boardSize) + "." + str(level)
	self.name = self.text
	
	self.add_font_override("font", new_font)
	
	self.add_color_override("font_color", color)
	self.add_color_override("font_color_hover", color)
	self.add_color_override("font_color_pressed", color)
	
	self.add_stylebox_override("normal", new_stylebox_normal)
	self.new_stylebox_normal = self.get_stylebox("normal").duplicate()
	self.new_stylebox_normal.bg_color = Global.lvl_btn_colors[level-1]
	self.add_stylebox_override("normal", new_stylebox_normal)
	
	self.add_stylebox_override("hover", new_stylebox_hover)
	self.new_stylebox_hover = self.get_stylebox("hover").duplicate()
	self.new_stylebox_hover.set_expand_margin_all(6)
	self.new_stylebox_hover.bg_color = Global.lvl_btn_colors[level-1]
	self.add_stylebox_override("hover", new_stylebox_hover)
	
	self.add_stylebox_override("pressed", new_stylebox_normal)
	self.add_stylebox_override("pressed", new_stylebox_normal)

func _pressed():
	get_tree().change_scene("res://scene/game/GameScene.tscn")

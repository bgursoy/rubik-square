extends Gradient

var _color
var offset = 0.0

func _init(point):
	self.set_color(0, Global.color_1)
	self.set_color(1, Global.color_2)
	
	self.offset = float(point)/Global.num_level
	Global.lvl_btn_colors.append(self.interpolate(self.offset))

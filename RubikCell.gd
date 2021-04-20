extends Sprite

var color

func _init(color):
	self.color = color
	if color == 0:
		self.texture = preload("res://assets/blue.png")
	elif color == 1:
		self.texture = preload("res://assets/green.png")
	elif color == 2:
		self.texture = preload("res://assets/orange.png")
	elif color == 3:
		self.texture = preload("res://assets/red.png")
	elif color == 4:
		self.texture = preload("res://assets/white.png")
	else:
		self.texture = preload("res://assets/yellow.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#func _process(delta):
#	pass

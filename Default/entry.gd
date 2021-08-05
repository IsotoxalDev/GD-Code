extends Entry


func _ready():
	self.buttons = {
		"Help": "help"
	}
	var time = Time.new()
	time.set_font_size(30)
	add_child(time)


func help():
	print("HELP")

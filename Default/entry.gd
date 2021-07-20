extends Entry


func _begin():
	self.buttons = {
		"Help": "help"
	}
	var time = Time.new()
	time.get_theme().default_font.size = 30
	add_child(time)


func help():
	print("HELP")

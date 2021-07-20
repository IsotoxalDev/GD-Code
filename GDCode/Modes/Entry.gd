extends Control

class_name Entry


var title = """
  ▄████ ▓█████▄        ▄████▄   ▒█████  ▓█████▄ ▓█████ 
 ██▒ ▀█▒▒██▀ ██▌      ▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀ 
▒██░▄▄▄░░██   █▌      ▒▓█    ▄ ▒██░  ██▒░██   █▌▒███   
░▓█  ██▓░▓█▄   ▌      ▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄ 
░▒▓███▀▒░▒████▓       ▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒
 ░▒   ▒  ▒▒▓  ▒       ░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░
  ░   ░  ░ ▒  ▒         ░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░
░ ░   ░  ░ ░  ░       ░        ░ ░ ░ ▒   ░ ░  ░    ░   
░     ░    ░          ░ ░          ░ ░     ░       ░  ░
░        ░            ░                  ░             
"""

var buttons = {}


func _init():
	var center = UI.Center.new()
	var vbox = VBoxContainer.new()
	center.add_child(vbox)
	vbox.add_child(UI.Text.new(title))
	if self.has_method("_begin"):
		self.call("_begin")
	for i in buttons.keys():
		vbox.add_child(UI.TextBtn.new(i, funcref(self, buttons[i])))
	add_child(center)

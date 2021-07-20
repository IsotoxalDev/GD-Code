extends Control


func _fill_rect(node: Control):
	node.set_anchor(MARGIN_BOTTOM, 1)
	node.set_anchor(MARGIN_RIGHT, 1)
	node.set_margin(MARGIN_BOTTOM, 0)
	node.set_margin(MARGIN_RIGHT, 0)


class Center extends CenterContainer:
	func _init():
		UI._fill_rect(self)


class Text extends Label:
	func _init(text: String = ""):
		self.text = text
		self.set_theme(Theme.new())
		self.get_theme().default_font = DynamicFont.new()
		self.get_theme().default_font.font_data = Data.font_data

class TextBtn extends Button:
	func _init(text: String = "", fn: FuncRef = FuncRef.new()):
		self.text = text
		self.flat = true
		self.focus_mode = Control.FOCUS_NONE
		self.set_theme(Theme.new())
		self.get_theme().default_font = DynamicFont.new()
		self.get_theme().default_font.font_data = Data.font_data
		if fn.is_valid():
			var _n = connect("pressed", self, "sig", [fn])
	
	func sig(fn):
		fn.call_func()

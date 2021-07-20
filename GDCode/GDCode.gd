extends Control


class_name GDCode


#enums
enum Mode {ENTRY, TEXT, SCRIPT}


# Variables
var args = Array(OS.get_cmdline_args())
var config_path: String
var files = []
var flags = []
var gdc_theme: GDC_Theme

# Mode vars
var mode = Mode.TEXT setget set_mode
var modes = {
	"entry": "res://GDCode/Entry.gd"
}


func _load_config():
	var file = File.new()
	config_path = OS.get_user_data_dir()+"/config.gd"
	if !file.file_exists(config_path):
		config_path = "res://Default/config.gd"
	var config: Script = load(config_path)
	self.set_script(config)
	self.call("_begin")


func _parse_args():
	args.pop_front()
	for i in args:
		if i.begins_with('-'):
			flags.append(i)
			continue
		files.append(i)
	if files == []:
		set_mode(Mode.ENTRY)


func _base():
	set_font("Font.ttf")


func _ready():
	_base()
	_load_config()
	_parse_args()


func _add(path: String):
	var script = load(to_abs(path))
	var new_entry = Control.new()
	new_entry.set_script(script)
	UI._fill_rect(new_entry)
	add_child(new_entry)


#customization functions
func set_gdc_theme(path: String):
	gdc_theme = load(to_abs(path))
	VisualServer.set_default_clear_color(gdc_theme.background)
	self.get_theme().set_color("font_color", "Label", gdc_theme.font_color)
	self.get_theme().set_color("font_color", "Button", gdc_theme.font_color)
	self.get_theme().set_color("font_color_hover", "Button",
		gdc_theme.font_color.darkened(0.3))
	pass


func set_font(font_path: String):
	var theme = self.get_theme()
	var font = DynamicFont.new()
	font.font_data = load(font_path)
	Data.font_data = font.font_data
	theme.default_font = font


func set_font_size(size: int):
	var theme = self.get_theme()
	theme.default_font.size = size


func set_mode(val):
	mode = val
	match val:
		Mode.ENTRY:
			_add(modes.entry)


# Change relative to absolute
func to_abs(path: String):
	if path.is_rel_path():
		var file = File.new()
		var p = OS.get_user_data_dir()+"/"
		if !file.file_exists(p):
			p = "res://Default/"
		return p+path
	return path

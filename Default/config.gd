extends GDCode


func _config():
	set_gdc_theme("default.tres")
	set_font("/usr/share/fonts/TTF/mononoki-Regular Nerd Font Complete.ttf")
	set_font_size(18)


func _begin():
	_config()
	modes.entry = "entry.gd"
	pass

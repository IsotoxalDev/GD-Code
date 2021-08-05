extends Control

class_name TextInp

var parent: GDCode

func _ready():
	var edit = TextEdit.new()
	UI._fill_rect(edit)
	var f = File.new()
	var file = parent.files[0]
	if f.file_exists(file):
		f.open(file, File.READ)
		edit.text = f.get_as_text()
	add_child(edit)
	pass

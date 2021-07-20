class_name Time extends UI.Text


func _process(_delta):
	var t = OS.get_datetime()
	t.hour = t.hour if t.hour<12 else t.hour-12
	t.hour = '0'+str(t.hour) if t.hour < 9 else t.hour
	t.minute = '0'+str(t.minute) if t.minute < 9 else t.minute
	var text = str(t.hour) + ':' + str(t.minute)
	self.text = text


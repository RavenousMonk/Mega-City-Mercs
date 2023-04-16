extends Label

var time = 43200
var timer_on = true

func _process(delta):
	if(timer_on):
		time += delta * 60
		
	var mins = fmod(time, 60*60) / 60
	var hr = fmod(fmod(time,3600 * 24) / 3600,24)
	@warning_ignore("unused_variable")
	var dy = fmod(time,12960000) / 86400
	
	var time_passed = "%02d : %02d" % [hr,mins]
	text = time_passed # + " : " + var2str(time)
	
	pass

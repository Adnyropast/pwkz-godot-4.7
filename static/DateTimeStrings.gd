extends Node

class_name DateTimeStrings

static func get_current_date_time() -> String:
	var dictionary: Dictionary = Time.get_datetime_dict_from_system()
	var year: String = str(dictionary.get("year"))
	var month: String = str(dictionary.get("month")).pad_zeros(2)
	var day: String = str(dictionary.get("day")).pad_zeros(2)
	var hour: String = str(dictionary.get("hour")).pad_zeros(2)
	var minute: String = str(dictionary.get("minute")).pad_zeros(2)
	var second: String = str(dictionary.get("second")).pad_zeros(2)
	return month + "/" + day + "/" + year + " " + hour + ":" + minute + ":" + second

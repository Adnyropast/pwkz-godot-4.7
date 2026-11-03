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

static func time_ms_to_time_string(time_ms: int) -> String:
	var seconds: int = floori(time_ms / 1000.0) % 60
	var minutes: int = floori(time_ms / 60000.0) % 60
	var hours: int = floori(time_ms / 3600000.0)
	var hours_str: String = str(hours).pad_zeros(3)
	var minutes_str: String = str(minutes).pad_zeros(2)
	var seconds_str: String = str(seconds).pad_zeros(2)
	return hours_str + ":" + minutes_str + ":" + seconds_str

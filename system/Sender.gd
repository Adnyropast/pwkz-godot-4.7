extends Node

class_name Sender

signal message_sent
signal timed_message_sent

func send(message: String, callback_callable: Callable) -> void:
	message_sent.emit(message, callback_callable)

func send_timed(message: String, callback_callable: Callable, timeout: float = 2.0) -> void:
	timed_message_sent.emit(message, callback_callable, timeout)

extends Node2D

const action = {
	'up': {
		'degree': 0,
		'input': 'ui_up',
		'text': '^'
	},
	
	'down': {
		'degree': 180,
		'input': 'ui_down',
		'text': '^'
	},
	
	'left': {
		'degree': -90,
		'input': 'ui_left',
		'text': '^'
	},
	
	'right': {
		'degree': 90,
		'input': 'ui_right',
		'text': '^'
	}
}

signal action_taken

export(String, 'up', 'down', 'left', 'right') var tag = 'left'

func set_button_tags():
	self.set_rotation_degrees(action[tag].degree)
	$button_icon.set_text(action[tag].text)

func _ready():
	set_button_tags()

func _input(event):
	if Input.is_action_just_pressed(action[tag].input):
		emit_signal('action_taken')
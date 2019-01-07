extends Node

var location = 0
var track_speed = .005
var is_ready = false
var score = 0
onready var trailer = find_node('trailer')
onready var score_label = find_node('score_label')
onready var action_buttons = get_tree().get_nodes_in_group('action_buttons')

func _ready():
	score_label.text = String(score)
	for action_button in action_buttons:
		action_button.connect('action_taken', self, 'on_action_button_pressed', [action_button.tag])
		action_button.connect('action_ready', self, 'on_action_button_ready')
		action_button.connect('action_over', self, 'on_action_button_over')

func _process(delta):
	trailer.set_unit_offset(location)
	location += track_speed

func on_action_button_pressed(tag):
	if is_ready:
			score += 1
			is_ready = false
	else:
		print('fail')
		
	score_label.text = String(score)

func on_action_button_ready():
	is_ready = true

func on_action_button_over():
	is_ready = false

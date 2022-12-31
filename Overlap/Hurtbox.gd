extends Area2D

const HitEffect = preload("res://Effects/HitEffect.tscn")

var invincible = false setget set_invincible

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")

onready var timer = $Timer

signal invincibility_started
signal invincibility_ended

func start_invicibility(duration):
	self.invincible = true # Using self calls setter
	timer.start(duration)

func end_invinicibility():
	self.invincible = false

func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position

func _on_Timer_timeout():
	end_invinicibility()

func _on_Hurtbox_invincibility_started():
	set_deferred("monitoring", false)

func _on_Hurtbox_invincibility_ended():
	set_deferred("monitoring", true)


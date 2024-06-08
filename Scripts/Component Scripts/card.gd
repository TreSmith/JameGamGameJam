class_name Card
extends Control

signal reparent_requested(which_card_ui: Card)

@onready var color: ColorRect = $Color
@onready var state: Label = $State

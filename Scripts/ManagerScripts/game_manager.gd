extends Node

const STARTING_FORTITUDE : int = 100
const STARTING_BAC : int = 0
const BASE_ENERGY : int = 3
const DEFAULT_HANDSIZE : int = 5
const DEFAULT_ENERGY : int = 3
const DEFAULT_RETAIN : int = 0


var Current_Fortitude = STARTING_FORTITUDE
var Current_BAC = STARTING_BAC
var Current_Energy = BASE_ENERGY
var Current_Notoriety = 0
var Handsize = DEFAULT_HANDSIZE
var Energy = DEFAULT_ENERGY
var Retain = DEFAULT_ENERGY
const STARTING_MONEY : int = 10


var Current_Money
var Current_Deck

var card_json_data_path = "res://Data/card_data.json"
var Card_Data_List

func _ready():
	resetToDefaults()
	read_json_card_data()

func resetToDefaults():
	Current_Fortitude = STARTING_FORTITUDE
	Current_BAC = STARTING_BAC
	Current_Energy = BASE_ENERGY
	Current_Notoriety = 0
	Handsize = DEFAULT_HANDSIZE
	Current_Money = STARTING_MONEY
	
func resetLevel():
	Current_Fortitude = STARTING_FORTITUDE
	Current_BAC = STARTING_BAC
	Current_Energy = BASE_ENERGY
	Handsize = DEFAULT_HANDSIZE


func read_json_card_data():
	var json_parser = JSON.new()
	
	if FileAccess.file_exists(card_json_data_path):
		var file = FileAccess.open(card_json_data_path, FileAccess.READ).get_as_text()
		var result = json_parser.parse(file)
		
		if result == OK:
			Card_Data_List = json_parser.data
		else:
			print("Failed to parse JSON: " + str(result))
	else:
		print("No json data file exists at: " + card_json_data_path)
	
func get_card_by_id(id: int):
	var card_data = {}
	
	for card in Card_Data_List:
		if(card["ID"] == id):
			card_data = card
			break
	
	return card_data

func get_random_card():
	pass

func build_starting_deck():
	pass

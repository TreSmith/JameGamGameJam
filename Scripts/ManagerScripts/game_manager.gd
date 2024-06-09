extends Node

const STARTING_FORTITUDE : int = 100
const STARTING_BAC : int = 0
const BASE_ENERGY : int = 3
const DEFAULT_HANDSIZE : int = 5
const DEFAULT_ENERGY : int = 3
const DEFAULT_RETAIN : int = 0
const STARTING_DECK_SIZE : int = 10
const STARTING_MONEY : int = 10
const DEFAULT_BONUS : int = 0

var Current_Fortitude = STARTING_FORTITUDE
var Current_BAC = STARTING_BAC
var Current_Energy = BASE_ENERGY
var Current_Notoriety = 0
var Handsize = DEFAULT_HANDSIZE
var Energy = DEFAULT_ENERGY
var Retain = DEFAULT_RETAIN
var Current_Bonus = DEFAULT_BONUS

var Current_Money
var Current_Deck = []
var Discard_Pile = []
var Remaining_Deck = []

var card_json_data_path = "res://Data/card_data.json"
var Card_Data_List

func _ready():
	read_json_card_data()
	reset_data_to_start()
	build_starting_deck()

func resetToDefaults():
	Current_Fortitude = STARTING_FORTITUDE
	Current_BAC = STARTING_BAC
	Current_Energy = BASE_ENERGY
	Current_Bonus = DEFAULT_BONUS
	Current_Notoriety = 0
	Handsize = DEFAULT_HANDSIZE

func reset_data_to_start():
	resetToDefaults()
	Current_Money = STARTING_MONEY
	Current_Deck = []
	Discard_Pile = []
	Remaining_Deck = []
	build_starting_deck()

func resetLevel():
	Current_Fortitude = STARTING_FORTITUDE
	Current_BAC = STARTING_BAC
	Current_Energy = BASE_ENERGY
	Current_Bonus = DEFAULT_BONUS
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

func get_random_card_from_pool(amount : int = 1):
	var rng = RandomNumberGenerator.new()
	var total_cards = Card_Data_List.size() - 1
	var index = rng.randi_range(0, total_cards)
	return Card_Data_List[index]

func build_starting_deck():
	Current_Deck = []
	for card in Card_Data_List:
		if(Current_Deck.size() == STARTING_DECK_SIZE):
			break
		elif(card["Name"] == "Beer"):
			for i in range(7):
				Current_Deck.append(card)
		elif(card["Name"] == "Wine"):
			for i in range(2):
				Current_Deck.append(card)
		elif(card["Name"] == "Coffee"):
			Current_Deck.append(card)
	Remaining_Deck = Current_Deck.duplicate(true)
	Remaining_Deck.shuffle()

func reshuffle_discard_into_deck():
	Remaining_Deck = Discard_Pile.duplicate(true)
	Remaining_Deck.shuffle()
	Discard_Pile = []

func draw_card(amount : int = 1):
	var cardsToDraw = []
	for i in range(amount):	
		if Remaining_Deck.size() > 0:
			cardsToDraw.append(Remaining_Deck.pop_front())
		else:
			reshuffle_discard_into_deck()
			cardsToDraw.append(Remaining_Deck.pop_front())
	return cardsToDraw

func discard_card(id: int):
	Discard_Pile.append(get_card_by_id(id))

func add_card_to_deck(id: int):
	for card in Card_Data_List:
		if(id == card["ID"]):
			Current_Deck.append(card)
			Remaining_Deck.append(card)
			Remaining_Deck.shuffle()
			break

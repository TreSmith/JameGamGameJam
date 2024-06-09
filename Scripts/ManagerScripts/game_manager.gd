extends Node

const STARTING_FORTITUDE : int = 100
const STARTING_BAC : int = 0
const BASE_ENERGY : int = 3
const DEFAULT_HANDSIZE : int = 5
const STARTING_MONEY : int = 10

var deck = []

var Current_Fortitude
var Current_BAC
var Current_Energy
var Current_Notoriety
var Handsize
var Current_Money

func _ready():
	resetToDefaults()

func resetToDefaults():
	Current_Fortitude = STARTING_FORTITUDE
	Current_BAC = STARTING_BAC
	Current_Energy = BASE_ENERGY
	Current_Notoriety = 0
	Handsize = DEFAULT_HANDSIZE
	Current_Money = STARTING_MONEY

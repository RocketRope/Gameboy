NAME := game

SRC_DIR := src
OBJ_DIR := obj

all : $(SRC_DIR)/main.z80

	rgbasm.exe  -o $(OBJ_DIR)/main.obj -i $(SRC_DIR)/  $^
	rgblink.exe -m $(NAME).map -n $(NAME).sym -o $(NAME).gb $(OBJ_DIR)/main.obj
	rgbfix.exe  -p0 -v $(NAME).gb

	bgb.exe -v -rom $(NAME).gb

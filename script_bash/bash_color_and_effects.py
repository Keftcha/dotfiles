#!/usr/bin/env python3

import os

with open("test_file_for_bash_color_and_effects.txt", "w") as file:

    color = "\\033[", "m"
    neutre = "\\033[00m"

    for idx in range(10):
        # effects
        c = color[0] + str(idx) + color[1]
        phrase = "This is a " + c + "simple word " + neutre + "with effect."
        file.write(phrase)
        file.write("\n")

    file.write("\n")

    for idx in range(10):
        # color
        c = color[0] + "3" + str(idx) + color[1]
        phrase = "This is a " + c + "simple word " + neutre + "with colors."
        file.write(phrase)
        file.write("\n")

    file.write("\n")

    for idx in range(10):
        # highlight
        c = color[0] + "4" + str(idx) + color[1]
        phrase = "This is a " + c + "simple word " + neutre + "highlighted."
        file.write(phrase)
        file.write("\n")

    file.write("\n")

    for idx in range(10):
        # light colors
        c = color[0] + "9" + str(idx) + color[1]
        phrase = "This is a " + c + "simple word " + neutre + "with light colors."
        file.write(phrase)
        file.write("\n")

    file.write("\n")

    c = "\\033[21m"
    file.write("This is the " + c + "double underline" + neutre +".")

    file.write("\n")

    c0 = "\\033[1;3;5;7;9;32;45m"
    c1 = "\\033[1;3;4;7;33;44m"
    c2 = "\\033[3;1;7;4;33;44m"
    file.write("You can " + c0 + "combine them" + neutre + " but be carefull, " + c1 + "is the same" + neutre + " as " + c2 + "this one," + neutre + " okey ?")

    file.write("\n")

    c0 = "\\033[32;35m"
    c1 = "\\033[35;32m"
    file.write("But for the " + c0 + "color," + neutre + " it's the last " + c1 + "color" + neutre + " which is applied.")

os.system("IFS=\"\n\"; for line in $(cat test_file_for_bash_color_and_effects.txt); do echo $line; done")
os.system("rm test_file_for_bash_color_and_effects.txt")

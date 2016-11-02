#!/usr/bin/python

# Assertions-based Coverage tool : find coverage and coverage percentage using assertions
# Tool version 1.0
# Code start from here

import os
from Tkinter import *
root = Tk()
root.title(" Assertions-based Coverage tool V 1.0")

# to take arguments from entry boxes
ass_path_in = StringVar()  
transcript_path_in = StringVar()

# Dimensions of percentage boxes
rect_width = 120  # 120
rect_hight = 25   # rect_hight - top_padding = real rect hight 
top_padding = 10    # 10
right_paddig = 30   # 20
right_badding_rect = 410  # 300
step = 0


#=====================================================================
# Function called when the button is pressed 
#=====================================================================
def callback():    
	ass_path = ass_path_in.get()
	trans_path = transcript_path_in.get()
	print (ass_path)    # for debugging 
	print(trans_path)   # for debugging 
	num = 0

	# Calling the core code python Tool_Core.py
	# The Core tool takes two arguments, Argument one is the path of assertion file
    # and argument two is the path of transcript file (output of assertions)
	os.system ("python Tool_Core.py" + " " + ass_path + " " + trans_path)

	# Count Number of lines in the file to determine the scrollbar area
	num_lines = sum(1 for line in open('Output_File.txt'))  
	scroll_space = top_padding*4 + num_lines*(rect_hight)

	C.pack(padx=0,pady=0)       # C is the canvas object >> look bellow
	C.config(scrollregion=[0,0, cw, scroll_space]) 

	# Vertical Scrollbar
	vbar=Scrollbar(root, orient=VERTICAL)
	vbar.pack(side=RIGHT, fill=Y)
	vbar.config(command=C.yview)
	C.pack( side = LEFT, fill = BOTH )
	C.config(yscrollcommand=vbar.set)

	# Read from Output_File.txt, then pass info to GUI
	with open("Output_File.txt") as searchfile:
		for line in searchfile:
			if line == "\n": continue
			num = num +1
			step = num*25
			left,sep,right = line.partition(':')
			if sep:
				percentage = right[0:6]
				Name = left[:]
				#print(Name + percentage)

			percentage = float(percentage)
			#perc1= int(perc0)
			perc1 = int(percentage)
			perc2 = str(perc1)+'%'
				
			if int(percentage) == 0:
				color = "white"
			elif int(percentage) > 90:
				color = "green"
			elif int(percentage) <=50:
				color = "red"
			elif int(percentage) >50:
				color = "yellow"
				
			rect_perc = int(rect_width*(perc1/float(100)))  # to calculate the percentage in rectangles

			C.create_text(right_paddig, top_padding+step, text=Name, anchor=NW, fill="black", font="Helvetica 8 bold")
			C.create_text((right_badding_rect-100), top_padding+step, text=perc2, anchor=NW, fill="black", font="Helvetica 8 bold")
			C.create_rectangle(right_badding_rect, top_padding+step, right_badding_rect+rect_width, rect_hight+step, fill='white')
			C.create_rectangle(right_badding_rect, top_padding+step, right_badding_rect+rect_perc , rect_hight+step, fill=color)


#=====================================================================
# The Entry boxes and buttons code
#=====================================================================
# create frames to put control buttons and entry boxes in them
frame_1 = Frame(root, bg = 'white')
frame_1.pack(fill = 'x')

L1 = Label(frame_1, text = "Assertion code path: ", width=20)
L1.pack(side=LEFT, padx=5, pady=10)

e1 = Entry(frame_1, textvariable = ass_path_in)
e1.pack(fill=X, padx=5, expand=True)
e1.insert(END, 'SD_Card/bench/sdc_dma/verilog/assertions.sv')

frame_2 = Frame(root, bg = 'white')
frame_2.pack(fill = 'x')

L2 = Label(frame_2, text = "Transcript file path: ", width=20)
L2.pack(side=LEFT, padx=5, pady=0)

e2 = Entry(frame_2, textvariable = transcript_path_in)
e2.pack(fill=X, padx=5, expand=True)
e2.insert(END, 'SD_Card/sim/rtl_sim/run/results.txt')

frame_3 = Frame(root, bg = 'white')
frame_3.pack(fill = 'x')

b = Button(frame_3, text='Start', command=callback)
b.pack(side='bottom', padx=5, pady=5)
#b.pack(side='bottom', padx=10)

#=====================================================================
# Canvas to display data the GUI elements >> its usage is in the callback method
#=====================================================================
cw = 700  # canvas width
ch = 600  # canvas height
C = Canvas(root, width=cw, height=ch, background="white")
#C.grid(row=0, column=0)  # to set the coordinate system
#root.geometry('800x600+10+50')  ######################################
C.pack(expand = YES, fill = BOTH)


# The title of GUI elements
C.create_text(right_paddig+20, top_padding-5, text="Names", anchor=NW, fill="black", font="Helvetica 10 bold")
C.create_text((right_badding_rect-120), top_padding-5, text="Percentage", anchor=NW, fill="black", font="Helvetica 10 bold")

#=====================================================================
root.mainloop()
#=====================================================================

#=====================================================================
# Useful Resources:
#=====================================================================
# http://infohost.nmt.edu/tcc/help/pubs/tkinter/web/create_rectangle.html
# http://infohost.nmt.edu/tcc/help/pubs/tkinter/web/create_text.html
# http://www.kosbie.net/cmu/fall-10/15-110/handouts/notes-getting-started-with-graphics.html
#
# http://www.i-programmer.info/programming/python/5105-creating-the-python-ui-with-tkinter-the-canvas-widget.html?start=2
# http://www.tutorialspoint.com/python/tk_scrollbar.htm
#
#
# Frames & Buttons:
# https://www.daniweb.com/programming/software-development/threads/341699/python-and-tkinter-canvas-and-buttons-problem
# http://zetcode.com/gui/tkinter/layout/
#
# http://effbot.org/tkinterbook/entry.htm
# http://pastebin.com/vemA7ZU6

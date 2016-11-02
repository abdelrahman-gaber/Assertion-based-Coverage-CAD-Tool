from __future__ import division
#Assertion to coverage tool : find coverage and coverage percentage using assertions
#Tool version 1.0
#Code start from here
import sys
import re
import collections

# /*Hello it's me */
def find_str(s, char):
    index = 0

    if char in s:
        c = char[0]
        for ch in s:
            if ch == c:
                if s[index:index+len(char)] == char:
                    return index

            index += 1

    return -1

#The tool takes two arguments, Argument one is the path of assertion file and argument two is the path of transcript file
AssertionPath=sys.argv[1];
ResultPath=sys.argv[2];
#Declaring some variables
flag=0
Coverage_Bins={}
CoverPoint_Coverage={}
Total_coverage=0
AssertionFile=open(AssertionPath,"r")
IntermediateFile=open("Intermediate_Tool.sv","w+")

for line in AssertionFile:
	if(flag==0):
		if(find_str(line,"/*")!=-1):
			if(find_str(line,"*/")!=-1):
				
				line=line.replace(line[find_str(line,"/*"):find_str(line,"/*")+find_str(line,"*/")-find_str(line,"/*")+2]," ")
				IntermediateFile.write(line)
			else:
				IntermediateFile.write(line[0:find_str(line,"/*")])
				flag=1

		elif (find_str(line,"//")!=-1):
			if(find_str(line,"//")==0):
				next
			else:
				IntermediateFile.write(line[0:find_str(line,"//")])
				IntermediateFile.write("\n")

		elif (find_str(line,"\n")==0):		
			next		
		else:
			IntermediateFile.write(line)

	else:
		if(find_str(line,"*/")!=-1):
			IntermediateFile.write(line[find_str(line,"*/")+2:])
			flag=0
		else:
			next

AssertionFile.close()
IntermediateFile.close()

IntermediateFile=open("Intermediate_Tool.sv","r")

#The loop search assertion file for asserted properties and compare them with properties in get_property as some properties obtained
# from get_propery are not asserted, After finding the asserted properties they are added to hash table accessed with the name of the
# property as a key and each value is zero which indicate how time the property is covered

for line in IntermediateFile:
	if(find_str(line,"assert property")!=-1):
		token=line[find_str(line,"(")+1:find_str(line,")")]
		Coverage_Bins[token.split(" ")[0]]=["None",0,1,1]

		
IntermediateFile.close()
IntermediateFile=open("Intermediate_Tool.sv","r")
for line in IntermediateFile:
	if(find_str(line,"fdisplay")!=-1 or find_str(line,"info")!=-1):
		for Key in Coverage_Bins:
			token=line.split('"')[1] 
			if (find_str(token,Key)!=-1):				
				Coverage_Bins[Key]=[token.split(":")[0],0,1,1]


IntermediateFile.close()
for Key in Coverage_Bins:
	CoverPoint_Coverage[Coverage_Bins[Key][0]]=[0,0]
	

for Key in Coverage_Bins:
	CoverPoint_Coverage[Coverage_Bins[Key][0]]=[CoverPoint_Coverage[Coverage_Bins[Key][0]][0]+1,0]


ResultFile=open(ResultPath,"r")

for line in ResultFile:
	for Key in Coverage_Bins:
		token=re.split(':| ',line)
		if (token[2]==Key):

			Coverage_Bins[Key]=[Coverage_Bins[Key][0],Coverage_Bins[Key][1]+1,1,1]
			if Coverage_Bins[Key][1]==1:
				CoverPoint=Coverage_Bins[Key][0]
				#print (1/CoverPoint_Coverage[CoverPoint][0])
				CoverPoint_Coverage[CoverPoint]=[CoverPoint_Coverage[CoverPoint][0],CoverPoint_Coverage[CoverPoint][1]+1/CoverPoint_Coverage[CoverPoint][0]]


					
ResultFile.close()

for  Key in CoverPoint_Coverage:
	 
	Total_coverage=Total_coverage+(CoverPoint_Coverage[Key][1]*100)/len(CoverPoint_Coverage);

				
print ("\n************ Assertion to coverage tool v1.1 ************\n\n")
print ("{:43s}{:20s}{:15s}{:15s}".format("","Coverage","Goal","Weight"))
for Coverpoint in collections.OrderedDict(sorted(CoverPoint_Coverage.items())):
	print ("{:30s}{:20.2f}".format("Coverpoint : "+Coverpoint,CoverPoint_Coverage[Coverpoint][1]*100))
	for Bins in collections.OrderedDict(sorted(Coverage_Bins.items())):
		if(Coverage_Bins[Bins][0] == Coverpoint):
			print ("{:30s}{:20d}{:15d}{:15d}".format("     bin "+Bins,Coverage_Bins[Bins][1],Coverage_Bins[Bins][2],Coverage_Bins[Bins][3]))

	
	
print ("------------------\n")				
print ("Total Coverage : {:2.2f} %".format(Total_coverage))


OutputFile=open("Output_File.txt","w+")

for Coverpoint in collections.OrderedDict(sorted(CoverPoint_Coverage.items())):
	OutputFile.write("Coverpoint "+Coverpoint+":"+str(CoverPoint_Coverage[Coverpoint][1]*100)+"\n")	
	for Bins in collections.OrderedDict(sorted(Coverage_Bins.items())):	
		if(Coverage_Bins[Bins][0] == Coverpoint):
			if(Coverage_Bins[Bins][1]>0):	
				OutputFile.write("    bin "+Bins+": 100\n")
			else:
				OutputFile.write("    bin "+Bins+": 0\n")	
	

	
	
OutputFile.close()	
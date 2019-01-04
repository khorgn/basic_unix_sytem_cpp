#!/usr/bin/env python3

import sys
import os
import re

# Start
print ("n ", len(sys.argv), "; ", str(sys.argv))
print ("file ", os.path.dirname(os.path.realpath(__file__)))
print ("curr ", os.getcwd())

if len(sys.argv) < 3:
    exit()

hasNamespace = False
if len(sys.argv) >= 4:
    hasNamespace = True

print ("files to create: {0}.cpp, include/{0}.hpp".format(sys.argv[1]))

# Create files
sourcefile = open(sys.argv[1]+".cpp", "a", encoding="utf-8")
headerfile = open("include/"+sys.argv[1]+".hpp", "a", encoding="utf-8")

# Write in files
headerfile.writelines([
    "#pragma once\n",
    "\n",
])

if hasNamespace:
    headerfile.writelines([
        "namespace {}\n".format(sys.argv[2]),
        "{\n",
    ])

headerfile.writelines([
    "class {}\n".format(sys.argv[1]),
    "{\n",
    "};\n",
])

if hasNamespace:
    headerfile.writelines([
        "}} // namespace {}".format(sys.argv[2]),
    ])


sourcefile.writelines([
    "#include \"{}\"\n".format(sys.argv[1]+".hpp"),
    "\n",
])

if len(sys.argv) >= 3:
    sourcefile.writelines([
        "using namespace {};\n".format(sys.argv[2]),
    ])



sourcefile.name
headerfile.name

# Write in CMakeLists.txt
macroName = sys.argv[2] if not hasNamespace else sys.argv[3]
try:
    cmakelists = open("CMakeLists.txt", "r")
    patternheader = re.compile("SET( )*\({}_HEADERS\n".format(macroName))
    patternsource = re.compile("SET( )*\({}_SOURCES\n".format(macroName))
    cmakeliststmp = open("CMakeLists.txt~", "w")

    for i, line in enumerate(cmakelists):
        cmakeliststmp.write(line)
        for match in re.finditer(patternheader, line):
            print ("found: line {}, value= {}".format(i, line))
            cmakeliststmp.write("    {}.hpp\n".format(sys.argv[1]))
        for match in re.finditer(patternsource, line):
            print ("found: line {}, value= {}".format(i, line))
            cmakeliststmp.write("    {}.cpp\n".format(sys.argv[1]))
    
    os.rename("CMakeLists.txt~", "CMakeLists.txt")

except FileNotFoundError:
    pass

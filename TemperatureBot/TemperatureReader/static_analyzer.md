> use scan-build preceding the compiling command
`scan-build make`  
`scan-build (clang++|g++) file1.cpp file2.cpp`  


`scan-build -o html-dir -v -V -k make`  
> `-v`: verbose
> `-V`: open browser to view results
> `-k`: "keep on going"
> `-o dir`: output directory where the html files are stored, if not mentionned is stored in /tmp

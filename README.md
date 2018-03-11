# Sketchup to NEC
Convert Sketchup edges (lines) to GW (wires) cards in Meters.

## Installation:
Save this file to your Sketchup plugin folder as "to_nec.rb"
See https://help.sketchup.com/en/article/38583 for more info.

## Usage:

### Sketchup
Make sure that all groups and components are exploded before running this plugin.
Click "Extensions", then "Convert to NEC".
The console window will pop up and output the GW lines. Copy to your NEC file.

### NEC
The NEC (.deck) file will need other input parameters beyond just GW too.
See NEC documentation for more info http://www.nec2.org/other/nec2prt3.pdf.

This file was tested with:
- Sketchup Make 2017 from https://www.sketchup.com/download/all
- cocoaNEC 2.0 from http://www.w7ay.net/site/Applications/cocoaNEC/index.html

## Result:
![Sketchup](http://i.imgur.com/aLJhKWz.png "Sketchup")

4NEC:
![4NEC](http://i.imgur.com/Up531mt.png "4NEC")

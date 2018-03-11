=begin
Title:
    Sketchup to NEC
    
Description:
    Convert edges (lines) to GW (wires) cards in Meters.
Version:
    20180311.002
Author:
    EllisGL and jasonrwang
Installation:
    Save this file to your Sketchup plugin folder as "to_nec.rb"
    See https://www.sketchup.com/intl/en/developer/docs/loading for more info.
Usage:
    Make sure that all groups and components are exploded before running this plugin.
    Click "Extensions", then "Convert to NEC".
    The console window will pop up and output the GW lines. Copy to your NEC file.
Change Log:
    20180311.002
    jasonrwang update
=end
require 'sketchup.rb'

UI.menu("Plugins").add_item("Convert to NEC") {
	model       = Sketchup.active_model
    entities    = model.active_entities
    l           = 1000
    input       = UI.inputbox(["Wire Radius in Meters"])
    output      = ""

	SKETCHUP_CONSOLE.show
    SKETCHUP_CONSOLE.clear

    puts "Computing... Please Wait..."

    # Loops through all the entities
    entities.each do |entity|
        # Only get Edges (Not faces, groups or components)
        if entity.is_a?(Sketchup::Edge)
            # Get the start and end vertices for the edge
            vs = entity.start.position
            ve = entity.end.position
            
            # Convert everthing to meters.
            # Then to a floating point with 6 decimal places.
            # Then to a string.
            l_out = ("%3.f" % (l-999)).to_s
            sx = ("%10.6f" % vs.x.to_m.to_f).to_s
            sy = ("%10.6f" % vs.y.to_m.to_f).to_s
            sz = ("%10.6f" % vs.z.to_m.to_f).to_s
            ex = ("%10.6f" % ve.x.to_m.to_f).to_s
            ey = ("%10.6f" % ve.y.to_m.to_f).to_s
            ez = ("%10.6f" % ve.z.to_m.to_f).to_s
            r = ("%10f" % input[0].to_f).to_s

            # Add line to output variable (printing this out line by line in the loop is super slow)
            output = output + "GW" + l_out + "   21" + sx + sy + sz + ex + ey + ez + r + "\n"

            #Increment the line counter
            l += 1
        end
    end

    # Print the contents of the output variable (Fast!)
    puts "-------- Start --------"
    puts output
    puts "--------  End  --------"
}

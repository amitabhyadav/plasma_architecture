#!/bin/bash

# Print from the first line until pattern is matched
sed -n '1,/$enddefinitions $end/ p' power.vcd > power_header.vcd

# Print from pattern to end of file 
sed -n '/$enddefinitions $end/,${//!p;}' power.vcd > power_tail.vcd

# Remove sim_tb_top and u1_plasma_top scopes
sed -i '/$scope module sim_tb_top $end/,/$scope module u1_plasma_top $end/ d' power_header.vcd
sed -i -e:b -e'$!{N;2,2bb' -e\} -e'/\n.*$enddefinitions $end/!P;D' power_header.vcd

# Merge header and tail to power.vcd
cat power_header.vcd power_tail.vcd > power.vcd

rm power_header.vcd
rm power_tail.vcd

# Rubik-s-Cube
Align the 2*2 Rubik's cube

# How to start 
```bash
# compile
iverilog *.v
# -> a.out

# execute 
vvp ./a.out
# -> make dump file, which is named 'top_test.vcd' 

# simulate
gtkwave top_test.vcd
```

# Correspondence table


# Bass name

Refer to this photo when you connect each component.

Please refer to [topmodule.v](https://github.com/yuta1331/CPU/blob/master/topmodule.v)

In this file, I name each bass so as not ot cause conflict in the circuit

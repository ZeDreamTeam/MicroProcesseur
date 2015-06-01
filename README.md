# MicroProcesseur

This project describes a simple architecture of a microprocessor, that should run some custom assembler code.

It includes a few components that can be found in the `sources/core` folder. Each component is associated with a custom test_bench, which is suposed to show the tests that used to determine that our component was well implemented.

The main component is our system, in the `sources/` folder. It invokes and connects all of our components.

To compile and execute our test_benches we use a custom set of Makefile, created by **Benoit Morgan**. You can find his source on [his github](https://github.com/bntmorgan/skeleton)

##How to
To compile and use the project you need to do the following. First of all, you will need to make the project. As for the moment, you can only do so by using the bash sh environment, and not zsh if this is your default terminal. You'll also need to source the `xilinx.sh` file.

Then a simple `make` will compile the project. A log is shown in the `binary/{module}/{module_name}.ngc.out`. If there is any error you will be notified, and will only need to look at those file to check the log.

If you want to run the simulation, you will need to use a specific make flavour. Executing `binary/{module}/{module_name}_beh.runisim` will run ISE and its simulation tools to let you check what's going on.

**Note**: A few settings needs to be changed in the xilinx.sh file, depending on your environment. You'll need to specify the path to xilinx in `XILINX_BASE`, your version in `XILINX_VERSION` and choose between 32b and 64b on the line 11.

**tl;dr**
```
bash
source xilinx.sh
make
make binary/system/system_beh.runisim
```

##Links
See the other part of the project :
- [Compiler](https://github.com/ZeDreamTeam/Compilateur)
- [French report](https://github.com/ZeDreamTeam/SystemeInfo_rapport)



EXECUTABLES = vec-add vec-add-soln print-devices transpose transpose-soln

all: $(EXECUTABLES)


vec-add: vec-add.c cl-helper.o
	gcc -I$(OPENCL_INC) -L$(OPENCL_LIB) -std=gnu99 -lrt -lOpenCL -o$@ $^

vec-add-soln: vec-add-soln.c cl-helper.o
	gcc -I$(OPENCL_INC) -L$(OPENCL_LIB) -std=gnu99 -lrt -lOpenCL -o$@ $^

print-devices: print-devices.c cl-helper.o
	gcc -I$(OPENCL_INC) -L$(OPENCL_LIB) -std=gnu99 -lrt -lOpenCL -o$@ $^

transpose: transpose.c cl-helper.o
	gcc -I$(OPENCL_INC) -L$(OPENCL_LIB) -std=gnu99 -lrt -lOpenCL -o$@ $^

transpose-soln: transpose-soln.c cl-helper.o
	gcc -I$(OPENCL_INC) -L$(OPENCL_LIB) -std=gnu99 -lrt -lOpenCL -o$@ $^

%.o : %.c %.h
	gcc -c -I$(OPENCL_INC) -std=gnu99 $<

clean:
	rm -f $(EXECUTABLES) *.o

EXECUTABLES = vec-add print-devices

all: $(EXECUTABLES)

vec-add: vec-add.c cl-helper.h cl-helper.c
	gcc -std=gnu99 -lrt -lOpenCL -o$@ $^

print-devices: print-devices.c cl-helper.h cl-helper.c
	gcc -std=gnu99 -lrt -lOpenCL -o$@ $^

clean:
	rm -f $(EXECUTABLES)

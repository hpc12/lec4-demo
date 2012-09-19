EXECUTABLES = vec-add vec-add-soln print-devices transpose transpose-soln

all: $(EXECUTABLES)

vec-add: vec-add.c cl-helper.h cl-helper.c
	gcc -std=gnu99 -lrt -lOpenCL -o$@ $^

vec-add-soln: vec-add-soln.c cl-helper.h cl-helper.c
	gcc -std=gnu99 -lrt -lOpenCL -o$@ $^

print-devices: print-devices.c cl-helper.h cl-helper.c
	gcc -std=gnu99 -lrt -lOpenCL -o$@ $^

transpose: transpose.c cl-helper.h cl-helper.c
	gcc -std=gnu99 -lrt -lOpenCL -o$@ $^

transpose-soln: transpose-soln.c cl-helper.h cl-helper.c
	gcc -std=gnu99 -lrt -lOpenCL -o$@ $^

clean:
	rm -f $(EXECUTABLES)

EXECUTABLES = vec-add vec-add-soln print-devices transpose transpose-soln

all: $(EXECUTABLES)

ifdef OPENCL_INC
  CL_CFLAGS = -I$(OPENCL_INC)
endif

ifdef OPENCL_LIB
  CL_LDFLAGS = -L$(OPENCL_LIB)
endif

vec-add: vec-add.c cl-helper.o
	gcc $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -o$@ $^ -lrt -lOpenCL 

vec-add-soln: vec-add-soln.c cl-helper.o
	gcc $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -o$@ $^ -lrt -lOpenCL
                                                                        
print-devices: print-devices.c cl-helper.o                              
	gcc $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -o$@ $^ -lrt -lOpenCL
                                                                        
transpose: transpose.c cl-helper.o                                      
	gcc $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -o$@ $^ -lrt -lOpenCL
                                                                        
transpose-soln: transpose-soln.c cl-helper.o                            
	gcc $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -o$@ $^ -lrt -lOpenCL

%.o : %.c %.h
	gcc -c $(CL_CFLAGS) -std=gnu99 $<

clean:
	rm -f $(EXECUTABLES) *.o

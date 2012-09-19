vec-add: vec-add.c cl-helper.h cl-helper.c
	gcc -std=gnu99 -lrt -lOpenCL -o$@ $^

clean:
	rm -f vec-add

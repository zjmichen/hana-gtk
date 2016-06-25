

all:
	cd build; cmake .. && make

clean:
	rm -rf ./build/*
	rm ./po/*.po
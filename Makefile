 
obj-m += pancreas.o

all:
	@echo "Using the make all option! And this is a echo test!"
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

testecho:
	@echo "Hi! this line will not show the echo command"
	echo "Hi! this line will show the echo command!"
	@echo " "

clean:
	@echo "Using the clean option!"
	@echo "Here is what we have before clean!"
	ls
	@echo " "
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	@echo " "
	@echo "And this is what we have after the clean!"
	ls

CFLAGS		:= -Os -mcpu=cortex-m3 -mthumb -I $(INSTALL_ROOT)/A2F/root/usr/include
LDFLAGS		:= -mcpu=cortex-m3 -mthumb -L $(INSTALL_ROOT)/A2F/root/usr/lib

CC		= $(CROSS_COMPILE_APPS)gcc

EXEC = led_counter

led_counter: led_counter.o include/maxim2831.o include/tx_packet.o include/rx_packet.o include/radio_config.o include/mss_sdr.o

DIRS := ${shell find ${ROOT_DIRECTORY} -mindepth 1 -maxdepth 1 -type d -print | grep -v svn}
clean:
	-rm -f $(EXEC) *.gdb *.o
	rm -f ~/samba_share/nfs/a2f/$(EXEC)
	for dir in $(DIRS) ; do \
		cd $$dir; \
		rm -f ./*.gdb; \
		rm -f ./*.o; \
		cd ..; \
	done

.PHONY: all

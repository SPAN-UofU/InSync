The design file contains a u-boot image, if you flash the board with the project directly, it will load the image to ENVM on uSDR.

I did my most developing on linux. There are couple things you need to do to make it up and running.

1. Download the uClinux for Cortex-M3.
I modified the kernel code from Emcraft and wrote my own driver for it. 
Step 1: I suggest just download from here
	http://electron.eecs.umich.edu/linux_sdr.tar.gz
	

Step 2. Compile a linux image
The boards I sent you are completely empty, nothing on the flash/envm. The board has a external flash where I store the linux image. This step might be tricky.

2.a. compile linux on your machine.
2.a.i enter linux-cortex-1.8.0, type 'source ACTIVATE.sh'
2.a.ii enter projects/developer, type 'make', it'll ask for core interrupt (twice), type 'n', after a long building process, you should get a developer.uImage


Step 3: Install tftp - Follow this instruction below
http://mohammadthalif.wordpress.com/2010/03/05/installing-and-testing-tftpd-in-ubuntudebian


2.b. The linux image has to load to the board using TFTP. You'll need a TFTP server running in the network.

command to execute
tftp <tftp server ipaddress>






2.c. Flash the board with the microsemi project I sent you, enter u-boot environment. 

:: Path to the uboot.hex
C:\Actelprj\SDRv2_radio_on_linux_asynrst\Emcraft_firmware\u-boot.hex


Set the environmental variables. (read linux-A2F-SOM-bspg-1.8.0.pdf for setting environmental variables)
2.c.i Important variables are: image, ipaddr, serverip, netmask
2.c.ii 'run update' to load the linux image to the boards.

[Before run update after flashing with Libero]
1. Setup configuration:
	Connect Ethernet cable to uSDR: This will connect the uSDR to the network

2. reboot uSDR by entering 'reset'
	Click "enter key" before 3 seconds. This takes the cursor to uboot.
	



setenv hostname uSDR1
setenv ethaddr ??????.89
setenv ipaddr 10.0.0.30
serverip: 10.0.0.21 (TFTP Server)
netmask: 255.255.255.0


TFTP commands 
- Windows client
	;; to test the tftp server
	tftp 10.0.0.22 get test 

- linux client
	tftp 10.0.0.2
	get test
	


************ screen commands ****************
start: screen /dev/ttyUSB0 115200

exit: ctrl-a then ctrl-d

reattach: screen -r 22441 (pro id)

**********************************************************
IMPORTANT STEPS to test uSDC together for communication

Setup the switch 

Connect two uSDRs to the central switch and one Ethernet to the main computer.

1. Main Computer Setup
	- Ethernet setup to share the connection
		:: Right click on the network management
		:: Wired connection 1
			-- IPv4 Address, Basic settings
			-- Method: Shared 
			-- IPv6 Address, Basic settings
			-- Method: Disabled
			-- ifconfig
				== 10.42.0.1 for eth0

2. Setup uSDRs				
2.1 First uSDR
	- screen /dev/ttyUSB0 115200
	- ifconfig
		== 10.42.0.40
		
	- check to see if it gets the ip address for eth0
	- If it has a new ip address, then this uSDR is good to test
	
2.2 Second uSDR
	-- do the same thing for the first uSDR
	

3. Mount the shared folder
3.1 Mount the share folder from the main computer in the first uSDR
	mkdir -p /mnt/nfs/var/nfs
	mount -o port=2049,nolock,proto=tcp 10.42.0.1:/var/nfs  /mnt/nfs/var/nfs
	ls /mnt/nfs/var/nfs
	cd /mnt/nfs/var/nfs

	## if mounting doesn't work because of ip problems, then change ip
		-- sudo ifconfig eth0 10.42.0.1 netmask 255.255.255.0 up
		
	
3.2 Do the same thing to the second uSDR

4. Start led_counter
	4.1 First uSDR
		./led_counter
	4.2 Second uSDR
		./led_counter
		

DONE!
********************************************************************************		
			
connect the ethnet cable

run update

reset

check ip

update export info

[good one]
mkdir -p /mnt/nfs/home
mkdir -p /mnt/nfs/var/nfs

mount -o port=2049,nolock,proto=tcp nfs_server:/server/mount/point  /mnt/nfs
mount -o port=2049,nolock,proto=tcp 10.42.0.1:/var/nfs  /mnt/nfs/var/nfs


mount 12.34.56.789:/home /mnt/nfs/home
mount 12.34.56.789:/var/nfs /mnt/nfs/var/nfs



uSDR2:
ethaddr: ??????.88
ipaddr: 10.0.0.31



uSDR1 ip: 10.0.0.43
uSDR2 ip: 10.0.0.44

3. Write your application
3.a enter projects/developer/app/sdr_driver/user_app/ here is an example of sending a LED blink app. It should be simple to read. Write the application and build it.
3.b install nfs service on your machine, the simplest way to test application is using nfs. Once the board boots, see nfs.sh. It can access host directory using nfs. So you don't have to flash the board every time you change something. Simply build your application on your machine, access it from the board.

misc: before you execute your program, you need a kernel module (which handles interrupts). This should be done every time the board boots.





[How to install Libero SOC on ubuntu]
-  Download Libero SOC for Linux
- Unpack the gz file
- Read ReadMe.txt and follow the steps
- Execute sudo ./LiberoSoc__v11.5_Linux.bin

- Run sudo ./udev_install -t /etc/udev/rules.d
- Update the Group "" to your user groupid.  How to find >> type "id" on console

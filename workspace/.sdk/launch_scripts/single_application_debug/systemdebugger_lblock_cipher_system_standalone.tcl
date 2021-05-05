connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351AD68CEA" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351AD68CEA-23727093-0"}
fpga -file C:/Users/Jakub/Desktop/vut_fekt/bajkalarka/zaloha/GitHub/HW-encoder-for-lightweigth-cryptography/workspace/LBlock_cipher/_ide/bitstream/LBlock_design.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/Jakub/Desktop/vut_fekt/bajkalarka/zaloha/GitHub/HW-encoder-for-lightweigth-cryptography/workspace/LBlock/export/LBlock/hw/LBlock_design.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/Jakub/Desktop/vut_fekt/bajkalarka/zaloha/GitHub/HW-encoder-for-lightweigth-cryptography/workspace/LBlock_cipher/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/Jakub/Desktop/vut_fekt/bajkalarka/zaloha/GitHub/HW-encoder-for-lightweigth-cryptography/workspace/LBlock_cipher/Debug/LBlock_cipher.elf
configparams force-mem-access 0
bpadd -addr &main

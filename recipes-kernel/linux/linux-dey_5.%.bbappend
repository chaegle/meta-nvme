#
# Enable kernel support for NVMe M.2 SSD
#

nvme_kernel_preconfigure() {
     mkdir -p ${B}

     kernel_conf_variable NVME_CORE y
     kernel_conf_variable BLK_DEV_NVME y   
} 

do_configure_prepend() {
     nvme_kernel_preconfigure
}

COMPATIBLE_MACHINE = "(ccimx8x|ccimx8m|ccimx6$)"

OpenEmbedded/Yocto Digi Embedded NVME Layer
=====================================

This layer enables support for NVME M.2 Solid State Drive (SSD)

SUPPORTED PLATFORMS
------------------
This layers supports all Digi ConnectCore solutions that provide a PCIe bus.
* ConnectCore 6
* ConnectCore 6N (see limitations section, below)
* ConnectCore 6Plus
* ConnectCore 8M Mini DVK
* Connectcore 8X (see limitations section, below)

SUPPORTED DEY RELEASES
--------------

* DEY-3.0 (Zeus)
* DEY-3.2 (Gatesgarth)

ADDITIONAL HARDWARE
-----------
1. [Crucial P2 500GB 3D NAND NVMe PCIe M.2 SSD Up to 2400MB/s - CT500P2SSD8](https://smile.amazon.com/gp/product/B086BGWNY8/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&th=1)
2. [M.2 (NGFF) nVME SSD to Mini PCIe Adapter](https://smile.amazon.com/gp/product/B07KX7JZYK/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1) 
  
INSTALLATION
----------
1. Install Digi Embedded Yocto (DEY), per the published instructions.
2. Clone meta-nvme layer to your local workstation.
   #> cd <DEY_INSTALLDIR>/sources
   #> git clone https://github.com/chaegle/meta-nvme.git

CREATE AND BUILD A PROJECT
----------------------
1. Create a project for your supported platform.
2. Add the meta-nvme layer to your project's bblayers.conf file.
3. OPTIONAL - include lspci and/or nvme-cli in produced boot artifacts. Edit and add below line to the project's local.conf file. These tools are NOT required to proper operation/use of the SSD.

   IMAGE_INSTALL_append = " pciutils nvme-cli"

4. Build the image.
   #> bitbake dey-image-qt
5. Deploy artifacts.
6. Boot and confirm existence of /dev/nvme0n1.
   #>ls /dev/nvme0n1
   /dev/nvme0n1
7. As necessary, create and format partition(s) on the NVMe device.

LIMITATIONS
-----------
1. The wirelessly enabled ConnectCore 8X is NOT supported, as the on-SOM Wi-Fi/BT radio is connected to the PCIe bus.
2. At the time of the creation of this layer the author did not have access to a Connectcore 6N to test with. This platform is, however, part of the Connectcore 6Plus family, on which testing was done.
 

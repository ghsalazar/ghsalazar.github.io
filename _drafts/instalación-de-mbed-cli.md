---
title: Instalación de mbed-cli
...

## Prerrequisitos

~~~{.sh}
sudo apt install -y python3 python3-pip git mercurial gcc-arm-none-eabi
~~~

## Mbed-cli

~~~{.sh}
python3 -m pip install mbed-cli
~~~

~~~{.sh}
mbed config -G GCC_ARM_PATH "/usr/bin"
mbed toolchain GCC_ARM

~~~

### Use

~~~
cd mbed-os
cd mbed-os/
mbed update master
sudo pip install -r requirements.txt
~~~

## Updating

~~~{.sh}
python3 -m pip install -U mbed-cli
~~~


## Referencias

* https://zoomadmin.com/HowToInstall/UbuntuPackage/gcc-arm-none-eabi
* https://os.mbed.com/docs/mbed-os/v6.11/build-tools/index.html#compiler-versions
* https://os.mbed.com/docs/mbed-os/v6.11/build-tools/install-and-set-up.html

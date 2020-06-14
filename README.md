# Ubuntu 18.04 Deep Learning Development Environment
 
tensorflow-gpu & Nvidia GPU & Cuda & Cudnn Setting


***
## Ubuntu 18.04
* #### Ubuntu Kernel Version 5.3.0-53
* #### GeForce RTX 2080 Ti
* #### NVIDIA 440.44
* #### cuda 10.0
* #### cuDNN v7.6.0
***

## 0. Update and Upgrade
    
    $ sudo apt-get update
    $ sudo apt-get upgrade
    
## 1. Remove All Nvidia

    $ sudo apt-get purge nvidia*

## 2. nouveau Off

##### • Make 'blacklist-nouveau.conf' and  revise(If there is no gedit, $ sudo apt-get install gedit)

    $ sudo gedit /etc/modprobe.d/blacklist-nouveau.conf

##### • Insert Belows in blacklist-nouveau.conf and close after saving
    
    blacklist nouveau
    options nouveau modeset=0

##### • For Apply Reboot
    
    $ sudo reboot 

##### • After rebooting, Insert this in the terminal. If you can see blank, It's perfect
    
    $ lsmod | grep nouveau
***
## 3. Install 'gcc' and 'make'
##### • for install Nvidia Driver, It's essentical

    $ sudo apt install gcc
    $ sudo apt install make

***
## 4. Download Cuda and, Nvidia Driver
##### Download Installer for Linux Ubuntu 18.04 x86_64

##### `RTX 2080 - Download CUDA: CUDA Toolkit 10.0` [[CUDA Link]](https://developer.nvidia.com/cuda-toolkit-archive)  

<div align="left">
  <img src="https://github.com/yehengchen/Ubuntu-16.04-Deep-Learning-Environment-Setup/blob/master/img/ubuntu_18.04_cuda.png" width="800">


##### Install Nivida Driver
##### • move to directory of driver downloaded and type in beldows. 
frist, give the permission and then execute driver installer

    $ sudo chmod a+x NVIDIA-Linux-x86_64-440.44.run
    $ sudo ./NVIDIA-Linux-x86_64-440.44.run -no-opengl-files -no-x-check -no-nouveau-check
    
#### [Tips] (登录界面循环问题 - Login loop issue)
* -no-opengl-files (no install OpenGL file)
* -no-x-check (no check X server)
* -no-nouveau-check (no check nouveau module)
  
#### During Installing
    
    “Would you like to run the nvidia-xconfig utility to automatically update your X configuration file...”
    Choose No.
    After above: $sudo reboot
    
## 5. Nvidia驱动安装完成 - Check Driver was successfully installed

    $ nvidia-smi
    
<img src="https://github.com/chenyeheng/Ubuntu_16.04_Deep_Learning_Environment_Setup/blob/master/img/gpu_setting.png" width="60%" height="60%">
    
##### Install CUDA
##### • move to directory of cuda downloaded and type in beldows. 
frist, give the permission and then execute cuda installer

    $ sudo chmod 777 cuda_10.0.130_410.48_linux.run
    $ sudo sh cuda_10.0.130_410.48_linux.run --no-opengl-libs
    ...
    
   __*进入 CUDA 安装中同意安装 Nvidia 驱动*__
>     [accept] #Consent to install
>     [n]      #Do not install Driver
>     [y]      #Install CUDA Toolkit
>     <Enter>  #Directory set to Default
>     [y]      #Create a soft link to the installation directory
>     [n]      #no sample

__*After installation is complete, the CUDA and the NVidia drive will be displayed for successful installation*__
##### A. type belows in terminal

    $ export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
    $ export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
    
##### B. Reload .bashrc with 
    
    $ source .bashrc

##### C. link

    $ sudo ldconfig /usr/local/cuda/lib64

##### D. Installation and path testing, CUDA installation complete

    $ nvcc -V
    
![result](https://img-blog.csdnimg.cn/20190609205106404.png)

***
## 6. Download cuDNN
#### `RTX 2080ti - cuDNN v7.6.0 (May 16, 2018), for CUDA 10.0` [[cuDNN Link]](https://developer.nvidia.com/rdp/cudnn-archive)
__*Install the latest Cudden for the Cuda version*__

##### Install cudnn-10.0-linux-x64-v7.6.0.64.tgz 
##### • move to directory of cudnn downloaded and type in beldows.

    $ tar -zxvf cudnn-10.0-linux-x64-v7.6.0.64.tgz
    $ cd cuda
    $ sudo cp lib64/lib* /usr/local/cuda/lib64/
    $ sudo cp include/cudnn.h /usr/local/cuda/include/
    $ sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
##### Then update the network connection:

    $ cd /usr/local/cuda/lib64/ 
    $ sudo chmod +r libcudnn.so.7.6.0
    $ sudo ln -sf libcudnn.so.7.6.0 libcudnn.so.7
    $ sudo ln -sf libcudnn.so.7 libcudnn.so 
    $ sudo ldconfig
    
##### Check cudnn 
    $ cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
![image](https://user-images.githubusercontent.com/57169220/84590290-4414b780-ae70-11ea-9e83-de374743acda.png)


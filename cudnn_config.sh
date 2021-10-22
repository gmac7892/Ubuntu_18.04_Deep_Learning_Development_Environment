sudo cp /home/mando/Downloads/cuda/include/cudnn*.h /usr/local/cuda/include 
sudo cp /home/mando/Downloads/cuda/lib64/libcudnn* /usr/local/cuda/lib64 
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*

sudo chmod +r /usr/local/cuda/lib64/libcudnn.so.8.2.2
sudo ln -sf /usr/local/cuda/lib64/libcudnn.so.8.2.2 /usr/local/cuda/lib64/libcudnn.so.8
sudo ln -sf /usr/local/cuda/lib64/libcudnn.so.8 /usr/local/cuda/lib64/libcudnn.so
ldconfig -N -v $(sed 's/:/ /' <<< $LD_LIBRARY_PATH) 2>/dev/null | grep libcudnn


cat /usr/local/cuda/include/cudnn_version.h | grep CUDNN_MAJOR -A 2


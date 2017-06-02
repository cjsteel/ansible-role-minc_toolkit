

# installing minc-toolkit-v2 from source.md

## Resources

* [ [BIC-MNI](https://github.com/BIC-MNI)/**minc-toolkit-v2**  ]( https://github.com/BIC-MNI/minc-toolkit-v2 ) 

Tested and not working, see fail message at end.

##  Variables (skip this)

```yaml
minc_tk-bin_dir: '~/bin/minc-toolkit-v2'
minc_toolkit_src_root  : '~'
minc_toolkit_build_dir : '~/minc-toolkit-v2/build'
```

## Requirements

### General

```shell
sudo apt-get install -y build-essential
sudo apt-get install -y g++
```

### For tools with no GUI

```shell
sudo apt-get install -y cmake cmake-curses-gui
sudo apt-get install -y bc
sudo apt-get install -y bison
sudo apt-get install -y flex
sudo apt-get install -y perl
```

### Additional packages for tools with GUI

```shell
sudo apt-get install -y libx11-dev x11proto-core-dev       # X11 dev libs
sudo apt-get install -y libxi6 libxi-dev                   # libxi
sudo apt-get install -y libxmu6 libxmu-dev libxmu-headers  # libmu
sudo apt-get install -y libgl1-mesa-dev                    # gl1 mesa
sudo apt-get install -y libglu1-mesa-dev                   # glu1 mesa
sudo apt-get install -y libjpeg-dev                        # lib jpg
```

### installing from gitlab

#### requirements

```shell
sudo apt-get install -y git
```

#### clone

```shell
cd ~
git clone --recursive https://github.com/BIC-MNI/minc-toolkit-v2.git minc-toolkit-v2
```

#### ccmake

```shell
cd minc-toolkit-v2
mkdir build && cd build
ccmake .. # Enter configuration details, recommend not to use any system-provided libraries that are included in minc-toolkit-v2
```

* Press [c] to configure then wait.
* Press [e] to exit help
* Press [c] to configure then wait.
* Press [g] to generate and exit

#### cmake

Following command will configure build system to build all the tools and install them into `/opt/minc/1.9.13` on Linux

```shell
cmake .. \
-DCMAKE_BUILD_TYPE:STRING=Release   \
-DCMAKE_INSTALL_PREFIX:PATH=/opt/minc/1.9.13   \
-DMT_BUILD_ABC:BOOL=ON   \
-DMT_BUILD_ANTS:BOOL=ON   \
-DMT_BUILD_C3D:BOOL=ON   \
-DMT_BUILD_ELASTIX:BOOL=ON   \
-DMT_BUILD_IM:BOOL=OFF   \
-DMT_BUILD_ITK_TOOLS:BOOL=ON   \
-DMT_BUILD_LITE:BOOL=OFF   \
-DMT_BUILD_SHARED_LIBS:BOOL=ON   \
-DMT_BUILD_VISUAL_TOOLS:BOOL=ON   \
-DMT_USE_OPENMP:BOOL=ON   \
-DUSE_SYSTEM_FFTW3D:BOOL=OFF   \
-DUSE_SYSTEM_FFTW3F:BOOL=OFF   \
-DUSE_SYSTEM_GLUT:BOOL=OFF   \
-DUSE_SYSTEM_GSL:BOOL=OFF   \
-DUSE_SYSTEM_HDF5:BOOL=OFF   \
-DUSE_SYSTEM_ITK:BOOL=OFF   \
-DUSE_SYSTEM_NETCDF:BOOL=OFF   \
-DUSE_SYSTEM_NIFTI:BOOL=OFF   \
-DUSE_SYSTEM_PCRE:BOOL=OFF   \
-DUSE_SYSTEM_ZLIB:BOOL=OFF 
```

#### make and make install

This should take a long time and may need to be repeated as all required items are downloaded from the net.

```shell
make
sudo make install
```



## Troubleshooting

### if failed at 


    make[2]: *** [HDF5-prefix/src/HDF5-stamp/HDF5-download] Error 1
    make[1]: *** [CMakeFiles/HDF5.dir/all] Error 2
    make: *** [all] Error 2

#### possible manual fix

```shell
mkdir HDF5-prefix/src/HDF5-stamp/HDF5-download
cd HDF5-prefix/src/HDF5-stamp/HDF5-download
wget https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.15-patch1/src/hdf5-1.8.15-patch1.tar.bz2
```




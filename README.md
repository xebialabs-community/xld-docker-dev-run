# xld_dev_run #

Docker image that has XLD installed, mounts your source code and executes compilation using gradle wrapper. 
After compilation it starts XLD and links the `ext` folder to your plugin.

## Badges ##
[![Docker Stars](https://img.shields.io/docker/stars/xebialabsunsupported/xld_dev_compile.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/xebialabsunsupported/xld_dev_compile.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/xebialabsunsupported/xld_dev_compile.svg)]()
[![Docker Build Statu](https://img.shields.io/docker/build/xebialabsunsupported/xld_dev_compile.svg)]()

## Tags ##

* `latest`, `8.1.0`
* `v8.0.0.1`
* `v7.6.0.1`
* `v7.5.0.1`
* `v7.2.0.1`
* `v7.1.0.1`
* `v7.0.0.1`

## Starting ##

```
docker run -p 4516:4516 -v ~/myproject:/data -v ~/xl-licenses:/license -v ~/.xlgradle:/root/.gradle xebialabsunsupported/xld_dev_run
```

where:

* `data`: Mountpoint pointing to root directory of your plugin.
* `xl-licenses`: Folder containing the XLD license.
* `xlgradle`: Is used to cache gradle dependencies.

## Initialize and testing ##
+ Put a script under `src/test/resources/docker/intialize/xld_initialize.py` and it will be invoked using the CLI at XLD startup
+ Put some pytest scripts under `src/test/resources/dockes/tests` and they will be executed within the CLI using pytest. Results will be stored in `/data/build/tests/results/junit.xml`.

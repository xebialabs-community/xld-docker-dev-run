# xld_dev_run #

Docker image that has XLD installed, mounts your source code and executes compilation using gradle wrapper. 
After compilation it starts XLD and links the `ext` folder to your plugin.

# Starting #

```
docker run -p 4516:4516 -v ~/myproject:/data -v ~/xl-licenses:/license -v ~/.xlgradle:/root/.gradle xebialabs/xld_dev_run
```

where:

* `data`: Mountpoint pointing to root directory of your plugin.
* `xl-licenses`: Folder containing the XLD license.
* `xlgradle`: Is used to cache gradle dependencies.

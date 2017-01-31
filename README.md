# xld_dev_run #

Docker image that has XLD installed, mounts your source code and executes compilation using gradle wrapper. 
After compilation it starts XLD and links the `ext` folder to your plugin.

# Supported tags #

* `latest`, `v6.1.0.1`
* `v6.0.2.1`
* `v6.0.1.2`
* `v6.0.0.1`
* `v5.5.5.7`
* `5.5.3.1`
* `5.5.1.1`

# Starting #

```
docker run -p 4516:4516 -v ~/myproject:/data -v ~/xl-licenses:/license -v ~/.xlgradle:/root/.gradle xebialabs/xld_dev_run
```

where:

* `data`: Mountpoint pointing to root directory of your plugin.
* `xl-licenses`: Folder containing the XLD license.
* `xlgradle`: Is used to cache gradle dependencies.

# Initialize and testing #
+ Put a script under `src/test/resources/docker/intialize/xld_initialize.py` and it will be invoked using the CLI at XLD startup
+ Put some pytest scripts under `src/test/resources/dockes/tests` and they will be executed within the CLI using pytest. Results will be stored in `/data/build/tests/results/junit.xml`.

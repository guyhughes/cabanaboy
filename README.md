cabanaboy
===================

Hello
-------------

`cabanaboy` is an rsync wrapper to retreive files from a source directory and place the into a local directory. It might be useful when looking through collections of large files or deeply-nested directory structures, like a media library. 



Reference
------------------
```
Commands:
  cabanaboy createConfig    # Create a configuration file interactively
  cabanaboy get             # Get file(s) from the cabanaboy host.
  cabanaboy help [COMMAND]  # Describe available commands or one specific command
  cabanaboy kill            # Perform kill command per trusted YAML file
  cabanaboy off             # Perform stop command per trusted YAML file
  cabanaboy on              # Perform start command per trusted YAML file

Options:
  -v, [--verbose], [--no-verbose]  
  -d, [--debug], [--no-debug]      
  -c, [--config=CONFIG]            # Use an alternative YAML config file.
```

Config Files
-------------
Check out the [sample config files](https://github.com/ypcrts/cabanaboy/tree/master/.config/cabanaboy). They're dead simple.

The default configuration file is `${dir}/cabanaboy/cabanaboy.yaml`, where `${dir}` is:
 - `XDG_CONFIG_HOME` if it is set
 - otherwise `${HOME}/.config` if `HOME` is set
 - otherwise `~/.config` 

`cabanaboy createConfig` interactively creates config files in the same directory as the default configuration file. 

Use them with `cababoy on -c otherconfigfilename` without specifying the .yaml suffix. You can also specify the path to another config file with `-c`. 

Checksums are used automatically over any remote connection. 
Turn them off with:
```yaml
checksums: false
```

Requirements
--------------
- ruby >= 2.1.0
- rsync >= 3.1 (older versions untested)
- ruby gem thor (Debian: available as `apt-get install ruby-thor`; or as `gem install thor`) 

<!-- vim: set ft=markdown tw=0 ts=2 sw=2 sts=2 fdm=expr et: -->

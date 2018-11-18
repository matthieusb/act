# Actiona Zsh plugin

Actiona is an application to automate some GUI based tools on your operating system.
If you dont want to know more about actiona or contribute, you can visit the [official website](https://github.com/Jmgr/actiona) or [github page](https://github.com/Jmgr/actiona).

This plugin aims at making things easier to call actiona scripts from your command line. It also comes with completion scripts.

![Act usage gif](./act_usage.gif?raw=true "Optional Title")

## Installation

act is not bundled with ZSH, so you need to install it.

### [Antigen](https://github.com/zsh-users/antigen)

This plugin can be installed by adding `antigen bundle matthieusb/act` to your `.zshrc` file. [Antigen](https://github.com/zsh-users/antigen) will handle cloning the plugin for you automatically the next time you start `zsh`. You can also add the plugin to a running ZSH session with `antigen bundle matthieusb/act` for testing before adding it to your `.zshrc`.

### [Zgen](https://github.com/tarjoilija/zgen)

This plugin can be installed by adding `zgen load matthieusb/act` to your `.zshrc` file in the same function you're doing your other `zgen load` calls in. [Zgen](https://github.com/tarjoilija/zgen) will automatically clone the repositories for you when you do a `zgen save`.


### [Simple Oh-My-Zsh](http://ohmyz.sh/)

Go to your *oh-my-zsh* folder and then in *custom/plugins* and clone this repository:

```
git clone https://github.com/matthieusb/act.git
```

And then, add to to your *.zshrc* plugin list like this:

```
plugins=(... act)
```

## Usage

The `act` plugins looks for scripts to execute in *~/.actiona_scripts*. To override this, you can set the **ACTIONA_SCRIPTS** environment variable.

Act can be used using the following commands:

```
Usage: act [command]

Commands:
    exe <script>    Execute an actiona script without any actiona window opening
    list            Display available scripts

    help            Show this extremely helpful text
```

# Actiona Zsh plugin

Actiona is an application to automate some GUI based tools on your operating system.
If you dont want to know more about actiona or contribute, you can visit the [official website](https://github.com/Jmgr/actiona) or [github page](https://github.com/Jmgr/actiona).

This plugin aims at making things easier to call actiona scripts from your command line. It also comes with completion scripts.

![Act usage gif](./act_usage.gif?raw=true "Optional Title")

## Installation

act is not bundled with zsh, so you need to clone it. Go to your *oh-my-zsh* folder and then in *custom/plugins* and clone this repository:

```
git clone https://github.com/matthieusb/act.git
```

And then, add to to your *.zshrc* plugin list like this:

```
plugins=(... act)
```

## Usage

The act plugins looks for scripts to execute in *~/.actiona_scripts*. To override this, you can set the **ACTIONA_SCRIPTS** environment variable.

Act can be used using the following commands:

```
Usage: act [command]

Commands:
    exe <script>    Execute an actiona script without any actiona window opening
    list            Display available scripts

    help            Show this extremely helpful text
```

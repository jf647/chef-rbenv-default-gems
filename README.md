# chef-rbenv-default-gems

## Description

Installs the [rbenv-default-gems](https://github.com/sstephenson/rbenv-default-gems)
plugin for the rbenv::system install.

## Usage

Include `recipe[rbenv_default_gems]` in your run_list and override the defaults
you want changed.

## LWRP

Use the rbenv_default_gems LWRP to manage the gems in the default-gems file:

  rbenv_default_gems "debugger"

This can be called more than once and from multiple recipes; the accumulator library will bring all of the gems together into one file at the end of the chef run.

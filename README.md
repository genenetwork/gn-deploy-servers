# GeneNetwork2 deployment (in Memphis)

This repository contains the configuration files, scripts
and documentation for deployment of GN2.

## Introduction

GN2 and all dependencies are installed via GNU Guix.

Installation of GN2 is documented in the genenetwork2
[repository](https://github.com/genenetwork/genenetwork2/blob/master/doc/README.org).

For deployment of GN2 on the webservers (penguin and penguin2), see
[penguins](./doc/gn2_on_penguin.org).

For deployment of system tools on the webservers (penguin and penguin2), see
[penguins](./doc/system_tools.org).

## Configuration

We currently use the 'deploy' tool. Run it with something like

    /home/pjotr/izip/git/opensource/ruby/deploy/bin/deploy  /home/pjotr/izip/git/deploy/gn-deploy-servers/
    systemctl daemon-reload 
    systemctl enable nginx

## Access

All machines are inside the UT network and can only be reached through
VPN from outside. The machines themselves have ssh access.

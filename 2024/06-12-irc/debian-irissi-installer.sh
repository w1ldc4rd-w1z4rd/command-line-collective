#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install perl -y
sudo apt install cpanminus -y

read -r -d '' CMDS <<'CMDS'
sudo apt install irssi -y
irssi -c '/quit'
CMDS

echo $CMDS | perl  -MTerm::ANSIColor=':constants' -snlE 'map { say BOLD GREEN qq|> $_|, RESET; system $_ } split ( qr|\n|, $cmds )' -- -cmds="$CMDS"

sudo apt autoremove -y

perl -MTerm::ANSIColor=:constants -i.$(date +%s).bak -ple '$re = qq| {\n address = "clc.onl";\n chatnet = "clc";\n port = "443";\n use_ssl = "yes";\n ssl_verify = "no";\n autoconnect = "yes";\n },|; s~servers = \(~qq|${&}\n${re}|~e;' $HOME/.irssi/config

perl -MTerm::ANSIColor=:constants -se 'print BOLD BLUE q|> nickname: |, RESET; chomp ( $nick = <STDIN> ); system qq|$cmd $nick|' -- -cmd='irssi -c clc.onl -p 6969 -n'
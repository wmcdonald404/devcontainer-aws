#!/usr/bin/env bash
dnf -y install git gh glab awscli2
dnf -y update 

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
sed -ie 's/^OSH_THEME="font"/# OSH_THEME="font"/' ~/.bashrc

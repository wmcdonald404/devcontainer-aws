#!/usr/bin/env bash

# Baseline AWS tooling and quality-of-life bits
dnf -y install awscli2 bash-completion gh git glab 
dnf -y update 

# Install Oh-My-Bash and disable the default theme
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
sed -ie 's/^OSH_THEME="font"/# OSH_THEME="font"/' ~/.bashrc

# auto-create aliases to export AWS_PROFILE for each configured AWS CLI profile
cat > /etc/profile.d/awsprofiles.sh <<EOF
for profile in \$(aws configure list-profiles | grep -v default)
do
  alias \$profile="export AWS_PROFILE=\$profile"
done
EOF

ln -s /etc/profile.d/awsprofiles.sh /root/.oh-my-bash/custom/
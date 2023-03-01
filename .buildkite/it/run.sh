sudo apt-get update && sudo apt-get install -y \
    curl git make jq docker \
    openjdk-17-jdk openjdk-11-jdk \
    zlib1g zlib1g-dev libssl-dev libbz2-dev libsqlite3-dev
export JAVA11_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export JAVA17_HOME=/usr/lib/jvm/java-17-openjdk-amd64
# Allow using docker command without root
sudo usermod -aG docker "$USER"
newgrp docker

curl -sL https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
export PATH=~/.pyenv/bin:$PATH
eval "$(pyenv init --path)"

python3 -m venv .venv
source .venv/bin/activate
pip install nox

nox -s "$1"

#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Run the following so apt-get can find python3-dev
sudo apt-get update

sudo apt-get install python3-dev

pip3 install torch torchvision

# may need to run something like the following to get mps support
#pip3 install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cpu

sudo apt-get install python3-matplotlib


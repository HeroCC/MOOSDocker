FROM ubuntu:18.04
LABEL maintainer = Conlan Cesar <conlanc@gmail.com>

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Bring image up to date
RUN apt update -y && apt upgrade -y

# Install required MOOS dependencies
RUN apt install -y cmake build-essential subversion libtiff5-dev libfltk1.3-dev freeglut3-dev libpng-dev libjpeg-dev libxinerama-dev libxft-dev libtiff5-dev

# Make a user to run the MOOS apps
RUN useradd -m -p "moos" moos && usermod -a -G sudo moos

# Set the default user
USER moos

# Set the default entry dirctory to the moos user's home
WORKDIR "/home/moos"

# Check-out the MOOS-IvP trunk
RUN svn co https://oceanai.mit.edu/svn/moos-ivp-aro/trunk /home/moos/moos-ivp

# Build the MOOS-IvP tools
RUN cd "$HOME/moos-ivp" && ./build.sh

# Add MOOS variables to the env
ENV PATH="/home/moos/moos-ivp/bin:${PATH}"
ENV IVP_BEHAVIORS_DIRS="/home/moos/moos-ivp/lib"

FROM ubuntu:18.04 as build
LABEL maintainer = Conlan Cesar <conlanc@csail.mit.edu>

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Install required MOOS dependencies
RUN apt-get update -y && apt-get install -y cmake build-essential subversion libfltk1.3-dev freeglut3-dev libpng-dev libjpeg-dev libxinerama-dev libxft-dev libtiff5-dev && apt-get clean

# Check-out the MOOS-IvP trunk
RUN svn co https://oceanai.mit.edu/svn/moos-ivp-aro/trunk /home/moos/moos-ivp

# Build the MOOS-IvP tools
RUN cd "$HOME/moos-ivp" && ./build.sh


# Runtime image
FROM ubuntu:18.04
LABEL maintainer = Conlan Cesar <conlanc@csail.mit.edu>

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Runtime deps
RUN apt-get update && apt-get install -y netbase libfltk1.3 freeglut3 libpng16-16 libjpeg8 libxinerama1 libtiff5 && apt-get clean

# Make a user to run the MOOS apps
RUN useradd -m -p "moos" moos && usermod -a -G sudo moos

# Set the default user
USER moos

# Set the default entry dirctory to the moos user's home
WORKDIR "/home/moos"

# Add MOOS variables to the env
ENV PATH="/home/moos/moos-ivp/bin:${PATH}"
ENV IVP_BEHAVIOR_DIRS="/home/moos/moos-ivp/lib"

# Copy built moos-ivp
COPY --from=build --chown=moos:moos /moos-ivp "${HOME}/moos-ivp"


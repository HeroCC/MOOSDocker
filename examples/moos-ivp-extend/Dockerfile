# File created by Conlan Cesar @ MIT
# This file should be used as a template for your extend trees, tweak it as you see fit

FROM moosivp/moos-ivp:trunk

# Replace this label with yourself
LABEL maintainer = Conlan Cesar <conlanc@csail.mit.edu> 

# Change this to the name of your extend tree
ENV MOOS="moos-ivp-extend"

# Adds the bin/ to path and lib/ to behaviors dir
ENV PATH="/home/moos/${MOOS}/bin:${PATH}"
ENV IVP_BEHAVIOR_DIRS="${IVP_BEHAVIOR_DIRS}:/home/moos/${MOOS}/lib"

# Uncomment your implementation accordingly. COPY recommended
#COPY --chown=moos:moos "." "${HOME}/${MOOS}/"
RUN svn co "https://oceanai.mit.edu/svn/${MOOS}-aro/trunk" "${HOME}/${MOOS}" 

# Build 
RUN cd "${HOME}/${MOOS}" && ./build.sh


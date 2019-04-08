FROM moos-ivp:testing
LABEL maintainer = Conlan Cesar <conlanc@gmail.com>

ENV MOOS="moos-ivp-aquaticus"

USER root
RUN apt-get install -y libncurses-dev && apt-get clean
RUN apt-get install -y vim
USER moos

RUN svn co "https://oceanai.mit.edu/svn/${MOOS}-aro/trunk" "${HOME}/${MOOS}"

RUN cd "${HOME}/${MOOS}" && ./build.sh

ENV PATH="/home/moos/${MOOS}/bin:${PATH}"
ENV IVP_BEHAVIOR_DIRS="${IVP_BEHAVIOR_DIRS}:/home/moos/${MOOS}/lib"

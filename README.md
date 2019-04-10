# Example Scenario: Networked Docker containers for Shoreside & Heron

Start off by building both images:

```bash
$ cd docker/moos-ivp && docker build --no-cache . -t moos-ivp:testing && cd ../moos-ivp-aquaticus && docker build --no-cache . -t moos-ivp-aquaticus:testing
```

Optionally but reccomended, create a new network just for your MOOS applications. You only need to do this once on your computer.

```bash
$ docker network create moos
```

Next, start up new containers for shoreside and each vehicle (run each command in seperate terminals). Run this command once for shoreside, and additionally for each new vehicle. Omit the `--rm` if you don't want to delete the containers on exit.

```bash
$ docker run -t -i --net=moos --name=moos-ivp-aquaticus-{SHORESIDE,VEHICLE,ETC} --rm moos-ivp-aquaticus:testing bash
```

Then, ensure that the mission you are running has multicast enabled (or manually specify the IPs for your containers). For example, for the alpha mission shoreside run `cd moos-ivp-aquaticus/missions/alpha/ && vim meta_shoreside.moos` and uncomment the line that reads `input = route =  multicast_7` in pShare's ProcessConfig. On each vehicle, edit the `plug_uFldNodeBroker.moos` file and the line `TRY_SHORE_HOST = pshare_route=multicast_7`.

Finally, now that your missions are ready, you can launch your nodes (`./launch_shoreside.sh`, then `./launch_m200.sh -s` on each vehicle). Collect your data, upload it to a mount or network location, and exit the container.



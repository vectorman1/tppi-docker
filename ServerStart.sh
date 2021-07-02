#!/bin/sh

java -Xmx3200M -Xms1024M -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:PermSize=128m -XX:ParallelGCThreads=2 -XX:+AggressiveOpts -jar minecraft_server.jar nogui
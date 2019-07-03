#!/bin/bash
case "$1" in 
start)
   /root/jenkins-slave.sh &
   echo $!>/root/jenkins-slave.pid
   ;;
stop)
   kill `cat /root/jenkins-slave.pid`
   rm /root/jenkins-slave.pid
   ;;
restart)
   $0 stop
   $0 start
   ;;
status)
   if [ -e /root/jenkins-slave.pid ]; then
      echo jenkins-slave is running, pid=`cat /root/jenkins-slave.pid`
   else
      echo jenkins-slave is NOT running
      exit 1
   fi
   ;;
*)
   echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 
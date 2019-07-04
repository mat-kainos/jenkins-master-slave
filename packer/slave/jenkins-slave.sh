#!/bin/bash
WORK_DIR="/tmp"
case "$1" in 
start)
   $WORK_DIR/jenkins-slave-exec.sh &
   echo $!>$WORK_DIR/jenkins-slave.pid
   ;;
stop)
   kill `cat $WORK_DIR/jenkins-slave.pid`
   rm $WORK_DIR/jenkins-slave.pid
   ;;
restart)
   $0 stop
   $0 start
   ;;
status)
   if [ -e $WORK_DIR/jenkins-slave.pid ]; then
      echo jenkins-slave is running, pid=`cat $WORK_DIR/jenkins-slave.pid`
   else
      echo jenkins-slave is NOT running
      exit 1
   fi
   ;;
*)
   echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 
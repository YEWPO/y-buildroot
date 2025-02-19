#!/bin/sh
# Buildroot init script that creates a macvtap interface, allowing to use the
# same host and guest network.

case "$1" in
  start)
	printf "Setting up macvtap... "
	ip link add link eth0 name macvtap0 type macvtap
	[ $? != 0 ] && echo "FAIL" && exit 1
	ip link set macvtap0 up
	[ $? = 0 ] && echo "OK" || echo "FAIL"
	;;
  stop)
	printf "Destroying macvtap... "
	ip link del macvtap0
	[ $? = 0 ] && echo "OK" || echo "FAIL"
	;;
  restart|reload)
	"$0" stop
	"$0" start
	;;
  *)
	echo "Usage: $0 {start|stop|restart}"
	exit 1
esac

exit $?

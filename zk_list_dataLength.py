#!/usr/bin/python2.7

from kazoo.client import KazooClient
import time

zk = KazooClient(hosts='10.0.0.47:2181')
zk.start()
print "start ..."

start = '/'

def list_znode(root):
    current_level_list = zk.get_children(root)
    for node in current_level_list:
        if root != '/':
            new_root = root + '/' + node
        else:
            new_root = '/' + node

        if len(zk.get_children(new_root)) > 0:
            list_znode(new_root)
        else:
            value = zk.get(new_root)[1].dataLength
            if value > 1000:
                print new_root + ': ' + str(value)
            time.sleep(0.1)

list_znode(start)

zk.stop()
print "stop."

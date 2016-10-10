#!/usr/bin/python

import pika

credentials = pika.PlainCredentials('user', 'password')
connect = pika.ConnectionParameters('10.0.0.1', 5672, '/', credentials)
connection = pika.BlockingConnection(connect)

channel = connection.channel()

channel.basic_publish(exchange='',
                      routing_key='queue.name',
                      body='test_message')
connection.close()

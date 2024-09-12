#!/bin/bash

function ping() {
  curl --silent --header 'Accept: text/plain' http://web:3000/ping
}

ping
timeout 3s curl --silent --header 'Accept: text/plain' http://web:3000/stream
ping


#!/bin/bash

function _main 
{
  local DEVICE_ID="8086"

  if lsusb | awk -F' ' '{print $6}' | grep -q $DEVICE_ID; then
    echo "Device found: $DEVICE_ID"
    exit 0  
  else
    echo "Device not found: $DEVICE_ID"
    exit 1 
  fi
}

_main "$@"

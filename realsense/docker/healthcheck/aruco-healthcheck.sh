#!/bin/bash

function _main 
{
  source /opt/ros/noetic/setup.bash
  local TOPICS="/aruco"

  if rostopic list | grep -q $TOPICS; then
    echo "Topics found: $TOPICS"
    exit 0  
  else
    echo "Topics not found: $TOPICS"
    exit 1 
  fi
}

_main "$@"

#!/bin/bash

InfoLog() {
  echo "`date +%F\ %T` INFO: $@"
}

ITERATIONS=5
COUNT=0
while [ $COUNT -ne $ITERATIONS ]; do
  (( COUNT++ ))
  InfoLog "Running iteration $COUNT of $ITERATIONS..."
  sleep 5
done

InfoLog "Done!"

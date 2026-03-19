#!/usr/bin/env bash

echo "=== Checking domains ==="

check () {
  name=$1
  url=$2

  status=$(curl --max-time 5 -o /dev/null -s -w "%{http_code}" "$url")

  if [[ "$status" == "200" || "$status" == "301" || "$status" == "302" ]]; then
    echo "✅ OK: $name"
  else
    echo "❌ FAIL: $name (HTTP $status)"
  fi
}

check docs.ros.org https://docs.ros.org
check index.ros.org https://index.ros.org
check gazebosim.org https://gazebosim.org
check github.com https://github.com
check api.github.com https://api.github.com/repos/ros2/ros2
check raw.githubusercontent.com https://raw.githubusercontent.com/ros2/ros2/rolling/README.md
check discourse.openrobotics.org https://discourse.openrobotics.org/latest.json
check robotics.stackexchange.com https://robotics.stackexchange.com/questions

echo "=== Done ==="
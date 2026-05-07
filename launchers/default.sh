#!/bin/bash
source /environment.sh
dt-launchfile-init

GPU_SERVER_IP="${GPU_SERVER_IP:-127.0.0.1}"
GPU_SERVER_PORT="${GPU_SERVER_PORT:-5001}"
GPU_FRAME_RATE="${GPU_FRAME_RATE:-15.0}"

echo "VEHICLE_NAME=$VEHICLE_NAME"
echo "GPU_SERVER_IP=${GPU_SERVER_IP}"
echo "GPU_SERVER_PORT=${GPU_SERVER_PORT}"
echo "GPU_FRAME_RATE=${GPU_FRAME_RATE}"


dt-exec rosrun my_package vehicle_client.py \
  _gpu_ip:="${GPU_SERVER_IP}" \
  _gpu_port:="${GPU_SERVER_PORT}" \
  _frame_rate:="${GPU_FRAME_RATE}"


dt-exec rosrun my_package vehicle_local_inference.py



dt-launchfile-join

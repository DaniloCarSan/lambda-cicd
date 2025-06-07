#!/bin/bash
# Código responsável por verificar se a lambda está em processo
# de atualização do código

STATE=$(aws lambda get-function --function-name "$1" --query 'Configuration.LastUpdateStatus' --output text)
while [[ "$STATE" == "InProgress" ]]; do
  echo "sleep 5sec ...."
  sleep 5s
  STATE=$(aws lambda get-function --function-name "$1" --query 'Configuration.LastUpdateStatus' --output text)
  echo $STATE
done
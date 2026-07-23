#!/bin/bash

DATE_TAG=$(date +"%d_%m_%H%M%S")
LOG_DIR="logs_${DATE_TAG}"

mkdir -p "$LOG_DIR"

collect_logs() {
  local NAMESPACE=$1
  local POD_PREFIX=$2
  local LOG_PREFIX=$3

  echo "Collecting logs for $LOG_PREFIX..."

  PODS=$(kubectl get pods -n "$NAMESPACE" --no-headers -o custom-columns=":metadata.name" | grep "^$POD_PREFIX")

  if [ -z "$PODS" ]; then
    echo "No pods found with prefix '$POD_PREFIX' in namespace '$NAMESPACE'"
    return 1
  fi

  INDEX=1
  for POD in $PODS; do
    LOG_FILE="${LOG_DIR}/${LOG_PREFIX}_${DATE_TAG}_${INDEX}.log"
    echo "Fetching logs for pod: $POD -> $LOG_FILE"
    kubectl logs "$POD" -n "$NAMESPACE" > "$LOG_FILE" 2>&1
    ((INDEX++))
  done
}

collect_logs \
  "laa-crown-court-remuneration-production" \
  "laa-crown-court-remuneration" \
  "ccr_prod"

collect_logs \
  "laa-crown-court-litigator-fees-production" \
  "laa-crown-court-litigator-fees" \
  "cclf_prod"

echo "Log collection complete. Logs saved to: $LOG_DIR"

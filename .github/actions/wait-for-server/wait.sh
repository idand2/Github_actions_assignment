#!/bin/bash
echo "Waiting for server at ${WAIT_URL}..."

end_time=$((SECONDS + WAIT_TIMEOUT))

while [ $SECONDS -lt $end_time ]; do
  # The >/dev/null redirects the body output.
  if curl -sf "${WAIT_URL}" >/dev/null; then
    echo "✅ Server is up and responding!"
    exit 0
  fi
  echo "Server not yet available. Waiting ${WAIT_INTERVAL} seconds..."
  sleep "${WAIT_INTERVAL}"
done

echo "❌ ERROR: Server did not become available within ${WAIT_TIMEOUT} seconds."
exit 1

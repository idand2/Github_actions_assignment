#!/bin/bash

# Set message content 
if [[ "${JOB_STATUS}" == "success" ]]; then
  MESSAGE_HEADER="✅ Workflow Succeeded: ${GITHUB_WORKFLOW}"
  BUTTON_STYLE="primary"
elif [[ "${JOB_STATUS}" == "waiting" ]]; then # ADDED THIS BLOCK
  MESSAGE_HEADER="⏳ Waiting for Approval: ${GITHUB_WORKFLOW}"
  BUTTON_STYLE="primary"
else
  MESSAGE_HEADER="❌ Workflow Failure: ${GITHUB_WORKFLOW}"
  BUTTON_STYLE="danger"
fi

# Construct the JSON payload
MESSAGE_JSON=$(cat <<EOF
{
  "blocks": [
    {
      "type": "header",
      "text": { "type": "plain_text", "text": "${MESSAGE_HEADER}" }
    },
    {
      "type": "section",
      "fields": [
        { "type": "mrkdwn", "text": "*Repo:*\n<https://github.com/${GITHUB_REPOSITORY}|${GITHUB_REPOSITORY}>" },
        { "type": "mrkdwn", "text": "*Commit:*\n<https://github.com/${GITHUB_REPOSITORY}/commit/${GITHUB_SHA}|${GITHUB_SHA::7}>" }
      ]
    },
    {
      "type": "actions",
      "elements": [
        {
          "type": "button",
          "text": { "type": "plain_text", "text": "View Run" },
          "style": "${BUTTON_STYLE}",
          "url": "https://github.com/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}"
        }
      ]
    }
  ]
}
EOF
)

# Send the notification using curl
echo "Sending notification to Slack..."
curl -X POST \
     -H "Content-type: application/json" \
     --data "${MESSAGE_JSON}" \
     "${SLACK_WEBHOOK_URL}"
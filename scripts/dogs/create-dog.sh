#!/bin/bash

curl "http://localhost:4741/dogs" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "dog": {
      "breed": "Yorkie",
      "size": "Small",
      "fur": "Medium",
      "user_id": 1
    }
  }'

echo

#!/bin/bash

curl "http://localhost:4741/dogs/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "dog": {
      "breed": "Pitbull",
      "size": "Large",
      "fur": "Short",
      "user_id": 1
    }
  }'

echo

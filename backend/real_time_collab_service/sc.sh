#!/bin/bash

USER_ID_1="605c72e4a4f1a53f4f8b4567"  # Example ObjectId for User 1
USER_ID_2="605c72e4a4f1a53f4f8b4568"  # Example ObjectId for User 2
TASK_ID="1234567890abcdef12345678"   # Example TaskId

curl -X POST http://localhost:5000/api/comments \
-H "Content-Type: application/json" \
-d "{\"taskId\": \"$TASK_ID\", \"userId\": \"$USER_ID_1\", \"content\": \"First comment from User 1.\"}" 
& curl -X POST http://localhost:5000/api/comments \
-H "Content-Type: application/json" \
-d "{\"taskId\": \"$TASK_ID\", \"userId\": \"$USER_ID_2\", \"content\": \"Second comment from User 
2.\"}" 


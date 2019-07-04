#!/bin/bash
USER="test"
PWD=$(openssl rand -base64 32)

echo "$USER" > user.sensitive
echo "$PWD" > pwd.sensitive


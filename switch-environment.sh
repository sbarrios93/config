#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <work|personal>"
	exit 1
fi

environment=$1

if [ "$environment" != "work" ] && [ "$environment" != "personal" ]; then
	echo "Invalid environment. Use 'work' or 'personal'."
	exit 1
fi

echo "Switching to $environment environment..."

cat >vars/environments/default.nix <<EOF
{
  environment = "$environment";
}
EOF

echo "Environment switched to $environment."

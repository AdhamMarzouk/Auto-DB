#!/bin/bash

cd infrastructure
EIP=$(terraform output -raw database_server_eip)

cd ..
INVENTORY="ansible_automation/inventory.ini"

cat > $INVENTORY <<EOF
[database-servers] 
$EIP
EOF
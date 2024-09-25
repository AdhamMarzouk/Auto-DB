#!/bin/bash

EIP=$(terraform output -raw database_server_eip)

INVENTORY="ansible_automation/inventory.ini"

cat > $INVENTORY <<EOF
[database-servers] 
$EIP
EOF
#!/usr/bin/env bash

#cd ~/Desktop/Unita/unita-0.16.0 2/bin


node script.js

#privkeys=`cat addr.json | jq -r '.privkeys'`
#privkeys_array[1]=`cat addr.json | jq -r '.privkeys[1]'`
#privkeys_array[2]=`cat addr.json | jq -r '.privkeys[2]'`
#privkeys_array[3]=`cat addr.json | jq -r '.privkeys[3]'`
#privkeys_array[4]=`cat addr.json | jq -r '.privkeys[4]'`

#addrs=`cat addr.json | jq -r '.addrs'`
#addrs_array[1]=`cat addr.json | jq -r '.addrs[1]'`
#addrs_array[2]=`cat addr.json | jq -r '.addrs[2]'`
#addrs_array[3]=`cat addr.json | jq -r '.addrs[3]'`
#addrs_array[4]=`cat addr.json | jq -r '.addrs[4]'`

#privkeys_array=`cat addr.json | jq -r '.privkeys'`
#addrs_array=`cat addr.json | jq -r '.addrs'`

chainName=`cat addr.json | jq -r '.name'`

~/Desktop/unita-0.16.0/bin/unitad -chain=${chainName} -rpcport=23889 -rpcuser=unita -rpcpassword=unita -daemon

success=`cat addr.json | jq -r '.success'`

if ${success}; then
    export ADDR=`cat addr.json | jq -r '.addr'`
    export PRIVKEY=`cat addr.json | jq -r '.privkey'`
    echo $ADDR
    echo $PRIVKEY
    sleep 30s
    # wait for block index
    ~/Desktop/unita-0.16.0/bin/unita-cli -rpcport=23889 -rpcuser=unita -rpcpassword=unita importprivkey $PRIVKEY
    ~/Desktop/unita-0.16.0/bin/unita-cli -rpcport=23889 -rpcuser=unita -rpcpassword=unita setpoaminer $ADDR
fi

#if [$POD_NAME == 'unita-0' && ${privkeys_array[0]} != '0' && ${addrs_array[0]} != '0']; then
#   ./unita-cli -rpcport=23889 -rpcuser=unita -rpcpassport=unita importprivkey ${privkeys_array[0]}
#   ./unita-cli -rpcport=23889 -rpcuser=unita -rpcpassport=unita setpoaminer ${addrs_array[0]}
#fi
#if [$POD_NAME == 'unita-1' && ${privkeys_array[1]} != '0' && ${addrs_array[1]} != '0']; then
#   ./unita-cli -rpcport=23889 -rpcuser=unita -rpcpassport=unita importprivkey ${privkeys_array[1]}
#   ./unita-cli -rpcport=23889 -rpcuser=unita -rpcpassport=unita setpoaminer ${addrs_array[1]}
#fi
#if [$POD_NAME == 'unita-2' && ${privkeys_array[2]} != '0' && ${addrs_array[2]} != '0']; then
#   ./unita-cli -rpcport=23889 -rpcuser=unita -rpcpassport=unita importprivkey ${privkeys_array[2]}
#   ./unita-cli -rpcport=23889 -rpcuser=unita -rpcpassport=unita setpoaminer ${addrs_array[2]}
#fi
#if [$POD_NAME == 'unita-3' && ${privkeys_array[3]} != '0' && ${addrs_array[3]} != '0']; then
#   ./unita-cli -rpcport=23889 -rpcuser=unita -rpcpassport=unita importprivkey ${privkeys_array[3]}
#   ./unita-cli -rpcport=23889 -rpcuser=unita -rpcpassport=unita setpoaminer ${addrs_array[3]}
#fi
#if [$POD_NAME == 'unita-4' && ${privkeys_array[4]} != '0' && ${addrs_array[4]} != '0']; then
#   ./unita-cli -rpcport=23889 -rpcuser=unita -rpcpassport=unita importprivkey ${privkeys_array[4]}
#   ./unita-cli -rpcport=23889 -rpcuser=unita -rpcpassport=unita setpoaminer ${addrs_array[4]}
#fi

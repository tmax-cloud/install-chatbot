#!/bin/bash
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $SCRIPTDIR

#  Install Chatbot
echo " "
echo "---Installation Start---"
echo " "
echo "---1. Install custom langugae server---"
kubectl apply -f 2.custom-language-server.yaml

while [ \"$(kubectl get pod -n chatbot -l app=chatbot-nlu-korean -o=jsonpath='{.items[0].status.phase}')\" != \"Running\" ]
do 
echo 'waiting for korean language server to start.....' 
sleep 10s
done 
echo 'korean language server is running' 
sleep 5s

echo "---5. Install chatbot server---"
kubectl apply -f 1.botpress.yaml




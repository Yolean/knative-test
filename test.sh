#!/bin/bash

ISTIO_HOST=$(minikube ip):$(kubectl get svc knative-ingressgateway -n istio-system -o 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')
HOST_URL=$(kubectl get services.serving.knative.dev helloworld-go -n getting-started -o jsonpath='{.status.domain}')
curl -H "Host: ${HOST_URL}" http://${ISTIO_HOST}

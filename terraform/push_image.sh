#!/bin/bash

# Variables
ACR_NAME=$ACR_NAME
IMAGE_NAME=$IMAGE_NAME
IMAGE_TAG=$IMAGE_TAG

# Obtener el login server del ACR
ACR_LOGIN_SERVER=$(az acr show --name $ACR_NAME --query loginServer --output tsv)
# Iniciar sesión en el ACR
az acr login --name $ACR_NAME

# Tirar la imagen desde Docker Hub
podman pull $IMAGE_NAME:$IMAGE_TAG

# Etiquetar la imagen para el ACR
podman tag $IMAGE_NAME:$IMAGE_TAG $ACR_LOGIN_SERVER/$IMAGE_NAME:$IMAGE_TAG

# Empujar la imagen al ACR
podman push $ACR_LOGIN_SERVER/$IMAGE_NAME:$IMAGE_TAG

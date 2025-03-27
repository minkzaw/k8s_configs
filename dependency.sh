# Install Kyverno
helm install kyverno kyverno/kyverno -n kyverno --create-namespace --wait-for-jobs

# Install flux
helm install -n flux-system --create-namespace flux oci://ghcr.io/fluxcd-community/charts/flux2

# Install flux CLI
curl -s https://fluxcd.io/install.sh | sudo bash

# Export the username and token
export GITHUB_TOKEN=$(cat /Users/minkhantzaw/Documents/.credentials/flux_github_token) && echo $GITHUB_TOKEN
export GITHUB_USER=minkzaw && echo $GITHUB_USER

# Bootstrap flux
flux bootstrap github \
    --owner=$GITHUB_USER \
    --repository=k8s_configs \
    --path=./clusters/docker-desktop \
    --personal
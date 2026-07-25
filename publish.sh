#!/usr/bin/env bash
#
# Publie l'image française sur GHCR (ghcr.io/silvers12/yamtrack).
# À utiliser tant que les GitHub Actions sont indisponibles (build manuel).
#
# Prérequis (une seule fois) :
#   docker login ghcr.io -u Silvers12      # coller un token avec le scope write:packages
#
# Usage :
#   ./publish.sh
#
set -euo pipefail
cd "$(dirname "$0")"

IMAGE="ghcr.io/silvers12/yamtrack"
VERSION="$(git describe --tags 2>/dev/null || echo dev)"

echo "==> Build de $IMAGE  (VERSION=$VERSION)"
docker build --build-arg VERSION="$VERSION" \
  -t "$IMAGE:i18n-fr" \
  -t "$IMAGE:${VERSION}-fr" \
  .

echo "==> Push vers GHCR"
docker push "$IMAGE:i18n-fr"
docker push "$IMAGE:${VERSION}-fr"

echo
echo "==> OK : $IMAGE:i18n-fr  (et :${VERSION}-fr)"
echo "    Les utilisateurs mettent à jour avec :"
echo "    docker compose -f docker-compose.fr.yml pull && docker compose -f docker-compose.fr.yml up -d"
echo
echo "Note : image mono-plateforme (amd64). Pour un build multi-arch (amd64+arm64),"
echo "utilise buildx :  docker buildx build --platform linux/amd64,linux/arm64 --push -t \"$IMAGE:i18n-fr\" ."

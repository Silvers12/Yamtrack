#!/usr/bin/env bash
#
# Met à jour le fork sur la dernière version STABLE d'upstream (upstream/release)
# et régénère les catalogues de traduction français.
#
# À lancer depuis le dossier du dépôt :  ./update.sh
# Ensuite : traduire les nouvelles chaînes, puis ./publish.sh
#
set -euo pipefail
cd "$(dirname "$0")"

IMG="yamtrack-fr:build"
LOCALE_HOST="$PWD/src/locale"

echo "==> 1/4  Récupération d'upstream"
git remote get-url upstream >/dev/null 2>&1 || {
  echo "❌ Le remote 'upstream' n'existe pas. Ajoute-le :"
  echo "   git remote add upstream https://github.com/FuzzyGrim/Yamtrack.git"
  exit 1
}
git fetch upstream

echo "==> 2/4  Rebase de 'main' sur upstream/release (dernière version stable)"
git checkout main
if ! git rebase upstream/release; then
  echo
  echo "⚠️  Conflits à résoudre à la main (upstream a modifié des lignes que tu as traduites) :"
  echo "     1. édite les fichiers en conflit"
  echo "     2. git add <fichiers>  &&  git rebase --continue"
  echo "     (pour tout annuler :  git rebase --abort)"
  echo "     Puis relance ./update.sh"
  exit 1
fi

echo "==> 3/4  Build de l'image (pour gettext) + extraction des chaînes (makemessages)"
VERSION="$(git describe --tags 2>/dev/null || echo dev)"
docker build --build-arg VERSION="$VERSION" -t "$IMG" .
docker run --rm -v "$LOCALE_HOST:/yamtrack/locale" -w /yamtrack "$IMG" \
  python manage.py makemessages -l fr --ignore=.venv --ignore=staticfiles
docker run --rm -v "$LOCALE_HOST:/yamtrack/locale" -w /yamtrack "$IMG" \
  python manage.py makemessages -d djangojs -l fr \
  --ignore=.venv --ignore=staticfiles --ignore=static/js/libraries

echo "==> 4/4  État des catalogues (traduit / à traduire)"
for f in django djangojs; do
  printf '    %-9s : ' "$f.po"
  docker run --rm -v "$LOCALE_HOST:/loc" "$IMG" \
    msgfmt --statistics "/loc/fr/LC_MESSAGES/$f.po" -o /dev/null 2>&1 || true
done

cat <<EOF

────────────────────────────────────────────────────────────
À faire maintenant :
  1. Traduire les nouvelles chaînes (les 'msgstr ""') dans :
       src/locale/fr/LC_MESSAGES/django.po
       src/locale/fr/LC_MESSAGES/djangojs.po
     Astuce : vérifie qu'aucun placeholder %(...)s ne manque.
  2. Publier l'image :        ./publish.sh
  3. Pousser la branche :     git push --force-with-lease origin main
  4. Mettre à jour ta propre instance :
       cd /opt/Yamtrack && docker compose up -d
────────────────────────────────────────────────────────────
EOF

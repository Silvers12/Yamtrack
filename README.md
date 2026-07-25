# 🇫🇷 Yamtrack — version française

![Licence](https://img.shields.io/badge/licence-AGPL--3.0-blue)

Fork **entièrement traduit en français** de [Yamtrack](https://github.com/FuzzyGrim/Yamtrack), un **tracker de médias auto-hébergé** : films, séries, animés, mangas, jeux vidéo, livres, BD et jeux de société. Toute l'interface est en français — menus, statuts, types de média, fiches détaillées, statistiques et messages.

> ℹ️ Le projet d'origine est développé par [FuzzyGrim](https://github.com/FuzzyGrim/Yamtrack). Ce dépôt n'ajoute que la **traduction française** — tout le crédit de l'application revient à l'auteur original.

## 🚀 Installation rapide (Docker)

Prérequis : **Docker** et **Docker Compose**.

> ⚠️ **Architecture : l'image est publiée en `amd64` uniquement.**
> Elle fonctionne sur la plupart des serveurs et PC (Intel/AMD), mais **pas nativement sur ARM** (Raspberry Pi, Mac Apple Silicon, etc.). Sur ARM, il faudrait construire une image multi-plateforme (voir `publish.sh`).

```bash
mkdir yamtrack && cd yamtrack
curl -O https://raw.githubusercontent.com/Silvers12/Yamtrack/main/docker-compose.fr.yml
```

Ouvrez `docker-compose.fr.yml`, remplacez `REMPLACE_MOI_par_une_chaine_aleatoire` par une clé secrète (générez-la avec `openssl rand -base64 48`), puis lancez :

```bash
docker compose -f docker-compose.fr.yml up -d
```

Ouvrez ensuite **http://IP_DU_SERVEUR:8000** dans votre navigateur et créez votre compte. L'interface est en français. 🇫🇷

## 🔄 Mise à jour

```bash
docker compose -f docker-compose.fr.yml pull && docker compose -f docker-compose.fr.yml up -d
```

Vos données (comptes, suivis) sont stockées dans `./db` et ne sont **jamais perdues** lors d'une mise à jour.

## ⚙️ Configuration

- `LANGUAGE_CODE=fr` fixe la langue de l'interface, `TMDB_LANG=fr` celle des fiches films/séries.
- Les autres variables (domaine public via `URLS`, sous-chemin via `BASE_URL`, base PostgreSQL, clés API…) sont décrites dans la [documentation officielle](https://fuzzygrim.github.io/Yamtrack/) (en anglais).

## ✨ Fonctionnalités

- 🎬 Suivez films, séries, animés, mangas, jeux vidéo, livres, BD et jeux de société.
- 📺 Suivez chaque saison d'une série individuellement, ainsi que les épisodes vus.
- ⭐ Enregistrez note, statut, progression, visionnages/lectures répétés, dates de début et de fin, ou ajoutez une note personnelle.
- 📈 Conservez un historique de suivi pour chaque action (ajout, début, reprise…).
- ✏️ Créez des entrées personnalisées pour les médias introuvables via les API prises en charge.
- 📂 Créez des listes personnelles pour organiser vos médias, et invitez d'autres membres à collaborer.
- 📅 Gardez un œil sur vos sorties à venir grâce à un calendrier, abonnable dans des applications externes via une URL iCalendar (.ics).
- 🔔 Recevez des notifications de sorties à venir via Apprise (Discord, Telegram, ntfy, Slack, e-mail, et bien d'autres).
- 🐳 Déploiement facile avec Docker (docker-compose), en SQLite ou PostgreSQL.
- 👥 Multi-utilisateurs : comptes individuels avec suivi personnalisé.
- 🔑 Authentification flexible : OIDC et plus de 100 fournisseurs sociaux (Google, GitHub, Discord…) via django-allauth.
- 🦀 Intégration avec [Jellyfin](https://jellyfin.org/), [Plex](https://plex.tv/) et [Emby](https://emby.media/) pour suivre automatiquement les nouveaux médias visionnés.
- 📥 Import depuis [Trakt](https://trakt.tv/), [Simkl](https://simkl.com/), [MyAnimeList](https://myanimelist.net/), [AniList](https://anilist.co/) et [Kitsu](https://kitsu.app/), avec prise en charge des imports automatiques périodiques.
- 📊 Exportez tous vos médias suivis dans un fichier CSV, et réimportez-le.

## 📱 Captures d'écran

| Accueil                                                                                        | Calendrier                                                                                  |
| ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/homepage.png?v2" alt="Accueil" />  | <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/calendar.png" alt="Calendrier" /> |

| Liste (grille)                                                                                     | Liste (tableau)                                                                                      |
| -------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/medialist_grid.png" alt="Liste grille" /> | <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/medialist_table.png" alt="Liste tableau" /> |

| Fiche détaillée                                                                                       | Suivi                                                                                       |
| ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/media_details.png" alt="Fiche détaillée" /> | <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/tracking.png" alt="Suivi" />     |

| Détails de saison                                                                                       | Suivi des épisodes                                                                                           |
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/season_details.png" alt="Détails de saison" /> | <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/tracking_episode.png" alt="Suivi des épisodes" /> |

| Listes                                                                                | Statistiques                                                                                    |
| ------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/lists.png" alt="Listes" /> | <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/statistics.png" alt="Statistiques" /> |

| Création d'entrées manuelles                                                                                  | Import de données                                                                                 |
| ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/create_custom.png" alt="Création manuelle" />     | <img src="https://cdn.fuzzygrim.com/file/fuzzygrim/yamtrack/import_data.png" alt="Import de données" /> |

## 🛠️ Pour le mainteneur du fork

La traduction vit dans les catalogues `src/locale/fr/` (deux domaines : `django` et `djangojs`). Pour reconstruire et publier l'image française sur GHCR :

```bash
docker login ghcr.io -u Silvers12   # une fois, token avec le scope write:packages
./publish.sh
```

Lors d'une nouvelle version de Yamtrack : `git fetch upstream`, rebaser la branche `main` sur `upstream/release` (la branche stable d'upstream, qui suit la dernière version publiée), régénérer les catalogues (`makemessages` pour les deux domaines `django` et `djangojs`), traduire les nouvelles chaînes, puis `./publish.sh`.

## 💪 Soutenir le projet d'origine

Yamtrack est développé par **FuzzyGrim**. Pour le soutenir :

- ⭐ Mettez une étoile au [dépôt d'origine](https://github.com/FuzzyGrim/Yamtrack).
- 🐛 Signalez les bugs de l'**application** via les [issues d'origine](https://github.com/FuzzyGrim/Yamtrack/issues). Les problèmes de **traduction** peuvent être signalés sur [ce dépôt](https://github.com/Silvers12/Yamtrack/issues).
- 💡 Proposez des fonctionnalités via les [issues GitHub](https://github.com/FuzzyGrim/Yamtrack/issues).
- ☕ [Faites un don](https://ko-fi.com/fuzzygrim) à l'auteur original.

## 📄 Licence

Distribué sous licence **AGPL-3.0**, comme le projet d'origine.

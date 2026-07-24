/*
 * Translation-extraction helper (NOT loaded in the browser).
 *
 * These strings are used in Alpine `x-text` expressions inside templates via
 * gettext(), which `makemessages -d djangojs` cannot reliably scan from HTML
 * attributes. Referencing them here as plain gettext() calls guarantees they
 * are extracted into the djangojs catalog and preserved across updates.
 *
 * Keep this list in sync with the gettext() calls used in template x-text.
 */
gettext("Show less");
gettext("Read more");
gettext("Import from YamTrack backup");
gettext("Import games");
gettext("Import movies and TV shows from your ratings");
gettext("Import from GoodReads backup");
gettext("File uploads are not available for periodic imports");
gettext("Hide failed items");
gettext("Show failed items");
gettext("Hide traceback");
gettext("Show traceback");
gettext("Last Item Added");
gettext("Name");
gettext("Newest First");
gettext("Items Count");
gettext("Date Added");
gettext("Title");
gettext("Media Type");

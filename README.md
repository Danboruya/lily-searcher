# lily_searcher

## Description

This software can search for Lily, Charm, Legion, etc. that appear in "Assault Lily".  
The database uses [fvh-P/assaultlily-rdf](https://github.com/fvh-P/assaultlily-rdf),
which is an "unofficial RDF of Assault Lily".

## Current Project state

Currently our app includes the following features:
|Status|Function|Detail|
|:----:|--------|------|
|✅|Search Lily by name|User can search lily with lily's name on search box.|
|✅|Show Lily detail information|Users can see detail information about Lily.|
|TBD|Search Charm by name|User can search Legion with charm's name on search box.|
|TBD|Show Charm detail information|Users can see detail information about Charm.|
|TBD|Search Legion by name|User can search Legion with legion's name on search box.|
|TBD|Show Legion detail information|Users can see detail information about Legion.|
|TBD|Bookmark Lily, Charm, or Legion|Bookmark your favorite Lily, Charm, Legion.|
|TBD|i18n support|Currently, we are planning to support Japanese and English.|

## Requirement

* Flutter: 2.8.0 Stable channel or later
* Dart SDK: 2.15.0 stable or later
* flutter_hooks: ^0.18.0
* hooks_riverpod: ^1.0.2
* freezed_annotation: ^1.0.0
* simple_logger: ^1.9.0
* http: ^0.13.3
* intl: ^0.17.0
* package_info: ^2.0.2
* freezed: ^1.0.2+1
* build_runner: ^2.1.2
* json_serializable: ^6.1.1
* shared_preferences: ^2.0.8
* kana_kit: ^2.0.0

See `pubspec.yml` for details.

## Usage

1. Clone this repository

    ```bash
    git clone https://github.com/Danboruya/lily-searcher.git
    ```

2. Get dependent packages

    ```bash
    cd lily-searcher
    flutter pub get
    ```

3. Run the application

    ```bash
    flutter run
    ```

* Currently, the platforms that have been confirmed to work are Android, Web, and Windows.
* We haven't tested this application on all platforms Flutter supports,  
  but the Flutter application works on Android, iOS, Web, Linux, Windows, and macOS by default.

## Notice

This software is an unofficial, and is not software or service developed and provided
with the permission of the original author.

## LICENSE

This software is released under the Apache License 2.0, see LICENSE.

## Instructions on releasing Webdev

- Make sure you are on the Dart stable SDK version (check with `dart --version`)
- Update the DWDS version in `/webdev/pubspec.yaml` to match the newly released
  DWDS version, and update the Webdev version to the new version number. Also,
  comment out the dependency_override so that Webdev is now depending on the
  version of DWDS on pub (which should have just been published) instead of the
  local version.
- Update `/webdev/CHANGELOG.md` to match the new webdev version
- From `/webdev`, run `dart pub upgrade`
- From `/webdev` run `dart run build_runner build`, this will build and update
  the version in `webdev/lib/src/version.dart`
- Before submitting your PR, test that everything is working by following
  instructions in the `webdev/example` [README](/example/README.md) to run the
  example app and connect to Dart DevTools.
- Submit a PR with those changes (example PR:
  https://github.com/dart-lang/webdev/pull/1498)
- Once the PR is submitted, pull from master and run `dart pub publish`
- Finally, go to https://github.com/dart-lang/webdev/releases and create a new
  release, eg https://github.com/dart-lang/webdev/releases/tag/webdev-v2.7.8.
  You might need to delete some of the content of the autogenerated notes.
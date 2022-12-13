class Project {
  final String title, description, link, lang;

  Project({
    required this.title,
    required this.description,
    required this.link,
    required this.lang,
  });
}

List<Project> demoProjects = [
  Project(
      title: "LibRist",
      description:
          "A library that can be used to easily add the RIST protocol to your application.",
      link: "https://github.com/Alfaizkhan/LibRist",
      lang: "C/C++"),
  Project(
      title: "Emoji Selector",
      description:
          "An Emoji picker component for Flutter with the latest set of emojis. The current version supports Emoji version 13",
      link: "https://pub.dev/packages/emoji_selector",
      lang: "Flutter/Dart"),
  Project(
      title: "Debouncer",
      description:
          "An easy-to-use method call Debouncer package for Dart/Flutter.",
      link: "https://github.com/Alfaizkhan/debouncer",
      lang: "Flutter/Dart"),
  Project(
      title: "RSPL-Logger",
      description:
          "RSPLLogger is Kotlin logging library that brings some extra functionality: \n - A built in file logger that formats the logs and writes them to a Text file.\n - The possibility to easily share the logs file to server.\n - Share your Log Text file via Email",
      link: "https://github.com/Alfaizkhan/RSPL-Logger",
      lang: "Kotlin"),
  Project(
      title: "Background Location Tracker",
      description:
          "A new Flutter plugin that allows you to track the background location for Android & iOS.",
      link: "https://github.com/Alfaizkhan/flutter-background-location-tracker",
      lang: "Kotlin-Dart-Swift"),
  Project(
      title: "Live Location",
      description: "A Flutter plugin for detects location on Android devices.",
      link: "https://github.com/Alfaizkhan/live-location",
      lang: "Java-Dart"),
  Project(
      title: "Flutter Sqflite",
      description: "A Login Page Flutter App with Sqflite.",
      link:
          "https://www.youtube.com/watch?v=Qqh_I7SY64c&ab_channel=NoorEl-Nahhal",
      lang: "Swift"),
  Project(
      title: "Notification-Payload-FCM",
      description:
          "Demo example of Push notificatio payload using FCM console.",
      link: "https://github.com/Alfaizkhan/Notification-Payload-FCM",
      lang: "Java-Firebase"),
  Project(
      title: "Live-Location-v2",
      description:
          "Get Current/Live Location of the User using FusedLocationProviderClient",
      link: "https://github.com/Alfaizkhan/Live-Location-v2",
      lang: "Java-Firebase"),
  Project(
      title: "Whatsapp-Clone",
      description: "A Whats-app clone Flutter project.",
      link: "https://github.com/Alfaizkhan/Whatsapp-Clone",
      lang: "Dart"),
];

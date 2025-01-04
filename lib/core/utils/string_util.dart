import 'package:intl/intl.dart'; // Import for internationalization and number formatting utilities.

class StringUtil {
  // Formats a number with commas as thousand separators (e.g., 12345 -> "12,345").
  static String formatNumberWithCommas(int number) {
    final formatter = NumberFormat('#,###'); // Define the number format pattern.
    return formatter.format(number); // Apply the formatting.
  }

  // Formats a number in a style similar to YouTube (e.g., 1500 -> "1.5K").
  static String formatNumberYouTubeStyle(int number) {
    if (number >= 1_000_000_000) {
      // Format for numbers greater than or equal to 1 billion.
      return '${(number / 1_000_000_000).toStringAsFixed(1)}B';
    } else if (number >= 1_000_000) {
      // Format for numbers greater than or equal to 1 million.
      return '${(number / 1_000_000).toStringAsFixed(1)}M';
    } else if (number >= 1_000) {
      // Format for numbers greater than or equal to 1 thousand.
      return '${(number / 1_000).toStringAsFixed(1)}K';
    } else {
      // Format smaller numbers using commas.
      return NumberFormat('#,###').format(number);
    }
  }

  // Converts a `DateTime` object into a human-readable "time ago" string.
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now(); // Current time.
    final difference = now.difference(dateTime); // Time difference.

    if (difference.inSeconds < 60) {
      // Less than a minute ago.
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      // Less than an hour ago.
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      // Less than a day ago.
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      // Less than a week ago.
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      // Less than a month ago, expressed in weeks.
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 365) {
      // Less than a year ago, expressed in months.
      final months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else {
      // More than a year ago, expressed in years.
      final years = (difference.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    }
  }

  // Formats a `Duration` into a compact string (e.g., 1:30 or 01:30:45).
  static String formatDurationCompact(Duration duration) {
    // Helper function to ensure two-digit formatting.
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    int hours = duration.inHours; // Extract total hours.
    int minutes = duration.inMinutes.remainder(60); // Remaining minutes after hours.
    int seconds = duration.inSeconds.remainder(60); // Remaining seconds after minutes.

    if (hours > 0) {
      // Include hours if present.
      return '$hours:${twoDigits(minutes)}:${twoDigits(seconds)}';
    } else if (minutes > 0) {
      // Include minutes and seconds.
      return '$minutes:${twoDigits(seconds)}';
    } else {
      // Only include seconds.
      return twoDigits(seconds);
    }
  }
}

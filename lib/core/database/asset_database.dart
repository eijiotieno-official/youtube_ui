class AssetDatabase {
  // A static method to retrieve a list of thumbnail asset paths.
  static List<String> getThumbnails() {
    return List.generate(
      16, // Generate a list with 16 elements.
      (index) {
        // For each index, create a string representing the path to a thumbnail asset.
        return 'assets/thumbnail/thumbnail_${index + 1}.png';
        // Example result for index 0: 'assets/thumbnail/thumbnail_1.png'
      },
    );
  }

  // A static method to retrieve a list of profile picture asset paths.
  static List<String> getProfiles() {
    return List.generate(
      14, // Generate a list with 14 elements.
      (index) {
        // For each index, create a string representing the path to a profile asset.
        return 'assets/profile/profile_${index + 1}.png';
        // Example result for index 0: 'assets/profile/profile_1.png'
      },
    );
  }
}

enum CharacterCategory { all, both, breakingBad, betterCallSaul }

extension CharacterCategoryExension on CharacterCategory {
  String getSortString() {
    switch (this) {
      case CharacterCategory.all:
        return "";
      case CharacterCategory.both:
        return ",";
      case CharacterCategory.breakingBad:
        return "Breaking Bad";
      case CharacterCategory.betterCallSaul:
        return "Better Call Saul";
      default:
        return "null";
    }
  }

  String getCategoryTitle() {
    switch (this) {
      case CharacterCategory.all:
        return 'All';
      case CharacterCategory.both:
        return 'Both';
      case CharacterCategory.breakingBad:
        return 'Breaking Bad';
      case CharacterCategory.betterCallSaul:
        return 'Better Call Saul';
      default:
        return "null";
    }
  }
}

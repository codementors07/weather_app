class OnboardingModel {
  final int id;
  final String title;
  final String imageTitle;
  final String description;
  // final Widget widget;

  OnboardingModel({
    required this.id,
    required this.title,
    required this.imageTitle,
    required this.description,
  });
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
      id: 1,
      title: 'Weather is cloudy',
      imageTitle:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFBDhvq6beDSOg19H8UQV2l30Im9_OE6y--59EuEeb6Q&s',
      description: 'This is onboarding 1'),
  OnboardingModel(
      id: 2,
      title: 'Weather is Rainbow',
      imageTitle:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtLVyuZjyvYjumLJLSLVeCuQf0uxiAjbNX5c-JGr10dA&s',
      description: 'This is onboarding 2'),
  OnboardingModel(
      id: 3,
      title: 'Weather is Dawn',
      imageTitle:
          'https://freepngimg.com/thumb/weather/23648-2-weather-picture-thumb.png',
      description: 'This is onboarding 3'),
];

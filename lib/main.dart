import 'package:flutter/material.dart';
import 'package:project/Popup/custom_popup.dart';
import 'package:project/Rating/star_rating.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CombinedApp(),
    );
  }
}

class CombinedApp extends StatelessWidget {
  const CombinedApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combined App'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionTitle("Popup Examples"),
            ElevatedButton(
              onPressed: () {
                CustomPopup.show(
                  context,
                  title: "Popup 1",
                  titleColor: const Color.fromARGB(255, 255, 173, 167),
                  content:
                      "This is the classic popup, without a timer and not much else! Let's dive into the other examples!",
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  onButtonPressed: () {
                    CustomPopup.hide(context);
                  },
                  closeButtonColor: Colors.red,
                  closeButtonAlignment: Alignment.bottomRight,
                  closeButtonTextColor: Colors.white,
                );
              },
              child: const Text('Show Popup 1'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomPopup.show(
                  context,
                  title: "Popup 2",
                  titleColor: const Color.fromARGB(255, 158, 162, 213),
                  content: "This is the second popup with a timer! ",
                  backgroundColor: const Color.fromARGB(255, 12, 97, 123),
                  textColor: const Color.fromARGB(255, 255, 255, 255),
                  onButtonPressed: () {
                    CustomPopup.hide(context);
                  },
                  closeButtonText: "Close",
                  closeButtonAlignment: Alignment.bottomCenter,
                  closeButtonColor: const Color.fromARGB(255, 54, 114, 244),
                  closeButtonTextColor:
                      const Color.fromARGB(255, 255, 252, 252),
                  timerDuration: const Duration(seconds: 30),
                  countdownColor: Colors.white70,
                  showTimerIcon: true,
                );
              },
              child: const Text('Show Popup 2'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomPopup.show(
                  context,
                  title: "Popup 3",
                  content:
                      "This is the third popup with a timer but no button and no icon! ",
                  backgroundColor: Colors.purple,
                  textColor: Colors.white,
                  onButtonPressed: () {
                    CustomPopup.hide(context);
                  },
                  isThereClosingButton: false,
                  timerDuration: const Duration(seconds: 5),
                  countdownColor: Colors.white70,
                  showTimerIcon: false,
                );
              },
              child: const Text('Show Popup 3'),
            ),
            const SectionTitle("Star Rating Examples"),
            const StarRating(
              starCount: 5,
              rating: 0,
              selectedFillColor: Colors.amber,
              borderColor: Colors.black,
              size: 40.0,
              showSmiley: false,
              showRatingText: false,
              ratingTextStyle: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
            const StarRating(
              starCount: 5,
              rating: 0,
              selectedFillColor: Color.fromARGB(255, 190, 82, 52),
              unselectedFillColor: Color.fromARGB(255, 255, 202, 202),
              borderColor: Colors.black,
              starIcon: Icons.thumb_up_outlined,
              size: 40.0,
              showSmiley: true,
              smileySize: 35.0,
              showRatingText: true,
              ratingTextSuffix: ' / 5',
              ratingTextStyle: TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            StarRating(
              starCount: 5,
              rating: 0,
              selectedFillColor: const Color.fromARGB(255, 239, 41, 180),
              unselectedFillColor: const Color.fromARGB(255, 255, 151, 238),
              borderColor: const Color.fromARGB(255, 245, 71, 71),
              size: 50.0,
              onRatingChanged: (rating) {
                CustomPopup.show(
                  context,
                  title: "Thanks for Rating!",
                  content: "You gave us $rating stars!",
                  backgroundColor: Colors.blueGrey,
                  textColor: Colors.white,
                  onButtonPressed: () {
                    CustomPopup.hide(context);
                  },
                  closeButtonColor: Colors.teal,
                  closeButtonAlignment: Alignment.bottomCenter,
                  closeButtonTextColor: Colors.white,
                  timerDuration: const Duration(seconds: 5),
                  countdownColor: Colors.white70,
                  showTimerIcon: true,
                );
              },
              showSmiley: true,
              smileySize: 80.0,
              showRatingText: true,
              ratingTextPrefix: 'Received Rating: ',
              ratingTextSuffix: ' Stars',
              starIcon: Icons.star_border,
              ratingTextStyle: const TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(255, 180, 103, 184)),
            ),
            const SectionTitle("Popup and Star Rating Combinations"),
            ElevatedButton(
              onPressed: () {
                CustomPopup.show(
                  context,
                  title: "Star Rating Popup",
                  titleColor: Colors.red,
                  content: "Please rate us !",
                  backgroundColor: Colors.white,
                  textColor: Colors.black87,
                  onButtonPressed: () {
                    CustomPopup.hide(context);
                  },
                  closeButtonColor: Colors.red,
                  closeButtonAlignment: Alignment.bottomCenter,
                  closeButtonTextColor: Colors.black87,
                  timerDuration: const Duration(seconds: 10),
                  countdownColor: Colors.black87,
                  showTimerIcon: true,
                  additionalContent: const StarRating(
                    starCount: 5,
                    rating: 3.5,
                    selectedFillColor: Colors.red,
                    unselectedFillColor: Colors.white10,
                    borderColor: Colors.black,
                    size: 40.0,
                    showSmiley: true,
                    smileySize: 35.0,
                    showRatingText: false,
                    ratingTextStyle: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                );
              },
              child: const Text('Show Star Rating Popup'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomPopup.show(
                  context,
                  title: "Star Rating Popup",
                  content: "Please rate us !",
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  onButtonPressed: () {
                    CustomPopup.hide(context);
                  },
                  closeButtonColor: Colors.red,
                  closeButtonAlignment: Alignment.bottomCenter,
                  closeButtonTextColor: Colors.white,
                  timerDuration: const Duration(seconds: 10),
                  countdownColor: Colors.white70,
                  showTimerIcon: true,
                  additionalContent: StarRating(
                    starCount: 5,
                    rating: 3.5,
                    selectedFillColor: Colors.red,
                    unselectedFillColor: Colors.white10,
                    borderColor: Colors.black,
                    size: 40.0,
                    showSmiley: true,
                    smileySize: 35.0,
                    showRatingText: false,
                    ratingTextStyle: const TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    onRatingChanged: (rating) {
                      CustomPopup.show(
                        context,
                        title: "Thanks for Rating!",
                        content: "You gave us $rating stars!",
                        backgroundColor: Colors.blueGrey,
                        textColor: Colors.white,
                        onButtonPressed: () {
                          CustomPopup.hide(context);
                        },
                        closeButtonColor: Colors.teal,
                        closeButtonAlignment: Alignment.bottomCenter,
                        closeButtonTextColor: Colors.white,
                        timerDuration: const Duration(seconds: 5),
                        countdownColor: Colors.white70,
                        showTimerIcon: true,
                      );
                    },
                  ),
                );
              },
              child: const Text('Imbricated example'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomPopup.show(
                  context,
                  title: "Star Rating Popup",
                  content: "Please rate us !",
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  onButtonPressed: () {
                    CustomPopup.hide(context);
                    CustomPopup.show(
                      context,
                      content: "Thank you !",
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      onButtonPressed: () {
                        CustomPopup.hide(context);
                      },
                      isThereClosingButton: false,
                      additionalContent: StarRating(
                        starCount: 5,
                        rating: 0,
                        selectedFillColor: Colors.red,
                        unselectedFillColor: Colors.white10,
                        borderColor: Colors.black,
                        size: 40.0,
                        showSmiley: true,
                        smileySize: 35.0,
                        showRatingText: false,
                        ratingTextStyle: const TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        onRatingChanged: (rating) {
                          CustomPopup.hide(context);
                        },
                      ),
                    );
                  },
                  closeButtonColor: Colors.red,
                  closeButtonAlignment: Alignment.bottomCenter,
                  closeButtonTextColor: Colors.white,
                  timerDuration: const Duration(seconds: 10),
                  countdownColor: Colors.white70,
                  showTimerIcon: true,
                );
              },
              child: const Text('Ultimate example'),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

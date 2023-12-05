// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

/// A customizable star rating widget with additional features like smileys and rating text.
class StarRating extends StatefulWidget {
  /// Parameters:
  ///   - [starCount]: The number of stars to display.
  ///   - [rating]: The initial rating to display.
  ///   - [selectedFillColor]: The color of the filled stars.
  ///   - [unselectedFillColor]: The color of the unfilled stars.
  ///   - [borderColor]: The color of the star borders.
  ///   - [size]: The size of the stars.
  ///   - [starIcon]: The icon to use for the stars.
  ///   - [onRatingChanged]: The callback function that is called when the rating changes.
  ///   - [showSmiley]: Whether to show the smiley face icon.
  ///   - [smileySize]: The size of the smiley face icon.
  ///   - [showRatingText]: Whether to show the rating text.
  ///   - [ratingTextPrefix]: The prefix text to display before the rating.
  ///   - [ratingTextSuffix]: The suffix text to display after the rating.
  ///   - [ratingTextStyle]: The style of the rating text.

  final int starCount;
  final double rating;
  final Color selectedFillColor;
  final Color unselectedFillColor;
  final Color borderColor;
  final double size;
  final IconData starIcon;
  final ValueChanged<double>? onRatingChanged;
  final bool showSmiley;
  final double smileySize;
  final bool showRatingText;
  final String ratingTextPrefix;
  final String ratingTextSuffix;
  final TextStyle ratingTextStyle;

  /// Constructor for StarRating widget.
  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = 0.0,
    this.selectedFillColor = Colors.yellow,
    this.unselectedFillColor = Colors.transparent,
    this.borderColor = Colors.black,
    this.size = 30.0,
    this.starIcon = Icons.star,
    this.onRatingChanged,
    this.showSmiley = true,
    this.smileySize = 30.0,
    this.showRatingText = true,
    this.ratingTextPrefix = 'Grade: ',
    this.ratingTextSuffix = ' / 5',
    this.ratingTextStyle = const TextStyle(fontSize: 18.0),
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double selectedStar = 0.0;

  @override
  void initState() {
    super.initState();
    selectedStar = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(widget.starCount, (index) {
              return GestureDetector(
                onTap: () {
                  double newRating = index + 1.0;

                  if (newRating == selectedStar) {
                    newRating = 0.0;
                  }

                  setState(() {
                    selectedStar = newRating;
                  });

                  if (widget.onRatingChanged != null) {
                    widget.onRatingChanged!(selectedStar);
                  }
                },
                child: Star(
                  size: widget.size,
                  isSelected: index < selectedStar,
                  borderColor: widget.borderColor,
                  selectedFillColor: widget.selectedFillColor,
                  unselectedFillColor: widget.unselectedFillColor,
                  starIcon: widget.starIcon,
                ),
              );
            }),
            if (widget.showSmiley) const SizedBox(width: 10.0),
            if (widget.showSmiley)
              Smiley(
                rating: selectedStar,
                smileySize: widget.smileySize,
                numberOfStars: widget.starCount,
              ),
          ],
        ),
        if (widget.showRatingText)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '${widget.ratingTextPrefix}${selectedStar.toStringAsFixed(0)}${widget.ratingTextSuffix}',
              style: widget.ratingTextStyle,
            ),
          ),
      ],
    );
  }
}

/// Represents a single star in the StarRating widget.
class Star extends StatelessWidget {
  final double size;
  final bool isSelected;
  final Color selectedFillColor;
  final Color unselectedFillColor;
  final Color borderColor;
  final IconData starIcon;

  /// Constructor for the Star widget.
  const Star({
    super.key,
    required this.size,
    required this.isSelected,
    required this.selectedFillColor,
    required this.unselectedFillColor,
    required this.borderColor,
    required this.starIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? selectedFillColor : unselectedFillColor,
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
        ),
        child: Icon(
          starIcon,
          size: size * 0.6,
          color: isSelected ? Colors.transparent : selectedFillColor,
        ),
      ),
    );
  }
}

/// Represents a smiley face icon that corresponds to the rating in the StarRating widget.
class Smiley extends StatelessWidget {
  final double rating;
  final double smileySize;
  final int numberOfStars;

  /// Constructor for the Smiley widget.
  const Smiley({
    super.key,
    required this.rating,
    required this.smileySize,
    required this.numberOfStars,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the smiley color based on the rating.
    double percentage = rating / numberOfStars;
    Color gradientColor = Color.lerp(Colors.red, Colors.green, percentage)!;

    // Determine the smiley icon based on the rating range.
    IconData smileyIcon = Icons.sentiment_very_satisfied_outlined;
    if (rating < (numberOfStars / 3)) {
      smileyIcon = Icons.sentiment_very_dissatisfied_outlined;
    } else if (rating < (2 * (numberOfStars / 3))) {
      smileyIcon = Icons.sentiment_satisfied_alt_outlined;
    }

    return Container(
      width: smileySize,
      height: smileySize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: Icon(
          smileyIcon,
          size: smileySize,
          color: gradientColor,
        ),
      ),
    );
  }
}


# Star Rating Flutter Library
## Table of Contents

- [Star Rating Flutter Library](#star-rating-flutter-library)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Example Usage](#example-usage)
    - [API Reference](#api-reference)
      - [`StarRating`](#starrating)
    - [Complete examples](#complete-examples)
        - [*Basic example - No smiley faces or rating text*](#basic-example---no-smiley-faces-or-rating-text)
        - [*Intermediate example - Customizable and smiley faces*](#intermediate-example---customizable-and-smiley-faces)
        - [*COMBINED Rating to popup*](#combined-rating-to-popup)

## Overview

The Star Rating Flutter Library is a versatile Flutter widget that allows you to implement customizable star ratings in your applications. This library includes features such as smiley faces, rating text, and a variety of customization options. Easily integrate star ratings into your Flutter project with this user-friendly and adaptable library.

## Features
- **Customizable Appearance**: Tailor the appearance of the star rating widget by adjusting parameters like star count, size, colors, and more.

- **Smiley Faces**: Optionally include smiley face icons corresponding to the rating, adding a touch of fun and expressiveness.

- **Rating Text**: Display a textual representation of the rating along with customizable prefixes and suffixes.

## Getting Started

1. Import the library in your Dart code:

  ```dart
  import 'package:project/Rating/star_rating.dart';
  ```

2. Utilize the StarRating widget in your Flutter app, providing the necessary parameters for customization.

```dart
 const StarRating(
  starCount: 5,
  rating: 0,
  selectedFillColor: Colors.amber,
  borderColor: Colors.black,
  size: 40.0,
  showSmiley: true,
  smileySize: 35.0,
  showRatingText: true,
  ratingTextSuffix: ' / 5',
  ratingTextStyle: TextStyle(fontSize: 20.0, color: Colors.black),
);
```

### Example Usage
```dart
class MyHomePage extends StatelessWidget {
  // ... Your existing code ...

  const StarRating(
    starCount: 5,
    rating: 0,
    selectedFillColor: Colors.amber,
    borderColor: Colors.black,
    size: 40.0,
    showSmiley: true,
    smileySize: 35.0,
    showRatingText: true,
    ratingTextSuffix: ' / 5',
    ratingTextStyle: TextStyle(fontSize: 20.0, color: Colors.black),
  ),

  // ... Other widgets ...
}
```

### API Reference

#### `StarRating`
The main widget to display the star rating.

- Parameters:
  - `starCount`: The number of stars to display.
  - `rating`: The initial rating to display.
  - `selectedFillColor`: The color of the filled stars.
  - `unselectedFillColor`: The color of the unfilled stars.
  - `borderColor`: The color of the star borders.
  - `size`: The size of the stars.
  - `starIcon`: The icon to use for the stars.
  - `onRatingChanged`: Callback function called when the rating changes.
  - `showSmiley`: Whether to show smiley face icons.
  - `smileySize`: The size of the smiley face icons.
  - `showRatingText`: Whether to display the rating text.
  - `ratingTextPrefix`: The prefix text before the rating.
  - `ratingTextSuffix`: The suffix text after the rating.
  - `ratingTextStyle`: The style of the rating text.

### Complete examples

##### *Basic example - No smiley faces or rating text*
<center>

![Intermediate example](/assets/doc/basic_rate.png)

</center>
Display a basic star rating with no smiley faces or rating text.

```dart
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
```

##### *Intermediate example - Customizable and smiley faces*
<center>

![Intermediate example](/assets/doc/intermediate_rate.png)

</center>

Display a star rating with smiley faces / rating text and customizable icon.

```dart
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
```
##### *COMBINED Rating to popup*

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    .container {
      display: flex;
      align-items: center;
    }

    .image {
      width: 50px; /* Ajustez la taille de l'image selon vos besoins */
      height: auto;
    }

    .arrow {
      font-size: 24px; /* Ajustez la taille de la flèche selon vos besoins */
      margin: 0 10px; /* Ajustez la marge autour de la flèche selon vos besoins */
    }
  </style>
</head>
<body>

<div class="container">
  <img class="image" src="/assets/doc/advanced_rate_1.png" alt="Image 1">
  <div class="arrow">➤</div>
  <img class="image" src="/assets/doc/advanced_rate_2.png" alt="Image 2">
</div>

</body>
</html>

Fully customizable star rating system with popup when rating is changed.

```dart
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
```

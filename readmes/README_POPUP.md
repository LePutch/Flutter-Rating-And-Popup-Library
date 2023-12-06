# Custom Popup Flutter Library

## Table of Contents
- [Custom Popup Flutter Library](#custom-popup-flutter-library)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Example Usage](#example-usage)
  - [API Reference](#api-reference)
    - [`CustomPopup.show`](#custompopupshow)
    - [`CustomPopup.hide`](#custompopuphide)
    - [Complete examples](#complete-examples)
        - [*Basic example - No timer, just a simple popup*](#basic-example---no-timer-just-a-simple-popup)
        - [*Intermediate example - Little customizations and timer*](#intermediate-example---little-customizations-and-timer)
        - [*COMBINED - Popup to rating popup*](#combined---popup-to-rating-popup)
## Overview

The Custom Popup Flutter Library is a simple and customizable Flutter library that provides a configurable popup for displaying messages or notifications in your Flutter applications. This library allows you to easily show and hide popups with various customization options, including background color, text color, timer functionality, and more.

## Features

- **Configurability**: Customize the appearance of the popup by adjusting parameters such as background color, text color, close button color, and more.

- **Timer Functionality**: Optionally include a timer to automatically close the popup after a specified duration.

- **Close Button**: Display a close button with customizable text and styling.

## Getting Started

1. Import the library in your Dart code:

   ```dart
   import 'package:project/Popup/custom_popup.dart';
   ```

2. Use the `(CustomPopup.show` method to display popups with the desired configuration.
</br>

   ```dart
   CustomPopup.show(
     context,
     title: "Custom Popup",
     content: "This is a configurable popup!",
     backgroundColor: Colors.blue,
     textColor: Colors.white,
     onButtonPressed: () {
       CustomPopup.hide(context);
     },
     closeButtonText: "Close",
     closeButtonAlignment: Alignment.bottomRight,
     closeButtonColor: Colors.red,
     closeButtonTextColor: Colors.white,
     timerDuration: Duration(seconds: 10),
     countdownColor: Colors.white70,
     showTimerIcon: true,
   );
   ```

### Example Usage

```dart
class MyHomePage extends StatelessWidget {
  // ... Your existing code ...

  ElevatedButton(
    onPressed: () {
      CustomPopup.show(
        context,
        title: "Custom Popup",
        content: "This is a configurable popup!",
        backgroundColor: Color.fromARGB(255, 12, 97, 123),
        textColor: Color.fromARGB(255, 255, 255, 255),
        onButtonPressed: () {
          CustomPopup.hide(context);
        },
        closeButtonText: "Close",
        closeButtonAlignment: Alignment.bottomRight,
        closeButtonColor: Color.fromARGB(255, 54, 114, 244),
        closeButtonTextColor: const Color.fromARGB(255, 255, 252, 252),
        timerDuration: const Duration(seconds: 30),
        countdownColor: Colors.white70,
        showTimerIcon: true,
      );
    },
    child: const Text('Show Popup'),
  ),
  
  // ... Other buttons ...
}
```


## API Reference

### `CustomPopup.show`

Displays the custom popup.

- Parameters:
  - `context`: The build context.
  - `title`: The title of the popup.
  - `content`: The main message to be displayed.
  - `backgroundColor`: Sets the background color of the popup.
  - `textColor`: Sets the color of the text in the popup.
  - `onButtonPressed`: Callback function triggered when the close buton is pressed.
  - `closeButtonText`: Text displayed on the close button.
  - `closeButtonAlignment`: Determines the alignment of the close buton.
  - `closeButtonColor`: Sets the background color of the close buton.
  - `closeButtonTextColor`: Sets the color of the text on the close buton.
  - `timerDuration`: Duration for the timer, if provided.
  - `countdownColor`: Color of the countdown timer, if displayed.
  - `showTimerIcon`: Determines whether to display the timer icon.
  - `isThereClosingButton`: Boolean to determine if a close button should be displayed.

### `CustomPopup.hide`

Hides the custom popup.

- Parameters:
  - `context`: The build context.


### Complete examples

##### *Basic example - No timer, just a simple popup*

<center>

![Basic example](/assets/doc/basic_popup.png)

</center>

Display a basic popup with no timer.

```dart
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
```

##### *Intermediate example - Little customizations and timer*

<center>

![Intermediate example](/assets/doc/intermediate_popup.png)
</center>

Display a popup with a timer and some customizations.

```dart
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
```
##### *COMBINED - Popup to rating popup*

![Image 1](/assets/doc/advanced_popup_1.png) ➤ ![Image 2](/assets/doc/advanced_popup_1.png)


Fully customizable popup with timer and close button. When pressing the close button, the popup will disappear and a new one will appear with a rating system.

```dart
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
```

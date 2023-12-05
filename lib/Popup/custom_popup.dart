import 'dart:async';
import 'package:flutter/material.dart';

/// A customizable popup that can display a message with optional timer and close button.
class CustomPopup {
  /// Displays the custom popup.
  ///
  /// Parameters:
  ///   - [context]: The build context.
  ///   - [title]: The title of the popup.
  ///   - [titleColor]: The color of the title text.
  ///   - [content]: The main message to be displayed.
  ///   - [backgroundColor]: Sets the background color of the popup.
  ///   - [textColor]: Sets the color of the text in the popup.
  ///   - [onButtonPressed]: Callback function triggered when the close button is pressed.
  ///   - [closeButtonText]: Text displayed on the close button.
  ///   - [closeButtonAlignment]: Determines the alignment of the close button.
  ///   - [closeButtonColor]: Sets the background color of the close button.
  ///   - [closeButtonTextColor]: Sets the color of the text on the close button.
  ///   - [timerDuration]: Duration for the timer, if provided.
  ///   - [countdownColor]: Color of the countdown timer, if displayed.
  ///   - [showTimerIcon]: Determines whether to display the timer icon.
  ///   - [isThereClosingButton]: Boolean to determine if a close button should be displayed.
  ///   - [additionalContent]: Widget to display additional content in the popup.
  ///
  static void show(
    BuildContext context, {
    String title = "",
    String content = "",
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
    VoidCallback? onButtonPressed,
    String closeButtonText = "OK",
    AlignmentGeometry closeButtonAlignment = Alignment.center,
    Color? closeButtonColor,
    Color? closeButtonTextColor,
    Duration? timerDuration,
    Color? countdownColor,
    bool showTimerIcon = false,
    bool isThereClosingButton = true,
    Widget? additionalContent,
    Color? titleColor,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _CustomPopupContent(
          title: title,
          content: content,
          backgroundColor: backgroundColor,
          textColor: textColor,
          onButtonPressed: onButtonPressed,
          closeButtonText: closeButtonText,
          closeButtonAlignment: closeButtonAlignment,
          closeButtonColor: closeButtonColor,
          closeButtonTextColor: closeButtonTextColor,
          timerDuration: timerDuration,
          countdownColor: countdownColor,
          showTimerIcon: showTimerIcon,
          isThereClosingButton: isThereClosingButton,
          additionalContent: additionalContent,
          titleColor: titleColor ?? textColor,
        );
      },
    );
  }

  /// Hides the custom popup.
  ///
  /// The [context] parameter is the build context.
  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}

/// Content for the custom popup.
class _CustomPopupContent extends StatefulWidget {
  final String title;
  final String content;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onButtonPressed;
  final String closeButtonText;
  final AlignmentGeometry closeButtonAlignment;
  final Color? closeButtonColor;
  final Color? closeButtonTextColor;
  final Duration? timerDuration;
  final Color? countdownColor;
  final bool showTimerIcon;
  final bool isThereClosingButton;
  final Widget? additionalContent;
  final Color titleColor;

  const _CustomPopupContent({
    Key? key,
    required this.title,
    required this.content,
    required this.backgroundColor,
    required this.textColor,
    required this.onButtonPressed,
    required this.closeButtonText,
    required this.closeButtonAlignment,
    required this.closeButtonColor,
    required this.closeButtonTextColor,
    required this.timerDuration,
    required this.countdownColor,
    required this.showTimerIcon,
    required this.isThereClosingButton,
    required this.additionalContent,
    required this.titleColor,
  }) : super(key: key);

  @override
  _CustomPopupContentState createState() => _CustomPopupContentState();
}

/// State class for the custom popup.
class _CustomPopupContentState extends State<_CustomPopupContent> {
  late Timer _timer;
  int _remainingSeconds = 0;

  /// Initializes the timer.
  @override
  void initState() {
    super.initState();
    if (widget.timerDuration != null) {
      _remainingSeconds = widget.timerDuration!.inSeconds;
      _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
    }
  }

  /// Updates the timer display.
  void _updateTimer(Timer timer) {
    setState(() {
      _remainingSeconds--;
    });

    if (_remainingSeconds <= 0) {
      CustomPopup.hide(context);
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.timerDuration != null) _buildCountdown(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  widget.content,
                  style: TextStyle(color: widget.textColor),
                ),
              ),
              if (widget.additionalContent != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.additionalContent!,
                ),
            ],
          ),
          Positioned(
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.titleColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: widget.backgroundColor,
      actions: <Widget>[
        if (widget.onButtonPressed != null && widget.isThereClosingButton)
          Container(
            alignment: widget.closeButtonAlignment,
            child: ElevatedButton(
              onPressed: widget.onButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.closeButtonColor,
              ),
              child: Text(widget.closeButtonText,
                  style: TextStyle(color: widget.closeButtonTextColor)),
            ),
          ),
      ],
    );
  }

  /// Builds the countdown timer display.
  Widget _buildCountdown() {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showTimerIcon)
            Icon(Icons.timer, color: widget.countdownColor),
          SizedBox(width: widget.showTimerIcon ? 4.0 : 0.0),
          Text(
            '$_remainingSeconds',
            style: TextStyle(color: widget.countdownColor),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (widget.timerDuration != null) {
      _timer.cancel();
    }
    super.dispose();
  }
}

# Swift Words
### Project Platform Details:
* IOS 14.4
* Version xcode: 12.4 (12D4e) Iphone and Ipad
* UIKit with Storyboards

# Purpose
* Anagram game 
* a word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.
* Get input from user
* Validate user input
* Display user input in a table list (F.I.L.O)
* Load data from .txt file (BIG text file...)
## Coding Overview
*  Load data from file, process data, generate a list
*  Use navbar for buttons
*  Get user input and validate it.
* Alert if input is not appropriate.
* Add values to a list dynamically: first in last out.
* Refresh the application clear and refresh.

## Credit
* Hackingwithswift [Project 5](https://www.hackingwithswift.com/100/27)
* Andrey Rudenko (Andrew) Nov 28, 2017 [Add Toast message in swift](https://stackoverflow.com/questions/31540375/how-to-toast-message-in-swift) 
## Swift topics covered in this project
*  Loading data from a file
*  Getting a random Item from a list
*  Navigaion Bar ltems
*  Trailing closure syntax to handle when Submit button is touched.
*  Use the UITextChecker designed to spot spelling errors.
*  NSRange: To store a string range. 0 and word.length
* Use .automatic to animate the list when a new anagram is added. 
* Create a toast animation to show errors that show then fade away. 
## Project Challenges
* Make toast alert rather than alert controller.
Disallow answers shorter than three characters.
*  Refactor all else statements. Create showErrorMessage( message: String, title: String) { }
*  Add button to start a new game. 
 * Fix the bugs... Capitals and no entry as valid entries.
## Solution preview
| viewController | viewController | viewController | viewController |
| :---------------: | :---------------: | :---------------: | :---------------: |
| Source word   |  add an anagram | error toast  | error toast |
| <img src="https://github.com/benjkent/Hacking-with-swift-05-SwiftWords/blob/main/screenshots/anagram.png" > | <img src="https://github.com/benjkent/Hacking-with-swift-05-SwiftWords/blob/main/screenshots/EnterWord.png" > | <img src="https://github.com/benjkent/Hacking-with-swift-05-SwiftWords/blob/main/screenshots/Error1.png" > | <img src="https://github.com/benjkent/Hacking-with-swift-05-SwiftWords/blob/main/screenshots/Error2.png">  | 
| viewController | viewController | viewController | viewController | 
| error toast | new game refresh | |  |
| <img src="https://github.com/benjkent/Hacking-with-swift-05-SwiftWords/blob/main/screenshots/Error3.png" > | <img src="https://github.com/benjkent/Hacking-with-swift-05-SwiftWords/blob/main/screenshots/refresh.png"> |  |  |



#  NYT Most Popular Articles

New York Times most popular articles iOS app using Swift, UIKit, MVC architecture and FastLane tools.

<div align="center">

 <img src="" width="25%"</img> 
 <img width="50"></img>
 <img src="" width="25%"<img> 
 <img width="50"></img>
 <img src="" width="25%"<img>
  
</div>

## Getting Started

Make sure to create an account at [NYT Developer website](https://developer.nytimes.com/get-started") first, than enable most popular articles service, copy your api key, and create the file: [**Development.xcconfig**]() in the NYT folder and add the following:

```console

API_KEY = {put_your_api_here}

```
then you go to project -> NYT -> Info -> Configuration, and include it with the debug and release configs

then you add to the info.plist the following key "API_KEY" with the valuy "$(API_KEY)"

## Building the App

Note: this step requires an apple developer account

you can either build the app through xcode or through fastlane tools, to use fastlane cd to the root folder of the project first, then run the following:

```console

fastlane gym --verbose

```

## Testing

This can be done through xcode by running Command + U, or using the Test Navigator and chhosing what test to run (or all of them). Testing could be done through fastlane tools too.

### xcode:

<img src= "" width="25%">


### fastlane


```console

fastlane scan --scheme "NYT" --device "iPhone 11"

```

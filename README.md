#  NYT Most Popular Articles

New York Times most popular articles iOS app using Swift, UIKit, MVC architecture and FastLane tools.

<div align="center">

 <img src="https://user-images.githubusercontent.com/60781548/160478812-abf73c9e-178b-4dc2-affc-5fe67e8f9cb9.png" width="25%"></img> 
 <img width="50"></img>
 <img src="https://user-images.githubusercontent.com/60781548/160478836-6f79d21e-696b-4bf2-984c-f6f16e49234e.png" width="25%"><img> 
 <img width="50"></img>
 <img src="https://user-images.githubusercontent.com/60781548/160478850-bb87d640-4f8b-47cb-a997-64701748611c.png" width="25%"><img>
  
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

you can either build the app through Xcode or through Fastlane Tools, to use fastlane cd to the root folder of the project first, then run the following:

```console

fastlane gym --verbose

```

## Testing

This can be done through xcode by running Command + U, or using the Test Navigator and chhosing what test to run (or all of them). Testing could be done through fastlane tools too.

### Xcode:

<div align="center">
<img src="https://user-images.githubusercontent.com/60781548/160479511-1a8a2359-c768-442d-8cd7-6a6288a8f27b.png" width="25%"></img>
</div>

### FastLane


```console

fastlane scan --scheme "NYT" --device "iPhone 11"

```

<div align="center">
<img src="https://user-images.githubusercontent.com/60781548/160479761-57ae9d4f-c64b-42d0-833e-beee3da2d218.png" width="75%"></img>
</div>

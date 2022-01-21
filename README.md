# NY-Times-Most-Popular-Articles


A simple app to hit the NY Times Most Popular Articles API and:
* Show a list of articles
* Shows details when items on the list are tapped. 


I am using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key To test this API, 
For testAPI I used 
* all-sections for the section path component in the URL
* 7 for period
* a specified api-key GExcGoUo0aSAm9wm8mLJsiRDSL1eJp2f


&nbsp; 

**App Flow:**

&nbsp; 
&nbsp; 

https://user-images.githubusercontent.com/42350093/150473586-a245c11c-9493-4973-aaad-ef6cdaaf0017.mov

&nbsp; 
&nbsp;


## Tools And Resources Used
- [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.


## Library Used
- [SDWebImage](https://github.com/rs/SDWebImage) - This library provides an async image downloader with cache support.
Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.
- [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift) - Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.
- [Alamofire ](https://github.com/Alamofire/Alamofire) - Alamofire is an HTTP networking library written in Swift.
- [SwifterSwift](https://github.com/SwifterSwift/SwifterSwift) - SwifterSwift is a collection of over 500 native Swift extensions, with handy methods, syntactic sugar, and more.


&nbsp;


# Installation

* Installation by cloning the repository
* Go to directory
* Open terminal located at this directory
* Enter "pod install" command to install all used libraries
* Open NY-Times-Most-Popular-Articles.xcworkspace project
* use command + B or Product -> Build to build the project
* Press run icon in Xcode or command + R to run the project on Simulator

&nbsp; 
&nbsp; 


## Running The Tests Manually 

Follow the steps to get test case reports:
* Enable coverage Data under test schema section:
<img width="1552" alt="Screen Shot 2022-01-21 at 10 04 40 AM" src="https://user-images.githubusercontent.com/42350093/150475045-2febd3cd-f46a-43bc-bcae-450e8da7a81a.png">
* Select the Test Icon by pressing and holding Xcode Run Icon OR press `Command+Control+U`
* In the Project Navigator under Test Navigator tab, check test status and coverage 
<img width="1552" alt="Screen Shot 2022-01-21 at 9 45 14 AM" src="https://user-images.githubusercontent.com/42350093/150475103-c3ce7cd3-90be-4c71-a3a0-d8531123c687.png">

# Architecture

I used MVVM pattern:

&nbsp; 
&nbsp; 

<kbd >
 ![MVVM](https://user-images.githubusercontent.com/42350093/150475217-0f3a0557-18df-4740-bb31-beeef74cf557.png)
</kbd>

</br>
</br>

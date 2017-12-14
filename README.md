# SSCTaglistView
> Simple customizable iOS tag list view, in Swift.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
One to two paragraph statement about your product and what it does.

![Alt text](https://github.com/sanjaysinh-Chauhan/SSCTaglistView/blob/master/Features.gif?raw=true)
## Features

- [x] Feature 1
 Simple and highly customizable iOS tag list view, in Swift.
- [x] Feature 2
 Supports @IBDesignable.
- [x] Feature 3
 Adds array of tags to view.
- [x] Feature 4
 Add single tag to list.
- [x] Feature 5
 Add single tag to specific index.
- [x] Feature 6
 Remove all tags from taglist view.
- [x] Feature 7
 Remove tags from specific index.
- [x] Feature 8
 Directly copy available tags from taglist view
- [x] Feature 9
 Directly copy selected tags from taglist view.
- [x] Feature 10
 Directly copy unselected tags from taglist view.
## Requirements

- iOS 10.0+
- Xcode 9.0

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `SSCTaglistView` by adding it to your `Podfile`:

```ruby
platform :ios, '10.0'
use_frameworks!
pod 'SSCTaglistView'
```

To get the full benefits import `YourLibrary` wherever you import UIKit

``` swift
import UIKit
import SSCTaglistView
```

#### Manually
1. Download and drop ```TaglistCollection.swift``` ```TagCollectionCell.swift``` ```Theme.swift```  ```CloseButton.swift``` ```TagCollectionCell.xib``` in your project.  
2. Congratulations!  

## Usage example


Add view in storyboard and apply class TaglistCollection. Here tagListView is outlet from storyboard

```swift
import SSCTaglistView
```
### Create outlet of that view. 
### Add single tags to view using 
```swift
    tagListView.appendTag(tagName: #Stringtagname)
```
### Add single tags to specific index 
```swift
    self.appendTag(tagName: #stringTagName, atIndex: #Index)
```    
### Add array of tags to view using 
```swift
    tagListView.appendTag(tagNamelist: #arrayOfString)
```    
### Remove all tags from view
```swift
    tagListView.removeAllTags()
```    
### Remove all tag from specific index
```swift
    tagListView.removeTagAt(indexPath: #IndexOfTag)
```    
### Copy all tags from taglistView
```swift
    tagListView.copyAllTags() will return array of tags.
```    
### Copy selected tags from taglistView.
```swift
    tagListView.copySelectedTags() will return array of tags.
```    
### Copy unselected tags from taglistView.
```swift
    tagListView.copyUnselectedTags() will return array of tags.
```


## Contribute

We would love you for the contribution to **SSCTaglistView**, check the ``LICENSE`` file for more info.

## Meta

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/sanjaysinh-Chauhan/SSCTaglistView](https://github.com/sanjaysinh-Chauhan)

[swift-image]:https://img.shields.io/badge/swift-4.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com


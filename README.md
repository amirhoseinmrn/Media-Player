# Media-Player

Platform iPhone-iPad

# Requirements
- Xcode 11+
- Swift 5
- iOS 15.0+

## Installation
- First you need install Xcode from app strore on mac
- To run the  project, clone the repo, and run `pod install` from the project directory first in Terminal application.
- Then open the Media-Player.xcworkspace.
- if Cocoapod is not install on your system, do under task 
`sudo gem install cocoapods`

## Our Architecture
# Architecture that we use in Media-Player

I always found the architecture pattern is good to use, but we should not strictly follow an architecture pattern in our project. Not every architecture pattern is good enough to give you everything, there are cons & pros of every architecture pattern. if we have a lot of modules in our project, we can decide the architecture pattern according to the module also. Some module suits well with MVVM, but maybe your new module will not work well with MVVM, so instead use another architecture pattern like MVP, VIPER. So we should not completely rely on a single architecture pattern, instead, we can check it according to the module also.

There are lots of articles available over the internet explaining the definition and cons and pros of the MVVM pattern.

## MVVM pattern
<p align="center">
	<img width="500" alt="MVVM_Diagram" src="https://user-images.githubusercontent.com/35375629/145787634-cf8185e7-3f83-479b-8150-399fd4f89251.jpg">
</p>

- **Model:** In the MVVM design pattern, Model is the same as in MVC pattern. It represents simple data. They’re usually structs or simple classes.
- **View:** View is represented by the `UIView` or `UIViewController` objects, accompanied with their `.xib` and `.storyboard` files, which should only display prepared data.
- **View Model:** View Model transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.

<p align="center">
	<img width="500" alt="MVVM_Diagram" src="https://user-images.githubusercontent.com/35375629/145789169-1fc40bc8-6117-4cb9-90bd-5514f471a0f2.png">
</p>

> Note that the class diagram at the top of this page includes a view controller; view controllers do exist in MVVM, but their role is minimized.

## How do we implement MVVM in Edecom project?

Our directory in project is:

- [**Commons:**](https://github.com/amirhoseinmrn/Media-Player/tree/main/Media-Player/Commons) a collection of useful utility classes common to different iOS projects
- [**Modules:**](https://github.com/amirhoseinmrn/Media-Player/tree/main/Media-Player/Modules) a collection of modules in application
- [**Resource:**](https://github.com/amirhoseinmrn/Media-Player/tree/main/Media-Player/Resources/Assets.xcassets) a collection of assets in application such as fonts, images, localize strings ...


Inside Each module we implement MVVM arch for example:

- D = Directory 
- F = File 
- O = Optional(it can implement inside other file, but sometimes doesn't need to create)

> - Protocol  **D O**
> - Service Detail **D**
> - Collection View Cells **D O**
> - Table View Cells **D O**
> - XViewModelContract.swift **F O**
> - XViewModel.swift **F**
> - XViewModel+Request.swift **F O**
> - XViewController.swift **F**
> - XViewController.Xib **F**
> - XViewController+Binding.swift **F O**
> - XViewController+TableView.swift **F O**


### Protocol:
> Protocols are a fundamental feature of Swift. They play a leading role in the structure of the Swift standard library and are a common method of abstraction. They provide a similar experience to interfaces that some other languages have.


### Service Detail
> In this directory we have request, response, service protocol, service.

### Collection View Cells
> Collect all collection view cells in this modules in this directory.

### Table View Cells
> Collect all table view cells in this modules in this directory.

### View Model
> View Model transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.

### View Model + Request
> Seprate request of services in another file that cuased request is clear.

### View Controller
> A view controller manages a single root view, which may itself contain any number of subviews. User interactions with that view hierarchy are handled by your view controller, which coordinates with other objects of your app as needed. Every app has at least one view controller whose content fills the main window.

### View Controller + Binding
> Seprate bind request data from controller that cuased access function is simply

### View Controller + Table View
> Handle table view data source and delegate in this file

### View Controller + Collection View
> Handle collection view data source and delegate in this file

## How is the MVVM layers in iOS Media-Player app?
<p align="center">
	<img width="500" alt="MVVM_Diagram" src="https://user-images.githubusercontent.com/35375629/147250403-35aed563-0c59-4815-ae60-f797067f280f.png">
</p>
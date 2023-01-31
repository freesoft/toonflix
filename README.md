# ToonFlix

Toonflix is a Naver webtoon mobile app clone project that nomadcoders.co provides for free. Check [here](https://nomadcoders.co/flutter-for-beginners) if you are interested in the course.
<p/>
I used this course to learn Flutter and followed up all the coding practice to the end.<p/>
This repo has almost same code as ones in the vieo lecture, but slightly modified for model in order to make parameter bypass simpler. Feel free to fork or tweak as you want. 

Although this repo is for mobile phone app build, I also built a web version(as Fullter simply allows it) and hosted it [here](https://freesoft.github.io/toonflix/) so that a visitor can have an idea for what it's look like. (:warning: It looks ugly on web.)

## Screenshot ( with iPhone 14 emulator )

![image](https://user-images.githubusercontent.com/841438/215638154-c7dcb632-7994-48f9-90ba-9522904c8cb1.png)
![image](https://user-images.githubusercontent.com/841438/215638306-05031fd9-24d4-4d35-87cf-d0306ede7b8f.png)

All copyrights for the webtoon image in the screenshot belongs to [Naver](http://naver.com).

## A few caveat
* If you are running your mobile phone emulator behind the VPN, your app might not able to load images due to SSL handshake errors. Disconnect VPN and try again.
* Image itself belongs to Naver, but REST API is provided by [Nomadcoders](http://nomadcoders.co) and the server is hosted on [workers.dev](http://workers.dev). There is always a chance that data fetching won't work if any of these services having an issue, and it's out of my scope. 


## Build environment
* MacOS Ventura 13.1
* MacBook Pro 2019 late (Intel 16")
* Visual Studio Code 1.74.3
* Dart 2.19.0
* Flutter 3.7.0

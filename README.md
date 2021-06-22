# Tinder App Flutter
![HeaderImage](github_images/header.jpeg) 

## Introduction
This is a demo application built with the goal to learn about Flutter and to create a fun application.

Tested on Android only.

## Technologies & Architecture
Flutter, Dart

#### Firebase 
* Authentication
* Firestore
* Storage

#### Architecture components
* Provider

## Features

**Start screen:** Login/Register

**Profile screen:** Change image, change bio, logout

**Chats screen:** List of chats(matches)

**Chat screen:** Messaged sorted by timestamp, send and show messages

**Match screen:** Image and information of person, like/dislike 

**Matched screen:** Show users included in match

**General:** Auto login, basic error handling, progress bar

**Firebase:** Storing user info, chats, images

## Screenshots

### Start | Login | Register

<p align = "left" >
  <img width="250" height="500" src="github_images/start.jpeg">
  <img width="250" height="500"  src="github_images/login.jpeg"> 
  <img width="250" height="500" src="github_images/register.gif"> 
</p>

### Profile | Chats | Match

<p align = "left" >
  <img width="250" height="500" src="github_images/profile.jpeg">
  <img width="250" height="500"  src="github_images/chats.jpeg"> 
  <img width="250" height="500" src="github_images/match.gif"> 
</p>

### Chat | Matched
<p align = "left" >
  <img width="250" height="500" src="github_images/chat.jpeg">
  <img width="250" height="500" src="github_images/matched.jpeg">
</p>

### Firebase
<p align = "left" >
  <img  width="378" height="332" src="github_images/firestore_1.png"> 
  <img  width="378" height="332" src="github_images/firestore_2.png"> 
</p>

## Setup

#### Requirements
* Basic knowledge about Flutter
* Basic knowledge about Android
* Basic knowledge about Firebase
* Flutter SDK version >= 2.0.0 (tested and works with 2.0.0)

#### Firebase
* Setup Authentication and use the Sign-in method 'Email/Password'
* Setup Firestore
* Setup Storage
* Replace the file [google-services.json](android/app/google-services.json)

#### Project
1. Download and open the project in e.g Android Studio
2. Connect your Android phone or use the emulator to start the application

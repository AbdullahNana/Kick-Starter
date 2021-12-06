# Kick Starter

An iOS application that displays data about soccer/football.

## About

Kick-Starter is an iOS application that displays information about football teams in various leagues.

## Core Features

- Allows user to log in or register.
- Displays list of the 'Big 5' football leagues in the world as well as the South African PSL.
- Displays information on the football teams currently playing in each league.
- Displays the stadium, squad and coaches for each team..
- Allows the user to search for any team around the world.
- Shows the live score of any football match that is currently being played around the world.
- Displays results of all recent football matches that were played. 
- Displays information and statistics of a particular fixture. Detailed data such as line-ups, goals, yellow or red cards as well as individual player performance data is displayed.
- A watch application which displays the team that is selected and allows for similar teams to be searched by the click of a button.

## Technologies and Principles Applied 

- Getting data from restful API (Football API - https://www.api-football.com)
- MVVM Architecture
- Swift
- Objective-C
- Makes use of repository and delegate design patterns
- Firebase Realtime Database used as a Restful API
- Contains development pods. 
- Firebase authentication is used for login and signup.

## Development pods

- Logic for certain functionalities has been extracted into a framework. The development pod used can be found here: https://github.com/AbdullahNanaDVT/KickStarterFramework.git
- Please run 'pod install' after cloning the project in order to download the dependencies from the framework.


## View of the application:

The initial screen allows the user to log in or sign up.

![Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14 40 23](https://user-images.githubusercontent.com/79845386/144848329-1e06b8ba-76ed-4c5b-ad4e-c9065e71033d.png)


When a user clicks on the log in button, they are taken to the log in screen which requires an email and a password.

![Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14 40 33](https://user-images.githubusercontent.com/79845386/144848605-00aade79-f73e-43c8-8a93-8ef05b7ebac1.png)


After logging in, the user is shown a tab bar with 3 options: 

- They may view a list of the top 5 leagues as well as the South African PSL.
- They may view current football live scores or recent results around the world.
- They may view detailed statistics and information of a single match.

![Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14 41 02](https://user-images.githubusercontent.com/79845386/144849017-84130493-e48e-48a4-9d1e-7f8993930a63.png)

![Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14 43 50](https://user-images.githubusercontent.com/79845386/144849087-3bb65986-db07-4723-b2fe-44fc23dc8a02.png)

![Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14 43 56](https://user-images.githubusercontent.com/79845386/144849115-e8b89d51-9215-4a8b-af57-74f048429cd9.png)

![Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14 44 06](https://user-images.githubusercontent.com/79845386/144849131-6417360b-29d5-47bc-81ac-bd482b36e672.png)


Upon clicking on a certain league, all the teams within that league are displayed.

![Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14 41 14](https://user-images.githubusercontent.com/79845386/144849344-3530fd9a-a355-44d8-a763-cf00e2872c41.png)


The user may select a team to view the coaches of that team, the stadium of the team or the current squad of the team. The team that is selected is also displayed on the watch application that accompanies Kick-Starter.

![Uploading Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14.42.35.png…]()

![Simulator Screen Shot - Apple Watch Series 7 - 45mm - 2021-12-06 at 14 42 30](https://user-images.githubusercontent.com/79845386/144849802-95e506dd-5b1a-44f6-9d57-1e39ec6fcf36.png)

![Uploading Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14.42.35.png…]()

![Uploading Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14.43.10.png…]()

![Uploading Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14.43.15.png…]()

![Uploading Simulator Screen Shot - iPhone 13 - 2021-12-06 at 14.43.28.png…]()


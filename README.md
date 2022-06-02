# Bootleg-Balloons-TD-Battle

**Double L:** April Li and Nicole Liu

Our project is a bootleg version of the popular mini-game, Bloons TD Battle. The game will have a predetermined path on which balloons will travel. The purpose of the game will be to prevent the balloons from reaching the end of the path by setting down monkeys to pop the balloons. If the balloons do reach the end, then the player’s health will decrease based on the balloon’s value. Once the health reaches 0, the player will lose and the game will end. However, the more balloons that the player pops, the more income that the player receives, which they can then use to buy monkeys that will shoot at the balloons to pop them. As the player progresses through the levels, they will unlock different types of monkeys, each with a different set of skills and characteristics. Once placed on the map, these monkeys can be sold to earn back income. At the end of each round, the player will have the opportunity to buy upgrades for their monkeys. The round ends when all of the balloons disappear, and the rounds will get progressively more difficult.

**Design Document:** https://docs.google.com/document/d/1v6FhPbggvfvNtyiybX9_7laz6RiJBexw62pb6UX0cF0/edit

**Development Log**

**April Li**
* 5/21/22: I set up the Map and Balloon classes and displayed them. I tried to make the Balloon follow the path based on colors but it seems to go in the wrong direction.
* 5/24/22: I tested different INTERVALs for calculateDirections() and changed move() and followMap() into if statements and declared variables used in these functions as global variables
* 5/24/22: I removed calculate directions and just inputted corner points into a variable. Got my move() and followMap() functions to work for any speed. Started working on my ballonList.
* 5/25/22: I created balloonList as an ArrayList and wrote add(), remove(), getBalloonAt(), display(), and processAll() as well as load images in setup();
* 5/26/22: I created getFuture() for Monkey class to use for attack and I created addBalloons() that will add balloons based on the round
* 5/27/22: Created player class and start trigger key as well as game over page.
* 5/29/22: Displayed health and decreased it when Balloons reached the end as implemented rounds.
* 5/31/22: Created Balloon class subclasses for different types of Balloons and set up all the constructors and images.
* 6/1/22: Created setNewBalloon function that will turn each balloon to the correct Balloon after it is popped to match the new health(ex: turn pink to yellow and zebras to a white and a white)

**Nicole Liu**
* 5/23/22: I set up the Monkey and MonkeyList class. Monkey Class can display but MonkeyList is having some trouble.
* 5/25/22: I got the MonkeyList to work and display. I tested out the remove and add methods by implementing modes in the main and they seem to work. Also created a weapons class and started working on that. Also tested out the monkey class on the main class.
* 5/26/22: I started working on the findBalloon method and added some accessor methods to the classes.
* 5/27/22: I tested the findBallon method and created more methods like processAll() to apply the methods to the balloons.
* 5/29/22: I completed the attack method and started on the shootWeapon method and also made some updates to processAll().
* 5/30/22: I completed the shootWeapon method.

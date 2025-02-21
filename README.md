# Bootleg-Balloons-TD
This is an adapted version of April Li's BTD game, written in C++, it will be worked on over the next few months as I learn how to use C++ and OpenGL. Most (previously implemented) game mechanics will remain unchanged, but the techniques to handle game events will most likely change quite a bit. I also intend on implementing more mechanics to better reflect BTD5 (BTD6 is slightly more advanced than I have the time for currently, but there will be hints of BTD6 in this implementation).

## All images curtesy of:
- https://bloonswiki.com/Gallery:Bloons_TD_6
- https://bloons.fandom.com/wiki/List_of_BTD_Bloons

## Original README
```md
# Bootleg-Balloons-TD-Battle
**Double L:** April Li and Nicole Liu

Our project is a bootleg version of the popular mini-game, Bloons TD Battle. The game will have a predetermined path on which balloons will travel. The purpose of the game will be to prevent the balloons from reaching the end of the path by setting down monkeys to pop the balloons. If the balloons do reach the end, then the player’s health will decrease based on the balloon’s value. Once the health reaches 0, the player will lose and the game will end. However, the more balloons that the player pops, the more income that the player receives, which they can then use to buy monkeys that will shoot at the balloons to pop them. As the player progresses through the levels, they will unlock different types of monkeys, each with a different set of skills and characteristics. Once placed on the map, these monkeys can be sold to earn back income. At the end of each round, the player will have the opportunity to buy upgrades for their monkeys. The round ends when all of the balloons disappear, and the rounds will get progressively more difficult.

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
* 6/2/22: Created runRound() that would spawn specified balloons in rounds[][][] for each of the rounds
* 6/3/22: Fixed monkey attack method
* 6/4/22: Added up 38 rounds
* 6/6/22: Created start and end screen with button options. Implemented income (buy, sell, round income).
* 6/7/22: Started freeplay mode and buttons to spawn the balloons.
* 6/10/22: Created buttonsList with balloonButtonList subclass to let user click any balloon button and spawn it
* 6/11/22: Created monkey subclasses and monkeyButtonList subclass to spawn any of the monkey subclasses created startRound/quit buttons.

**Nicole Liu**
* 5/23/22: I set up the Monkey and MonkeyList class. Monkey Class can display but MonkeyList is having some trouble.
* 5/25/22: I got the MonkeyList to work and display. I tested out the remove and add methods by implementing modes in the main and they seem to work. Also created a weapons class and started working on that. Also tested out the monkey class on the main class.
* 5/26/22: I started working on the findBalloon method and added some accessor methods to the classes.
* 5/27/22: I tested the findBallon method and created more methods like processAll() to apply the methods to the balloons.
* 5/29/22: I completed the attack method and started on the shootWeapon method and also made some updates to processAll().
* 5/30/22: I completed the shootWeapon method.
* 5/31/22: I made the monkey image load in the main and am trying to work on shootWeapon so that it works for all speeds.
* 6/1/22:  I tried to implement a timer to slow down the attacks.
* 6/2/22:  I am working on creating a weaponsList class to make the shooting mechanisms easier.
* 6/3/22:  I made it so that one monkey can't attack the same balloon and put restrictions on where a monkey can be placed.
* 6/4/22:  I fixed up the canBePlaced() and created a button class
* 6/5/22:  I made the monkey's statistics show up if your mouse touches the monkey and if you're in STATS mode
* 6/6/22:  I worked on displaying the monkey stats.
* 6/7/22:  I fixed canBePlaced() so monkeys cannot be placed in water.
* 6/9/22: I worked on dragging the monkey.
* 6/10/22: I worked on the dragging and creating the monkey methods and made it so that a circle would appear around the monkey while it was being dragged and made locking mechanisms.
* 6/11/22: I worked on creating upgrades and the cancel and sell button.
* 6/12/22: I created the waterMonkey and made comments and cleaned up sone code.
```

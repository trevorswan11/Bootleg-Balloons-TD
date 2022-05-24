# Bootleg-Balloons-TD-Battle

**Double L:** April Li and Nicole Liu

Our project is a bootleg version of the popular mini-game, Bloons TD Battle. The game will have a predetermined path on which balloons will travel. The purpose of the game will be to prevent the balloons from reaching the end of the path by setting down monkeys to pop the balloons. If the balloons do reach the end, then the player’s health will decrease based on the balloon’s value. Once the health reaches 0, the player will lose and the game will end. However, the more balloons that the player pops, the more income that the player receives, which they can then use to buy monkeys that will shoot at the balloons to pop them. As the player progresses through the levels, they will unlock different types of monkeys, each with a different set of skills and characteristics. Once placed on the map, these monkeys can be sold to earn back income. At the end of each round, the player will have the opportunity to buy upgrades for their monkeys. The round ends when all of the balloons disappear, and the rounds will get progressively more difficult.

**Design Document:** https://docs.google.com/document/d/1v6FhPbggvfvNtyiybX9_7laz6RiJBexw62pb6UX0cF0/edit

**Development Log**
**April Li**
* 5/21/22: I set up the Map and Balloon classes and displayed them. I tried to make the Balloon follow the path based on colors but it seems to go in the wrong direction.
* 5/24/22: I tested different INTERVALs for calculateDirections() and changed move() and followMap() into if statements and declared variables used in these functions as global variables

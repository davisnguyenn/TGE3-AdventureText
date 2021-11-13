LIST PlayerStatus = tired, hungry, stinky, grumpy

VAR Lies = 0
VAR Hour = 9
VAR Minute = 00
VAR Studious = 0
VAR Social = 0

LIST Major = (Undeclared), engineering, music, biology, philosophy

LIST Location = (Home), IVDeli, Chem1179, SantaCatalinaHall
LIST Height = short, tall


-> CharacterCreation.Start

=== CharacterCreation

= Start
Major?
* [Engineering]
    ~ Major = engineering
* [Music]
    ~ Major = music
* [Biology]
    ~ Major = biology
* [Philosophy]
    ~ Major = philosophy

- You picked {Major}.

Height?

* [5 ft. 2 in.]

    ~ Height = short
* [5 ft. 5 in.]
    ~ Height = short
* [5 ft. 8 in.]
    ~ Height = tall
* [6 ft. 1 in.]
    ~ Height = tall
    
- You are {Height}.


-> WakeUp

=== WakeUp

BEEP
...
BEEP
...
You have just woken up. The time is {Hour}:{Minute < 10:0{Minute}|{Minute}} AM.
+ [Hit the snooze button]
    ~ Minute += 5
    -> WakeUp
* [Get up]

- You stand up with a massive headache trying to remember what you did last night.
* You went out last night with your friends.
    ~ Social += 1
    Social skill increased to {Social}.
* [You stayed up late studying at the library.]
    ~ Studious += 1
    Studious skill increased to {Studious}.
//*    

- You suddenly remember that you have lecture at 10:00 AM, and it takes 35 minutes to get to class. What do you do?
-> BeforeLecture

= BeforeLecture

    { Minute > 59:
        ~ Hour = Hour + 1
        ~ Minute = Minute - 60
    }


The time is {Hour}:{Minute < 10:0{Minute}|{Minute}} AM.


* [Make breakfast and eat it]
    ~ Minute += 10
    ~ PlayerStatus -= hungry
    You feel full.
    -> BeforeLecture
* [Make a coffee and drink it]
    ~ Minute += 5
    ~ PlayerStatus -= tired
    You feel energized.
    -> BeforeLecture
* [Brush your teeth and wash your face]
    ~ Minute += 5
    ~ PlayerStatus -= stinky
    You feel clean.
    -> BeforeLecture
* [Tidy up your room]
    ~ Minute += 3
    Your room is clean.
    -> BeforeLecture
+ [Study for five minutes]
    ~ Minute += 5
    ~ Studious += 0.5
    Studious skill increased to {Studious} 
    -> BeforeLecture
* Head to lecture
    ~ Minute += 35

* Skip lecture
    -> Winder

    { Minute > 59:
        ~ Hour = Hour + 1
        ~ Minute = Minute - 60
    }
    
    {Hour > 12:
        What are you doing? You missed school today.
        
        -> Winder
    }

  - The time is {Hour}:{Minute} AM.
  
  // {Hour > 9 & Minute > 00
  //     You are are late to Lecture.
  //     ~ Studious -= 1
//   }

-> Lecture

===Lecture



->DONE



=== Winder
Hello! Welcome to the Winder, the hot dating app to help you find your match!
To get started, create your personal profile:



-> DONE


-> END
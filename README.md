# Digital-Clock
Make a simple digital clock that can display mm/dd, alarm clock and clock. Moreover, they can be adjusted by pressing 4 buttons on the board. For this project, we need to prepare:
- An arty-z7 20 board
- 4 7-segment leds
- a bread
- 33 wires

![The completed board](https://user-images.githubusercontent.com/92782164/167116688-767768ce-fd09-4717-83dd-d43888ea2f2d.jpg)

# Design
- First, we need to let the second increase 1 unit every 1 Hz clock signal and make the clock run logically. 
- Then pass it to the alarm clock to compare the real time and alarm time to determine whether to trigger the alarm signal to toggle 2 RGB leds, we can also adjust the alarm clock here. Meanwhile, the clock time is also passed to month date to make the month date module run logically. 
- Then, we are going to display the digits on 4 leds based on which modes we choose.

![flow chart](https://user-images.githubusercontent.com/92782164/167116800-fdacb67e-92a4-47ba-82c1-d08c95ecf92d.png)

# Implementation
- module combine: combine all sub-modules together and determine which signal is displayed on the leds.
- module get1hz: get 1 hz clock signal
- module buttons: adjust the alarm clock
- module edgeDetector: detect the button signal when it is pressed.
- module digital_clock: make the time run logically as well as adjust it
- module mmdd: make the date and month run logically as well as adjust month date.
- module  alarmClk: compare the real time and the alarm time to trigger alarm signal. Moreover, when button 2 or 3 is pressed, leds will display the alarm clock, then it returns to real time.
- module policeSiren: when the alarm signal is triggered, led 4 and 5 will display red and blue alternatively in 1 minute.
- module display: display the digits on 7-segment leds. 

+ sw0: if sw0 then turn on alarm mode. Otherwise, turn off       alarm mode.
+ sw1: if sw1 turns on then display hour and minute. Otherwise, display month and date.
+ btn0: increase minute by 1 unit if sw1 turns on. Otherwise, increase day by 1 unit.
+ btn1: increase hour by 1 unit if sw1 turns on. Otherwise, increase month by 1 unit.
+ btn2: increase minute of the alarm by 1 unit.
+ btn3: increase hour of the alarm by 1 unit.

# What's next?
- About the alarm mode: replace the RGB light blinking function with a Zynq micro-processor running embedded software to control sound output when alarms
- About aesthetics: Buy and install additional “:” led when displaying the led meter
- Technical: Reduce the number of modules as well as the complexity of the modules as low as possible but still ensure to retain all existing functionality




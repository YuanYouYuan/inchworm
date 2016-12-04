# Degree-PWM transfer table of 7 servo motors

## Deployment

There are totally 7 servo motors which are defined as M1~M7 in LabVIEW. 

M1 and M7 are two small servo motors which handle the suction cup. 

M2~M6 are normal-sized servo motors,

M2 and M6 handles the rotation of the ankle. 

M3~M5 are the theta1~theta3 in matlab which handle the bending of the body.

## M2~M6 position table(degree - pwm)

| Motor | 90 deg | 0 deg | -90 deg | slope  |
|:-----:|:------:|:-----:|:-------:|:------:|
| M2    | 1230   | 1518  | 1810    | -3.222 |
| M3    | 1860   | 1480  | 1075    | 4.361  |
| M4    | 1756   | 1460  | 1180    | 3.200  |
| M5    | 1870   | 1476  | 1090    | 4.333  |
| M6    | 1234   | 1524  | 1805    | -3.172 |


## M1 and M7 are only two states(release and adhere)

| Motor | release | adhere |
|:-----:|:-------:|:------:|
| M1    | 800     | 2000   |
| M7    | 1050    | 2000   |

Note that  release/adhere are defined as 90/-90 deg in LabVIEW respectively.

# Plan gaits

## Frames to gaits

Frames define the postions of motors in joint space in specific time.

Several frames form a gait, for example, save the frames to GAIT_NAME.mat in matlab, 
and then call the joint_trajctory function to form the complete gait.

stand_up_gait

| time | 0   | 1   | 2   | 3   |
|:----:|:---:|:---:|:---:|:---:|
| M1   | 90  | 90  | 90  | -90 |
| M2   | 0   | 90  | 90  | 90  |
| M3   | 0   | 45  | 45  | 45  |
| M4   | 0   | 0   | 90  | 90  |
| M5   | 0   | 45  | 45  | 45  |
| M6   | 0   | 90  | 90  | 90  |
| M7   | 90  | 90  | 90  | -90 |

```matlab
close all;
clear all;
addpath('./function')
load('./data/gaits/stand_up_gait.mat'); % load theta, time
plot_figure = 1;
[th, dth, ddth] = joint_trajectory(theta, time, plot_figure);
```



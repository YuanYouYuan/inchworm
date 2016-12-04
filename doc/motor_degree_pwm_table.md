# Servo motors

There are totally 7 servo motors which are defined as M1~M7 in LabVIEW. 

M1 and M7 are two small servo motors which handle the suction cup. 

M2~M6 are normal-sized servo motors,

M2 and M6 handles the rotation of the ankle. 

M3~M5 are the theta1~theta3 in matlab which handle the bending of the body.

# M2~M6 position table(degree - pwm)

| Motor | 90 deg | 0 deg | -90 deg |
|:-----:|:------:|:-----:|:-------:|
| M2    | 1230   | 1518  | 1810    |
| M3    | 1860   | 1480  | 1075    |
| M4    | 1756   | 1460  | 1180    |
| M5    | 1870   | 1476  | 1090    |
| M6    | 1234   | 1524  | 1805    |


# M1 and M7 are only two states(release and adhere)

| Motor | release | adhere |
|:-----:|:-------:|:------:|
| M1    | 800     | 2000   |
| M7    | 1050    | 2000   |

Note that  release/adhere are defined as 90/-90 deg in LabVIEW respectively.

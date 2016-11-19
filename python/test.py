import inchworm
import numpy as np
th = np.ones(3)
dth = np.ones(3)
ddth = np.ones(3)

state = np.ones((3,3))
states = [np.ones((3,3)), np.ones((3,3))*2]

t = inchworm.torque(state)
print(t)

print(inchworm.torque_check(states))

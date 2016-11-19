import numpy as np
from numpy import sin, cos, sinh, cosh, pi

#constant
G = 9.81
I1 = 0.00024939
I2 = 0.00038298
I3 = 0.00048535
L1 = 0.15
L2 = 0.15
L3 = 0.075
M1 = 0.11251
M2 = 0.13602
M3 = 0.27406
X1 = 0.07715
X2 = 0.0513
X3 = 0.03157


def torque(state):
    th, dth, ddth = state

    ddk = np.zeros(2)
    dk = np.zeros(2)
    du = np.zeros(2)
    torque = np.zeros(3)

    ddk[0] = M1*X1**2*ddth[0]+\
            0.5*M2*(2*L1**2*ddth[0]+2*X2**2*(ddth[0]+ddth[1])+\
            2*L1*X2*cos(th[1])*(2*ddth[0]+ddth[1])-\
            2*L1*X2*sin(th[1])*(2*dth[0]+dth[1])*dth[1])+\
            0.5*M3*(2*L1**2*ddth[0]+2*L2**2*(ddth[0]+ddth[1])+\
            2*X3**2*(ddth[0]+ddth[1]+ddth[2])+\
            2*L1*L2*cos(th[1])*(2*ddth[0]+ddth[1])-\
            2*L1*L2*sin(th[1])*(2*dth[0]+dth[1])*dth[1]+\
            2*L2*X3*cos(th[2])*(2*ddth[0]+2*ddth[1]+ddth[2])-\
            2*L2*X3*sin(th[2])*(2*dth[0]+2*dth[1]+dth[2])*dth[2]+\
            2*L1*X3*cos(th[1]+th[2])*(2*ddth[0]+ddth[1]+ddth[2])-\
            2*L1*X3*sin(th[1]+th[2])*(dth[1]+dth[2])*(2*dth[0]+dth[1]+dth[2]))+\
            I1*ddth[0]+I2*(ddth[0]+ddth[1])+I3*(ddth[0]+ddth[1]+ddth[2])

    ddk[1] = M2*(X2**2*(ddth[0]+ddth[1])+\
            L1*X2*(cos(th[1])*ddth[0]-dth[0]*dth[1]*sin(th[1])))+\
            M3*(L2**2*(ddth[0]+ddth[1])+\
            X3**2*(ddth[0]+ddth[1]+ddth[2])+\
            L1*L2*(cos(th[1])*ddth[0]-sin(th[1])*dth[0]*dth[1])+\
            L2*X3*(cos(th[2])*(2*ddth[0]+2*ddth[1]+ddth[2])-\
            sin(th[2])*(2*dth[0]+2*dth[1]+dth[2])*dth[2])+\
            L1*X3*(cos(th[1]+th[2])*ddth[0]-sin(th[1]+th[2])*(dth[1]+dth[2])*dth[0]))+\
            I2*(ddth[0]+ddth[1])+I3*(ddth[0]+ddth[1]+ddth[2])

    dk[1] = -1*(M2*L2*X2*(dth[0]**2+dth[0]*dth[1])*sin(th[1])+\
            M3*(L1*L2*(dth[0]**2+dth[0]*dth[1])*sin(th[1])+\
            L1*X3*(dth[0]**2+dth[0]*dth[1]+dth[0]*dth[2])*sin(th[1]+th[2])))

    du[0] = -M1*G*X1*sin(th[0])-\
            M2*G*(L1*sin(th[0])+X2*sin(th[0]+th[1]))-\
            M3*G*(L1*sin(th[0])+L2*sin(th[0]+th[1])+X3*sin(th[0]+th[1]+th[2]))
        
    du[1] = -G*(M2*X2*sin(th[0]+th[1])+\
            M3*(L2*sin(th[0]+th[1])+X3*sin(th[0]+th[1]+th[2])))
    torq = ddk - dk + du

    return torq

def tension_spline():
    spline = []
    return spline

def torque_check(states):
    # True means pass, False means exceed
    check = True
    for state in states:
        dth = state[1]
        rated_torque = (1 - 0.54 /pi * abs(dth)) * 25.8 * G * 0.01
        for t, rt in zip(torque(state), rated_torque):
            if abs(t) > rt:
                check = False
                return check
    return check
        

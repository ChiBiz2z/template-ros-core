import cv2
import numpy as np
l_yellow_range = np.array([20, 100, 100])
u_yellow_range = np.array([30, 255, 255])

def solution(obs):
    print(obs.shape)    
    img_hsv = cv2.cvtColor(np.ascontiguousarray(obs), cv2.COLOR_RGB2HSV)
    mask = cv2.inRange(img_hsv, l_yellow_range, u_yellow_range)    
    yellow_ratio = (cv2.countNonZero(mask)) / (img_hsv.size / 3)
    res = np.round(yellow_ratio * 100, 2)
    
    if(res > 0)
        return [0.1, 0]
    else
        return [0, 0.5]

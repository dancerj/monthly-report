#!/usr/bin/env python
# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt

X1 = [1, 2, 3, 4, 5, 6]
Y1 = [75, 68, 108, 74, 53, 77]

X2 = [1.4, 2.4, 3.4, 4.4, 5.4, 6.4]
Y2 = [35, 61, 101, 70, 65, 93]

plt.bar(X1, Y1, color='b', width=0.4, label='update package', align="center")
plt.bar(X2, Y2, color='r', width=0.4, label='DSA(security)', align="center")

# 凡例を表示
plt.legend(loc="best")

# X軸の目盛りを書き換える
plt.xticks([1.2, 2.2, 3.2, 4.2, 5.2, 6.2], ['8.1', '8.2', '8.3', '8.4', '8.5', '8.6'])

plt.show()

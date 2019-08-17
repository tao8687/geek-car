# -*- coding: utf-8 -*-
import numpy as np
import cv2
import time
from modules.sensors.proto.sensors_pb2 import Image
from cyber_py import cyber
import sys

sys.path.append("../")


class Exercise(object):

    def __init__(self, node):
        self.node = node
        self.msg = Image()

        # TODO create reader
        self.node.create_reader("/realsense/raw_image", Image, self.callback)

    def callback(self, data):
        # TODO
        print(data.frame_no)


if __name__ == '__main__':
    cyber.init()
    # TODO update node to your name
    exercise_node = cyber.Node("your_name")
    exercise = Exercise(exercise_node)

    exercise_node.spin()

    cyber.shutdown()
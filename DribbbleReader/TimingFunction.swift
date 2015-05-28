//
//  TimingFunction.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/28.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation

enum timingFunction{
    case Linear,EaseIn,EaseOut,EaseInOut,
    Spring,
    EaseInSine,EaseOutSine,EaseInOutSine,
    EaseInQuad,EaseOutQuad,EaseInOutQuad,
    EaseInCubic,EaseOutCubic,EaseInOutCubic,
    EaseInQuart,EaseOutQuart,EaseInOutQuart,
    EaseInQuint,EaseOutQuint,EaseInOutQuint,
    EaseInExpo,EaseOutExpo,EaseInOutExpo,
    EaseInCirc,EaseOutCirc,EaseInOutCirc,
    EaseInBack,EaseOutBack,EaseInOutBack
}

func getTimingFunction(curve:timingFunction) -> CAMediaTimingFunction {
    switch curve {
    case .Linear:
        return CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    case .EaseIn:
        return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    case .EaseOut:
        return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    case .EaseInOut:
        return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    case .Spring:
        return CAMediaTimingFunction(controlPoints: 0.5, 1.1+Float(1/3), 1, 1)
    case .EaseInSine:
        return CAMediaTimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
    case .EaseOutSine:
        return CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
    case .EaseInOutSine:
        return CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
    case .EaseInQuad:
        return CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
    case .EaseOutQuad:
        return CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
    case .EaseInOutQuad:
        return CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
    case .EaseInCubic:
        return CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
    case .EaseOutCubic:
        return CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
    case .EaseInOutCubic:
        return CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
    case .EaseInQuart:
        return CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
    case .EaseOutQuart:
        return CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
    case .EaseInOutQuart:
        return CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
    case .EaseInQuint:
        return CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
    case .EaseOutQuint:
        return CAMediaTimingFunction(controlPoints: 0.23, 1, 0.32, 1)
    case .EaseInOutQuint:
        return CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1)
    case .EaseInExpo:
        return CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
    case .EaseOutExpo:
        return CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
    case .EaseInOutExpo:
        return CAMediaTimingFunction(controlPoints: 1, 0, 0, 1)
    case .EaseInCirc:
        return CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
    case .EaseOutCirc:
        return CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
    case .EaseInOutCirc:
        return CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
    case .EaseInBack:
        return CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
    case .EaseOutBack:
        return CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
    case .EaseInOutBack:
        return CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
    default:
        return CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
    }
}
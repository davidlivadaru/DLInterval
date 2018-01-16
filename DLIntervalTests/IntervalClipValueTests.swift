//
//  IntervalClipValueTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 1/15/18.
//  Copyright © 2018 David Livadaru. All rights reserved.
//

import XCTest
@testable import DLInterval_iOS

class IntervalClipValueTests: XCTestCase {
    func testOpenOpenInterval_ExcendMinimumValue() {
        let interval: Interval = 1.><.2
        let value = interval.clipValue(-1.0)
        XCTAssert(value > interval.lowerBoundary.value)
    }

    func testOpenOpenInterval_WithinValue() {
        let interval: Interval = 1.><.2
        let testValue = 1.5
        let value = interval.clipValue(testValue)
        XCTAssert(value == testValue)
    }

    func testOpenOpenInterval_ExcendMaximumValue() {
        let interval: Interval = 1.><.2
        let value = interval.clipValue(3.0)
        XCTAssert(value < interval.upperBoundary.value)
    }

    func testClosedOpenInterval_ExcendMaximumValue() {
        let interval = Interval(1.0..<2.0)
        let value = interval.clipValue(3.0)
        XCTAssert(value < interval.upperBoundary.value)
    }

    func testClosedClosedInterval_ExcendMinimumValue() {
        let interval: Interval = [1..2]
        let value = interval.clipValue(-1.0)
        XCTAssert(value == interval.lowerBoundary.value)
    }

    func testClosedClosedInterval_WithinValue() {
        let interval: Interval = [1..2]
        let testValue = 1.5
        let value = interval.clipValue(testValue)
        XCTAssert(value == testValue)
    }

    func testClosedClosedInterval_ExcendMaximumValue() {
        let interval: Interval = [1..2]
        let value = interval.clipValue(3.0)
        XCTAssert(value == interval.upperBoundary.value)
    }

    func testClosedOpen_greatestFiniteMagnitude_PositiveGreatestFiniteMagnitude() {
        let interval: Interval = 1.<.Double.greatestFiniteMagnitude
        let value = interval.clipValue(Double.greatestFiniteMagnitude)
        XCTAssert(value == Double.greatestFiniteMagnitude.previous)
    }

    func testClosedOpen_greatestFiniteMagnitude_PositiveInfinity() {
        let interval: Interval = 1.<.Double.greatestFiniteMagnitude
        let value = interval.clipValue(Double.infinity)
        XCTAssert(value == Double.greatestFiniteMagnitude.previous)
    }

    func testClosedOpen_greatestFiniteMagnitude_NegativeGreatestFiniteMagnitude() {
        let interval: Interval = 1.<.Double.greatestFiniteMagnitude
        let value = interval.clipValue(-Double.greatestFiniteMagnitude)
        XCTAssert(value == 1.0)
    }

    func testClosedOpen_greatestFiniteMagnitude_NegativeInfinity() {
        let interval: Interval = 1.<.Double.greatestFiniteMagnitude
        let value = interval.clipValue(-Double.infinity)
        XCTAssert(value == 1.0)
    }

    func testClosedOpen_infinity_PositiveInfinity() {
        let interval: Interval = 1.<.Double.infinity
        let value = interval.clipValue(Double.infinity)
        XCTAssert(value == Double.infinity)
    }

    func testClosedOpen_infinity_PositiveGreatestFiniteMagnitude() {
        let interval: Interval = 1.<.Double.infinity
        let value = interval.clipValue(Double.greatestFiniteMagnitude)
        XCTAssert(value == Double.greatestFiniteMagnitude)
    }

    func testClosedOpen_infinity_NegativeInfinity() {
        let interval: Interval = 1.<.Double.infinity
        let value = interval.clipValue(-Double.infinity)
        XCTAssert(value == 1.0)
    }

    func testClosedOpen_infinity_NegativeGreatestFiniteMagnitude() {
        let interval: Interval = 1.<.Double.infinity
        let value = interval.clipValue(-Double.greatestFiniteMagnitude)
        XCTAssert(value == 1.0)
    }

    func testOpenClosed_greatestFiniteMagnitude_PositiveGreatestFiniteMagnitude() {
        let interval: Interval = -Double.greatestFiniteMagnitude.>.1
        let value = interval.clipValue(Double.greatestFiniteMagnitude)
        XCTAssert(value == 1.0)
    }

    func testOpenClosed_greatestFiniteMagnitude_PositiveInfinity() {
        let interval: Interval = -Double.greatestFiniteMagnitude.>.1
        let value = interval.clipValue(Double.infinity)
        XCTAssert(value == 1.0)
    }

    func testOpenClosed_greatestFiniteMagnitude_NegativeGreatestFiniteMagnitude() {
        let interval: Interval = -Double.greatestFiniteMagnitude.>.1
        let value = interval.clipValue(-Double.greatestFiniteMagnitude)
        XCTAssert(value == (-Double.greatestFiniteMagnitude).next)
    }

    func testOpenClosed_greatestFiniteMagnitude_NegativeInfinity() {
        let interval: Interval = -Double.greatestFiniteMagnitude.>.1
        let value = interval.clipValue(-Double.infinity)
        XCTAssert(value == (-Double.greatestFiniteMagnitude).next)
    }

    func testOpenClosed_infinity_PositiveInfinity() {
        let interval: Interval = -Double.infinity.>.1
        let value = interval.clipValue(Double.infinity)
        XCTAssert(value == 1.0)
    }

    func testOpenClosed_infinity_PositiveGreatestFiniteMagnitude() {
        let interval: Interval = -Double.infinity.>.1
        let value = interval.clipValue(Double.greatestFiniteMagnitude)
        XCTAssert(value == 1.0)
    }

    func testOpenClosed_infinity_NegativeInfinity() {
        let interval: Interval = -Double.infinity.>.1
        let value = interval.clipValue(-Double.infinity)
        XCTAssert(value == -Double.infinity)
    }

    func testOpenClosed_infinity_NegativeGreatestFiniteMagnitude() {
        let interval: Interval = -Double.infinity.>.1
        let value = interval.clipValue(-Double.greatestFiniteMagnitude)
        XCTAssert(value == -Double.greatestFiniteMagnitude)
    }
}

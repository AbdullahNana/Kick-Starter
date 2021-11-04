//
//  SingleVenueViewModelTests.swift
//  Kick-StarterTests
//
//  Created by Abdullah Nana on 2021/10/28.
//
import XCTest

class SingleVenueViewModelTests: XCTestCase {
    private var viewModelUnderTest: SingleVenueViewModel!
    override func setUp() {
        viewModelUnderTest = SingleVenueViewModel()
    }
    private var mockedVenueData: Venue {
        let mockedVenueData = Venue(id: 123, name: "Old Trafford",
                                    city: "Manchester", capacity: 72500, image: "background")
        return mockedVenueData
    }
    func testVenueName() {
        viewModelUnderTest.set(mockedVenueData)
        XCTAssertEqual(mockedVenueData.name, viewModelUnderTest.venueName())
    }
    func testVenueCapacity() {
        viewModelUnderTest.set(mockedVenueData)
        let capacity = "Venue Capacity: \(mockedVenueData.capacity!)"
        XCTAssertEqual(capacity, viewModelUnderTest.venueCapacity())
    }
    func testVenueCity() {
        viewModelUnderTest.set(mockedVenueData)
        let city = "City: \(mockedVenueData.city!)"
        XCTAssertEqual(city, viewModelUnderTest.venueCity())
    }
    func testVenueImage() {
        viewModelUnderTest.set(mockedVenueData)
        XCTAssertEqual(mockedVenueData.image, viewModelUnderTest.venueImage())
    }
}

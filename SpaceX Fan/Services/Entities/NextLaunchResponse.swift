//
//  NextLaunchResponse.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

// MARK: - NextLaunchResponse
struct NextLaunchResponse: Codable {
    let fairings: Fairings
    let links: Links
    let tbd, net: Bool
    let rocket, details: String
    let ships, payloads: [String]
    let launchpad: String
    let autoUpdate: Bool
    let launchLibraryID: String
    let flightNumber: Int
    let name, dateUTC: String
    let dateUnix: Int
    let dateLocal: Date
    let datePrecision: String
    let upcoming: Bool
    let cores: [Core]
    let id: String

    enum CodingKeys: String, CodingKey {
        case fairings, links, tbd, net, rocket, details, ships, payloads, launchpad
        case autoUpdate = "auto_update"
        case launchLibraryID = "launch_library_id"
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming, cores, id
    }
}

// MARK: - Core
struct Core: Codable {
    let core: String
    let flight: Int
    let gridfins, legs, reused, landingAttempt: Bool
    let landingType, landpad: String

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt = "landing_attempt"
        case landingType = "landing_type"
        case landpad
    }
}

// MARK: - Fairings
struct Fairings: Codable {
    let recoveryAttempt: Bool
    let ships: [String]

    enum CodingKeys: String, CodingKey {
        case recoveryAttempt = "recovery_attempt"
        case ships
    }
}

// MARK: - Links
struct Links: Codable {
    let wikipedia: String
}

//
//  File.swift
//  App outline
//
//  Created by Steve on 5/6/24.
//

//
//  data.swift
//  SSFS trivia project
//
//  Created by Steve on 5/1/24.
//

import Foundation

struct Player: Codable {
    let season: Int
    let age: Int
    let playerName: String
    let teamName: String
    let W: Int
    let L: Int
    let ERA: Double
    let QS: Int
    let IP: Double
    let H: Int
    let R: Int
    let ER: Int
    let HR: Int
    let BB: Int
    let HBP: Int
    let SO: Int
    let K9: Double
    let BB9: Double
    let KBB: Double
    let H9: Double
    let AVG: Double
    let WHIP: Double
    let FIP: Double
    let WAR: Double
    let wFB: Double
    let wSL: Double
    let wCT: Double?
    let wCB: Double
    let wCH: Double
    let wSF: Double?
    let wKN: Double?
    let wFBC: Double
    let wSLC: Double
    let wCTC: Double?
    let wCBC: Double
    let wCHC: Double
    let wSFC: Double?
    let wKNC: Double?
    let Barrel: Double
    let HardHit: Double
    let EV: Double
    let pfxvFA: Double

    enum CodingKeys: String, CodingKey {
        case season = "Season"
        case age = "Age"
        case playerName = "PlayerName"
        case teamName = "TeamName"
        case W
        case L
        case ERA
        case QS
        case IP
        case H
        case R
        case ER
        case HR
        case BB
        case HBP
        case SO
        case K9 = "K/9"
        case BB9 = "BB/9"
        case KBB = "K/BB"
        case H9 = "H/9"
        case AVG
        case WHIP
        case FIP
        case WAR
        case wFB
        case wSL
        case wCT
        case wCB
        case wCH
        case wSF
        case wKN
        case wFBC = "wFB/C"
        case wSLC = "wSL/C"
        case wCTC = "wCT/C"
        case wCBC = "wCB/C"
        case wCHC = "wCH/C"
        case wSFC = "wSF/C"
        case wKNC = "wKN/C"
        case Barrel
        case HardHit
        case EV
        case pfxvFA = "pfxvFA"
    }
}

struct PlayerData: Codable {
    let data: [Player]
    let totalCount: Int
    let dateRange: String
    let dateRangeSeason: String
    let sortStat: String
    let sortDir: String
}
func readJSONFromFile(fileName: String) -> Data? {
    if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch {
            print("Error reading JSON file: \(error)")
        }
    }
    return nil
}
func parsePlayerData() {
    guard let jsonData = readJSONFromFile(fileName: "pitchdata") else {
        print("Failed to read JSON file")
        return
    }

    let decoder = JSONDecoder()
    do {
        let playerData = try decoder.decode(PlayerData.self, from: jsonData)
        let players = playerData.data
        // Now you have an array of Player objects
        for player in players {
            print("Player Name: \(player.playerName), Team: \(player.teamName), ERA: \(player.ERA)")
        }
    } catch {
        print("Error decoding JSON: \(error)")
    }
}



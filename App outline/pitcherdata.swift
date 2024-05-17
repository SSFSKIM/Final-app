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

// Define the struct to represent the player data
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
    let wCT: Double
    let wCB: Double
    let wCH: Double
    let wSF: Double
    let wKN: Double
    let wFBC: Double
    let wSLC: Double
    let wCTC: Double
    let wCBC: Double
    let wCHC: Double
    let wSFC: Double
    let wKNC: Double
    let Barrel: Double
    let HardHit: Double
    let EV: Double
    
    enum CodingKeys: String, CodingKey {
        case season, age, playerName = "player_name", teamName = "team_name"
        case W, L, ERA, QS, IP, H, R, ER, HR, BB, HBP, SO, K9, BB9, KBB, H9, AVG, WHIP, FIP, WAR
        case wFB, wSL, wCT, wCB, wCH, wSF, wKN
        case wFBC = "wFB/C", wSLC = "wSL/C", wCTC = "wCT/C", wCBC = "wCB/C", wCHC = "wCH/C", wSFC = "wSF/C", wKNC = "wKN/C"
        case Barrel = "Barrel%", HardHit = "HardHit%", EV = "EV"
    }
}

// Function to fetch and parse JSON data from the provided URL
func fetchData() {
    guard let url = URL(string: "https://www.fangraphs.com/_next/data/3ckubF_ynPQFFgnUqN9zi/leaders/major-league.json?pos=all&stats=pit&lg=all&qual=y&type=8&ind=1&team=0&rost=0&players=0&startdate=&enddate=&season1=2010&season=2023&pageitems=200") else {
        print("Invalid URL")
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }
        
        guard let data = data else {
            print("No data received")
            return
        }
        
        do {
            let players = try JSONDecoder().decode([Player].self, from: data)
            // Sort players by WAR
            let sortedPlayers = players.sorted(by: { $0.WAR > $1.WAR })
            // Print or use sortedPlayers as needed
            print(sortedPlayers)
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }.resume()
}



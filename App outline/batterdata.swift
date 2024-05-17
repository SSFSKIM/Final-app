//
//  File.swift
//  App outline
//
//  Created by Steve on 5/6/24.
//
import Foundation

// Define the struct to represent the hitter data
struct Hitter: Codable {
    let playerName: String
    let teamName: String
    let season: Int
    let age: Int
    let AVG: Double
    let BBPercent: Double
    let KPercent: Double
    let OBP: Double
    let OPS: Double
    let SLG: Double
    let wRCPlus: Int
    let wOBA: Double
    let WAR: Double
    let Defense: Double
    let maxEV: Double
    let HardHitPercent: Double
    let BarrelPercent: Double
    let EV: Double
    
    enum CodingKeys: String, CodingKey {
        case playerName = "player_name", teamName = "team_name", season, age, AVG, BBPercent = "BB%", KPercent = "K%", OBP, OPS, SLG, wRCPlus, wOBA, WAR, Defense, maxEV = "maxEV", HardHitPercent = "HardHit%", BarrelPercent = "Barrel%", EV = "EV"
    }
}

// Function to fetch and parse JSON data from the provided URL
func fetchHitterData() {
    guard let url = URL(string: "https://www.fangraphs.com/_next/data/3ckubF_ynPQFFgnUqN9zi/leaders/major-league.json?pos=all&stats=bat&lg=all&qual=y&type=8&ind=1&startdate=&enddate=&season1=2005&season=2023&pageitems=100") else {
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
            let hitters = try JSONDecoder().decode([Hitter].self, from: data)
            // Sort hitters by WAR
            let sortedHitters = hitters.sorted(by: { $0.WAR > $1.WAR })
            // Print or use sortedHitters as needed
            print(sortedHitters)
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }.resume()
}

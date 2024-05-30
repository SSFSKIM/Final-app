//
//  ViewController.swift
//  App outline
//
//  Created by Steve on 4/27/24.
//
import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var Outs: UIStackView!
    @IBOutlet weak var Points: UITextField!
    @IBOutlet weak var PositionType: UITextField!
    @IBOutlet weak var StatType: UITextView!
    @IBOutlet weak var Choice1: UITextView!
    @IBOutlet weak var Choice2: UITextView!
    
    var hitters: [Hitter] = []
    var pitchers: [Pitcher] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func loadRandomPlayers() {
         let isPitcher = Bool.random()
         if isPitcher {
             PositionType.text = "Pitcher"
             let player1 = pitchers.randomElement()!
             let player2 = pitchers.randomElement()!
             Choice1.text = "\(player1.playerName) \(player1.season)"
             Choice2.text = "\(player2.playerName) \(player2.season)"
             StatType.text = "WAR"
         } else {
             PositionType.text = "Hitter"
             let player1 = hitters.randomElement()!
             let player2 = hitters.randomElement()!
             Choice1.text = "\(player1.playerName) \(player1.season)"
             Choice2.text = "\(player2.playerName) \(player2.season)"
             StatType.text = "WAR"
         }
     }

     // Implement logic for checking the user's choice here
 }

    func loadHitterData() -> [Hitter] {
        guard let path = Bundle.main.path(forResource: "hitdata", ofType: "json") else { fatalError("Couldn't find pitcherdata.json") }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let hitters = try JSONDecoder().decode([Hitter].self, from: data)
            return hitters
        } catch {
            print("Error loading hitter data: \(error)")
            return []
        }
    }





    func loadPitcherData() -> [Pitcher] {
        guard let path = Bundle.main.path(forResource: "pitchdata", ofType: "json") else { fatalError("Couldn't find pitcherdata.json") }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let pitchers = try JSONDecoder().decode([Pitcher].self, from: data)
            return pitchers
        } catch {
            print("Error loading pitcher data: \(error)")
            return []
        }
        
        
    }

   
        


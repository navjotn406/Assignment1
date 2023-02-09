//
//  ViewController.swift
//  Assignment1
//
//  Created by Navjot Singh on 2023-02-08.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func FetchAnimeData(_ sender: UIButton) {
        sender.isEnabled = false
        Task{
            do{
                print(try await Anime_Helper.fetchAnimeData())
                sender.isEnabled = true
            } catch let err{
                print("Getting an error with the Anime API: \(err)")
            }
        }
    }
    
    @IBAction func GameOfThronesQuotes(_ sender: UIButton) {
        sender.isEnabled = false
        Task{
            do{
                print(try await GameOfThrones_Helper.fetchGameOfThronesData())
                sender.isEnabled = true
            } catch let err{
                print("Getting an error with the GameOfThrones API: \(err)")
            }
        }

    }
    
    @IBAction func FavQshelper(_ sender: UIButton) {
        sender.isEnabled = false
        Task{
            do{
                print(try await FavQs_Helper.fetchFavQs())
                sender.isEnabled = true
            } catch let err{
                print("Getting an error with the FavQs API: \(err)")
            }
        }

    }
    
    
}

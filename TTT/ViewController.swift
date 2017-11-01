//
//  ViewController.swift
//  TTT
//
//  Created by Patrick Hayes on 11/1/17.
//  Copyright © 2017 Patrick Hayes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var block1: UIButton!
    @IBOutlet weak var block2: UIButton!
    @IBOutlet weak var block3: UIButton!
    @IBOutlet weak var block4: UIButton!
    @IBOutlet weak var block5: UIButton!
    @IBOutlet weak var block6: UIButton!
    @IBOutlet weak var block7: UIButton!
    @IBOutlet weak var block8: UIButton!
    @IBOutlet weak var block9: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    
    var clickedBlocks: [Int] = []
    var colors = ["grey","grey","grey","grey","grey","grey","grey","grey","grey"]
    
    var turn = 2
    
    @IBAction func blockClick(_ sender: UIButton) {
        if notClicked(arr: clickedBlocks, spot: sender.tag){
            clickedBlocks.append(sender.tag)
            print(sender.tag)
            if turn == 1{
                sender.backgroundColor = UIColor.red
                colors[sender.tag-1] = "Red"
                turn = 2
                checkGame(position: sender.tag, color: "Red")
            } else {
                sender.backgroundColor = UIColor.blue
                colors[sender.tag-1] = "Blue"
                turn = 1
                checkGame(position: sender.tag, color: "Blue")
            }
        }
    }
    
    func notClicked(arr: [Int], spot: Int) -> Bool{
        for i in 0..<arr.count {
            if arr[i] == spot{
                return false
            }
        }
        return true
    }
    
    func checkGame(position: Int, color: String){
        //Bottom row, checks if left column wins
        if position - 6 >= 1 && position - 6 <= 3{
            if colors[position - 1 - 3] == color && colors[position - 1 - 6] == color{
                gameOver(color: color)
            }
        }
        //Top Row
        if position + 6 >= 7 && position + 6 <= 9{
            if colors[position - 1 + 3] == color && colors[position - 1 + 6] == color{
                gameOver(color: color)
            }
        }
        
        //checks from left to right
        if (position + 2) % 3 == 0{
            if colors[position - 1 + 2] == color && colors[position - 1 + 1] == color{
                gameOver(color: color)
            }
        }
        
        //checks from right to left
        if (position - 2) == 1 || (position - 2) == 4 || (position - 2) == 7 {
            if colors[position - 1 - 2] == color && colors[position - 1 - 1] == color{
                gameOver(color: color)
            }
        }
        
        //checks above and below
        if (position - 3) >= 1 && (position - 3) <= 3{
            if colors[position - 1 - 3] == color && colors[position - 1 + 3] == color{
                gameOver(color: color)
            }
        }
        
        //checks diagonal bottom left to top-right
        if (position - 4) == 3{
            if colors[position - 1 - 2] == color && colors[position - 1 - 4] == color{
                gameOver(color: color)
            }
        }
        
        //checks diagonal top right to bottom-left
        if (position + 4) == 7{
            if colors[position - 1 + 2] == color && colors[position - 1 + 4] == color{
                gameOver(color: color)
            }
        }
        
        //checks diagonal top left to bottom-right
        if (position + 8) == 9{
            if colors[position - 1 + 4] == color && colors[position - 1 + 8] == color{
                gameOver(color: color)
            }
        }
        
        //checks diagonal bottom right to top-left
        if (position - 8) == 1{
            if colors[position - 1 - 4] == color && colors[position - 1 - 8] == color{
                gameOver(color: color)
            }
        }
        
        //checks diagonal middle in all directions
        if (position - 2) == 3{
            if colors[position - 1 - 2] == color && colors[position - 1 + 2] == color{
                gameOver(color: color)
            }else if colors[position - 1 - 4] == color && colors[position - 1 + 4] == color{
                gameOver(color: color)
            }
        }
    }
    
    func gameOver(color: String){
        winnerLabel.text = "\(color) wins!"
        winnerLabel.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        winnerLabel.isHidden = true
        colors = ["grey","grey","grey","grey","grey","grey","grey","grey","grey"]
        clickedBlocks = []
        turn = 2
        block1.backgroundColor = UIColor.gray
        block2.backgroundColor = UIColor.gray
        block3.backgroundColor = UIColor.gray
        block4.backgroundColor = UIColor.gray
        block5.backgroundColor = UIColor.gray
        block6.backgroundColor = UIColor.gray
        block7.backgroundColor = UIColor.gray
        block8.backgroundColor = UIColor.gray
        block9.backgroundColor = UIColor.gray
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


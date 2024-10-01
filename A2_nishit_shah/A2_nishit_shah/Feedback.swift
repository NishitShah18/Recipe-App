//
//  Feedback.swift
//  A2_nishit_shah
//
//  Created by Nishit Shah on 2024-02-18.
//

import UIKit

class Feedback: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var recipeName: UILabel!
    
    @IBOutlet weak var scrollBar: UISlider!
    
    @IBOutlet weak var thankyou: UILabel!
    @IBOutlet weak var selectOption: UISwitch!
    @IBOutlet weak var review: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeName.text = RecipeClass.shared.imageNames[RecipeClass.shared.selectedIndex];
    }

    @IBAction func ratingChanged(_ sender: UISlider) {
        let myInteger = Int(sender.value)
        
        scoreLabel.text = "\(myInteger)" + "/10"
    }
    
    @IBAction func submitReset(_ sender: UIButton) {
        review.text = ""
        scrollBar.value = 5
        selectOption.isOn = false
        thankyou.text = "Thank Your for your Feedback"
        scoreLabel.text = "5/10"
    }
}

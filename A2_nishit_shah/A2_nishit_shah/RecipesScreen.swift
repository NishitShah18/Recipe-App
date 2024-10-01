//
//  RecipesScreen.swift
//  A2_nishit_shah
//
//  Created by Nishit Shah on 2024-02-18.
//

import UIKit

class RecipesScreen: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var imageSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeImage.image = UIImage(named: "EasyGuacamole")
        button1.isHidden = false
        button2.isHidden = true
        button3.isHidden = true
        
        recipeImage.layer.cornerRadius = 25.0
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = imageSegmentedControl.selectedSegmentIndex
        let imageName = RecipeClass.shared.imageNames
        
        switch selectedSegmentIndex{
        case 0:
            button1.isHidden = false
            button2.isHidden = true
            button3.isHidden = true
        case 1:
            button1.isHidden = true
            button2.isHidden = false
            button3.isHidden = true
        case 2:
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = false
        default:
            break
        }
        
        recipeImage.image = UIImage(named: imageName[selectedSegmentIndex])
    }
    
    @IBAction func selectPecipe(_ sender: UIButton) {
        RecipeClass.shared.selectedIndex = imageSegmentedControl.selectedSegmentIndex
        selectedLabel.text = RecipeClass.shared.imageNames[RecipeClass.shared.selectedIndex] + " is Selected."
    }
        
}

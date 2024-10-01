//
//  TimerView.swift
//  A2_nishit_shah
//
//  Created by Nishit Shah on 2024-02-18.
//

import UIKit

class TimerView: UIViewController {

    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    var totalTimeForCooking = RecipeClass.shared.totalTime[RecipeClass.shared.selectedIndex]
    var remainingTime = RecipeClass.shared.totalTime[RecipeClass.shared.selectedIndex] * 60 // Convert minutes to seconds
    var timerInstance: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeName.text = RecipeClass.shared.imageNames[RecipeClass.shared.selectedIndex]
        totalTimeLabel.text = "Total time required : " + "\(totalTimeForCooking)"
        updateTimerLabel()
        stepper.value = Double(totalTimeForCooking)
    }
    
    @IBAction func stepperChangedByOneSecond(_ sender: UIStepper) {
        remainingTime = Int(stepper.value) * 60
        updateTimerLabel()
    }
    
    @IBAction func startTimerCountDown(_ sender: UIButton) {
        if timerInstance == nil {
                    timerInstance = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(foodTimer), userInfo: nil, repeats: true)
                }
        //let timerInstance = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(foodTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseTimerCountDown(_ sender: UIButton) {
        timerInstance?.invalidate()
        timerInstance = nil
    }
    
    @IBAction func resetTimerCountDown(_ sender: UIButton) {
        remainingTime = totalTimeForCooking * 60
        updateTimerLabel()
        timerInstance?.invalidate()
        timerInstance = nil
        stepper.value = Double(totalTimeForCooking)
    }

    @objc func foodTimer(){
        if remainingTime > 0 {
            remainingTime -= 1
            updateTimerLabel()
        } else {
            timerInstance?.invalidate()
            timerInstance = nil
            handleTimerCompletion()
        }
    }
    
    func updateTimerLabel() {
            let minutes = remainingTime / 60
            let seconds = remainingTime % 60
            timer.text = String(format: "%02d:%02d", minutes, seconds)
            
    }
    
    func handleTimerCompletion() {
        // Perform any actions you want when the timer reaches 0
        let alertController = UIAlertController(title: "Timer Completed", message: "Your cooking is done!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

//
//  ViewController.swift
//  ReswiftExample
//
//  Created by abelFernandez on 20/10/2018.
//  Copyright © 2018 daferpi. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController {
    
    
    
    let DefaultValue = 0
    
    @IBOutlet var plusBtn: UIButton!
    @IBOutlet var minusBtn: UIButton!
    @IBOutlet var counterLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribeToMainStore()
        counterResetToDefault()
    }
    
    private func counterResetToDefault() {
        counterLbl.text = "\(DefaultValue)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeToMainStore()
    }
    
    @IBAction func plusAction(_ sender: UIButton) {
        mainStore.dispatch(CounterActionIncrease())
    }
    

    @IBAction func minusAction(_ sender: UIButton) {
        mainStore.dispatch(CounterActionDecrease())
    }
    
}

extension ViewController: StoreSubscriber {
    
    typealias StoreSubscriberStateType = AppState
    
    func newState(state: AppState) {
        counterLbl.text = "\(state.count)"
    }
    
    private func subscribeToMainStore() {
        mainStore.subscribe(self)
    }
    
    private func unsubscribeToMainStore() {
        mainStore.unsubscribe(self)
    }
}

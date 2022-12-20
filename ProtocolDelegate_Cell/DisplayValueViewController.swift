//
//  DisplayValueViewController.swift
//  ProtocolDelegate_Cell
//
//  Created by Alessio Di Nardo on 20/12/22.
//

import UIKit

class DisplayValueViewController: UIViewController {
    
    @IBOutlet weak var languageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tap(_ sender: Any) {
        guard let secondView = self.storyboard?.instantiateViewController(withIdentifier: "InsertValueViewController") as? InsertValueViewController else {
            fatalError("View Controller not found")}
        secondView.delegate = self
        self.navigationController?.pushViewController(secondView, animated: true)

    }
}

extension DisplayValueViewController: InsertValueDelegate {
    func textPlatform(text: String) {
        languageLabel.text = (languageLabel.text ?? "") + " " + text
    }
}

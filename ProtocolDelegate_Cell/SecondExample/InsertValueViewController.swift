//
//  InsertValueViewController.swift
//  ProtocolDelegate_Cell
//
//  Created by Alessio Di Nardo on 20/12/22.
//

import UIKit

protocol InsertValueDelegate: AnyObject {
    func textPlatform(text: String)
}

class InsertValueViewController: UIViewController {
    
    weak var delegate: InsertValueDelegate?
    
    @IBOutlet weak var languageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func doneTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        delegate?.textPlatform(text: languageTextField.text ?? "")
    }
}

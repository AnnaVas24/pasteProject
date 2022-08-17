//
//  ViewController.swift
//  pasteProject
//
//  Created by Vasichko Anna on 17.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTextView: UITextView!
    
    @IBOutlet weak var textField: UITextField!
    
    
   // let pasteController = UIPasteControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenu()
        setupTextField()

//      textField.inputAccessoryView = pasteController
//      pasteController.target = textField - так не работает
    }
    
    
    private func setupTextField() {
        let pasteController = UIPasteControl()
//        let configuration = UIPasteControl.Configuration()
//        configuration.displayMode = .iconOnly
//        pasteController.configuration = configuration - так тоже нельзя поменять - это get свойство
//        pasteController.configuration.displayMode = .iconOnly  //почему-то таким образом не дает менять конфигурацию
        
        pasteController.target = textField
        
        textField.rightView = pasteController
        textField.rightViewMode = .always
  
    }
    private func setupMenu() {
        let menuItems: [UIAction] = [
            UIAction(
                title: "Copy",
                image: UIImage(systemName: "doc.on.doc"),
                handler: { _ in
                    
                }
            ),
            UIAction(
                title: "Delete",
                image: UIImage(systemName: "trash"),
                handler: { _ in
                    
                }
            ),
            UIAction(
                identifier:UIAction.Identifier.paste,
                handler: { _ in
                    let pasteboardContent = UIPasteboard.general.string
                    if let pasteboardContent {
                        self.mainTextView.text = pasteboardContent
                    }
                }
            )
        ]
        
        let demoMenu = UIMenu(children: menuItems)
        
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), menu: demoMenu)
        navigationItem.rightBarButtonItem = plusButton
    }
}


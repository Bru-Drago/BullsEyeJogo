//
//  AboutViewController.swift
//  BullsEye2
//
//  Created by Bruna Fernanda Drago on 14/04/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 //===== construindo um caminho "path"para mostrar o arquivo html====//
        if  let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
        let url = URL(fileURLWithPath:htmlPath )
        let request = URLRequest(url: url)
        webView.load(request)
        }
        
    }
    @IBOutlet weak var webView : WKWebView!
    
    @IBAction func aboutButton(){
        
    }
    @IBAction func closeButton(){
        dismiss(animated: true, completion: nil)
    }
}

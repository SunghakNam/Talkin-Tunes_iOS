//
//  ViewController.swift
//  Alpha
//
//  Created by Sunghak Nam on 8/6/16.
//  Copyright © 2016 Sunghak Nam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL (string: "http://54.83.143.33:8080/");
        let requestObj = NSURLRequest(URL: url!);
        webView.delegate=self;
        webView.loadRequest(requestObj);
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidFinishLoad(webView : UIWebView) {
        webView.translatesAutoresizingMaskIntoConstraints = true;
        var frame:CGRect = webView.frame;

        frame.size.width = UIScreen.mainScreen().bounds.width;
        frame.size.height = UIScreen.mainScreen().bounds.height;
        webView.frame = frame;
    }
}

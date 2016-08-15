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
        let url = NSURL (string: "http://shnam.com");
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
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        NSLog((request.URL?.absoluteString)!)
        if (request.URL?.absoluteString.hasPrefix(("iosfunction://")) == true){
            let Tmp = request.URL!.absoluteString.componentsSeparatedByString("iosfunction://")[1]
            native_alert(Tmp);
            return true;
        }
        return true;
    }
    func native_alert(alert: String!){
        let title = alert.componentsSeparatedByString("/")[0];
        let msg = alert.componentsSeparatedByString("/")[1].stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding);
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

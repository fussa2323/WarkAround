//
//  WebViewController.swift
//  WarkAround
//
//  Created by Yohei Fusayasu on 6/7/15.
//  Copyright (c) 2015 Tachikoma. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    //表示したいURLを設定(初期化)
    var targetURL = "http://52.69.4.29/my_graph.html"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // webviewの表示を行うメソッドを呼び出す
        loadAddressURL()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAddressURL(){
        
        // 初期化したURLを読み込む
        let requestURL = NSURL(string: targetURL)
        
        // 読み込んだURLの実行結果を取得する
        let req = NSURLRequest(URL:requestURL!)
        
        // webvieにデータをロードする
        webView.loadRequest(req)
        webView.scalesPageToFit = true
        
    }



}

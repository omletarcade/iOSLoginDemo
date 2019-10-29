import UIKit
import WebKit

class WebLoginViewController: UIViewController, WKNavigationDelegate  {
    
    let LOGIN_URL = "https://tpapi-idp-s.stage.omapi.net/login"
    let GAME_UID = "TESTPUBG"
    let GAME_NAME = "PUBG%20Mobile"
    let GAME_DEV = "Tencent%20Games"
    let GAME_ICON = "https://omlet-download.akamaized.net/blob/bG9uZ2RhbjovL09ORS9sZHByb2QtdXMvQ1VfLVBHQ3B4QmZsODBzUUFtcTBwUT09"
    
    let CALLBACK_PREFIX = "interceptme://get-omlet-token/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = WKWebView()
        self.view = webView
        webView.navigationDelegate = self
        
        let urlString = LOGIN_URL
                        + "?gameuid="  + GAME_UID
                        + "&gamename=" + GAME_NAME
                        + "&gamedev="  + GAME_DEV
                        + "&gameicon=" + GAME_ICON
                        + "&gamecb="   + CALLBACK_PREFIX
        webView.load(URLRequest(url: URL(string: urlString)!))
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            //Intercept the custom callback prefix
            if url.absoluteString.hasPrefix(CALLBACK_PREFIX) {
                let omletUserToken = url.lastPathComponent

                /* SAVE THE OMLET USER TOKEN SOMEWHERE */
                print("Omlet User Token: ", omletUserToken)

                self.navigationController?.popViewController(animated: true)
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
    
    
    
}


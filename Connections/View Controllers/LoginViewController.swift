//
//  LoginViewController.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 19/01/23.
//

import UIKit

final class LoginViewCotroller: UIViewController {
    
    // MARK: Views
    
    @IBOutlet weak var countryCode: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    
    // MARK: - ViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    
    /// Handles the click action for `continue` button
    @IBAction func continueClicked(_ sender: Any) {
        
        // If user enters the valid mobile number then calling the login API
        if let number = mobileNumber.text,
           let countryCode = countryCode.text,
           isValidMobileNumber(number) {
                        
            loginUser(with: number, countryCode: countryCode)
            
        } else {
            
            let alert = AlertControllerUtils.createAlertWithTitle(title: "Invalid Mobile Number", andMessage: "Please enter the valid mobile number", andCancelButtonTitle: "Dismiss")
            
            self.present(alert, animated: true)
            
        }
        
    }
    
}

// MARK: - API Calling
extension LoginViewCotroller {
    
    /// Performs the user login with provided mobile number
    private func loginUser(with mobileNumer: String, countryCode: String) {
        
        let mobileNumberWithCountryCode = "\(countryCode)\(mobileNumer)"

        let params = ["number": mobileNumberWithCountryCode]

        let loginUrl = "\(Constants.kBaseUrl)\(Constants.kLoginUrl)"
        
        NetworkingUtils().executePostApi(
            url: loginUrl,
            parameters: params,
            onSuccess: { data in
                
                DispatchQueue.main.async { [weak self] in
                    
                    let otpViewController = OtpViewController.instantiate()
                    
                    otpViewController.userMobileNumber = mobileNumberWithCountryCode
                    
                    self?.navigationController?.pushViewController(otpViewController, animated: true)
                }
                
            },
            onFailure: { [weak self] in
                /// Show the messagen to the user
                let alert = AlertControllerUtils.createAlertWithTitle(title: "Login Failed", andMessage: "Something went wrong please try again", andCancelButtonTitle: "Dismiss")
                
                self?.present(alert, animated: true)
            })

    }

}

// MARK: - Helpers
extension LoginViewCotroller {
    
    /// Checks is the number is valid or not
    private func isValidMobileNumber(_ mobile: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: mobile)
    }

}

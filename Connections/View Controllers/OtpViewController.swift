//
//  OtpViewController.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 20/01/23.
//

import UIKit

final class OtpViewController: UIViewController {
    
    // MARK: Public Properties
    
    var userMobileNumber: String?
    
    // MARK: Views
    
    @IBOutlet weak var labelUserMobileNumber: UILabel!
    @IBOutlet weak var otpTextField: UITextField!
    @IBOutlet weak var countDownTimer: UILabel!
    
    /// Timer properties for OTP timer
    private var timer: Timer?
    private var secondsRemaining = 60
    
    // MARK: - ViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - UI Setup
    
    /// Sets up the views
    private func setupViews() {
        
        // Disabling the back button
        navigationItem.setHidesBackButton(true, animated: false)
        
        // Setting user name
        labelUserMobileNumber.text = userMobileNumber
        
        // Configuring otp rest timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                self.secondsRemaining -= 1
                self.countDownTimer.text = "00:\(self.secondsRemaining)"
            } else {
                
                Timer.invalidate()
                
                let alert = AlertControllerUtils.createSingleActionAlertWith(title: "Time Out",
                                                                             message: "Please try again",
                                                                             button: UIAlertAction(title: "Dismiss",
                                                                                                   style: .cancel,
                                                                                                   handler: { _ in
                    // Navigating back to login screen
                    self.navigationController?.popViewController(animated: true)
                }))
                
                self.present(alert, animated: true)
                
                
            }
            
        }
        
    }
    
    /// Handles the click for continue button
    @IBAction func continueBtnClicked(_ sender: Any) {
        
        // Checking if user entered the valid OTP or not
        if let otp = otpTextField.text,
           otp.count >= 4 {
            
            validateOtp(with: otp)
        } else {
            
            let alert = AlertControllerUtils.createAlertWithTitle(title: "Invalid OTP", andMessage: "Please enter the valid OTP", andCancelButtonTitle: "Dismiss")
            
            self.present(alert, animated: true)
        }
       
    }

}


// MARK: - API
extension OtpViewController {
    
    /// Validates the OTP
    private func validateOtp(with otp: String) {
        
        let params = ["number":userMobileNumber!, "otp": otp]
        
        let loginUrl = "\(Constants.kBaseUrl)\(Constants.kVerifyOtpUrl)"
        
        NetworkingUtils().executePostApi(
            url: loginUrl,
            parameters: params,
            onSuccess: { data in
                
                // Checking if we got the `auth-token` or not
                if data["token"] == nil {
                    self.showErrorAlert()
                    return
                }

                DispatchQueue.main.async { [weak self] in
                    
                    let homeViewController = HomeViewController.instantiate()
                                        
                    homeViewController.inputData = data
                    
                    self?.navigationController?.pushViewController(homeViewController, animated: true)
                    
                    self?.timer?.invalidate()
                }

            },
            onFailure: { [weak self] in
                
                self?.showErrorAlert()
            })

    }
    
}

// MARK: - Helpers
extension OtpViewController {
    
    /// Shows the error alert to user
    private func showErrorAlert() {
        let alert = AlertControllerUtils.createAlertWithTitle(title: "Login Failed", andMessage: "Something went wrong please try again", andCancelButtonTitle: "Dismiss")
        
        present(alert, animated: true)
        
        timer?.invalidate()
    }
    
}

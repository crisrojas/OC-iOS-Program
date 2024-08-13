//
//  ExchangeViewController.swift
//  Baluchon
//
//  Created by Cristian Rojas on 19/11/2020.
//

import UIKit

class ExchangeViewController: UIViewController, ExchangeRepositoryOutput, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var rateContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var rate: Float = 0.0 {
        didSet {
            self.rateLabel.text = S.formatedRate(rate)
        }
    }
    

    lazy var repository: ExchangeRepositoryInput = {
        let repo = ExchangeRepository(api: Api.fixer)
        repo.output = self
        return repo
    }()
    
    enum Operations {
        case multiply
        case divide
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObservers()
        setupKeyboardHandler()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       removeObservers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchExchange()
        
        //@todo:
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingChanged)
    }
    
    private func fetchExchange() {
        guard let exchangeRate = UserDefaults.standard.value(forKey: .exchangeRate) as? Float else {
            repository.fetchExchange()
            return
        }
        rate = exchangeRate
        refetchIfNeeded()
    }
    
    @objc
    private func refetchIfNeeded() {
        
        guard let lastFetchingDate = UserDefaults.standard.value(forKey: .fetchingDate) as? Date else {
            didUpdate(state: .error(S.errorDate))
            return
        }
        
        let currentDate = Date()
        
        if currentDate.moreThanADay(from: lastFetchingDate) {
            UserDefaults.standard.setValue(currentDate, forKey: .fetchingDate)
            repository.fetchExchange()
        }
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: .keyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(refetchIfNeeded),
            name: .willEnterForeground, object: nil)
    }
    
    private func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: .keyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .willEnterForeground, object: nil)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let safeFieldText = textField.text else { return }
        if safeFieldText.isEmpty {
            resultLabel.text = "0"
        } else {
        convertCurrency()
        }
    }
}

// MARK: - Setup UI
private extension ExchangeViewController {
    
    func setupUI() {

        activityIndicator.hidesWhenStopped = true
        
        rateContainer.layer.borderColor = UIColor.lightGrey.cgColor
        rateContainer.layer.borderWidth = 3.0
        rateContainer.layer.cornerRadius = rateContainer.frame.height / 2
    }
    
    func setupKeyboardHandler() {
        
        textField.becomeFirstResponder()
        escapeKeyboard()
    }
    
    func convertCurrency() {
        
        guard
            let stringNumber = textField.text,
            let numberToConvert: Float = Float(stringNumber)
        else { return }
        
        guard !stringNumber.isEmpty else {
            self.resultLabel.text = "0"
            return
        }
        
        guard let rate = UserDefaults.standard.value(forKey: .exchangeRate) as? Float  else {
            didUpdate(state: .error("Error casting exchange rate"))
            return
        }
        
        let result = numberToConvert * rate
        self.resultLabel.text = "\(result)"
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = keyboardSize.cgRectValue
        if bottomConstraint.constant == 0 {
            bottomConstraint.constant -= keyboardFrame.height
        }
    }
}

//
//  TranslationViewController.swift
//  Baluchon
//
//  Created by Cristian Rojas on 19/11/2020.
//

import UIKit

class TranslationViewController: UIViewController, TranslationRepositoryOutput {
    
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var componentContainer: UIView!
    @IBOutlet weak var textToTranslateContainer: UIView!
    @IBOutlet weak var translationContainer: UIView!
    
    @IBOutlet weak var inputLangImage: UIImageView!
    @IBOutlet weak var outputLangImage: UIImageView!
    
//    @IBOutlet weak var inputLangLabel: UILabel!
    @IBOutlet weak var outputLangLabel: UILabel!
    @IBOutlet weak var translationButton: DefaultButton!
    
    lazy var repository: TranslationRepositoryInput = {
        let repo = TranslationRepository(api: Api.googleTranslate)
        repo.output = self
        return repo
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func translationButtonPressed(_ sender: Any) {
        repository.fetchTranslation(query: inputTextView.text)
        inputTextView.resignFirstResponder()
    }
}

// MARK: - Setup UI
private extension TranslationViewController {
    func setupUI() {
        let cornerRadius: CGFloat = 10
        
        inputTextView.text = S.translateInputPlaceholder
        outputTextView.text = S.translateOutputPlaceholder
        
//        inputLangLabel.text = S.french
        outputLangLabel.text = S.english
        
        outputTextView.textColor = UIColor.lightGray
        inputTextView.textColor = UIColor.lightGray
        
        outputTextView.delegate = self
        inputTextView.delegate = self
        
        textToTranslateContainer.layer.cornerRadius = cornerRadius
        textToTranslateContainer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        translationContainer.layer.cornerRadius = cornerRadius
        translationContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        componentContainer.layer.cornerRadius = cornerRadius
        
        componentContainer.layer.shadowColor = UIColor.black.cgColor
        componentContainer.layer.shadowOpacity = 0.1
        componentContainer.layer.shadowOffset = CGSize(width: 1, height: 2)
        componentContainer.layer.shadowRadius = 3
        
        inputLangImage.layer.cornerRadius = inputLangImage.frame.height / 2
        outputLangImage.layer.cornerRadius = outputLangImage.frame.height / 2
        
        escapeKeyboard()
    }
}

// MARK: - TextView Delegate methods
extension TranslationViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
}

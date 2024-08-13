//
//  TranslationDidUpdate.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import UIKit

extension TranslationViewController {
    func didUpdate(state: TranslationViewState) {
        DispatchQueue.main.async { [weak self] in
            self?.translationButton.isLoading = state.isLoading
        }
        switch state {
        case .success(let data):
            DispatchQueue.main.async { [weak self] in
                self?.outputTextView.text = data.translatedText
                if let flag = UIImage(named: data.detectedSourceLanguage) {
                    self?.inputLangImage.image = flag
                } else {
                    self?.inputLangImage.image = UIImage(named: "unknown")
                }
            }
        case .error(let error):
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.showErrorAlert(message: S.errorTranslation) {
                    self.repository.fetchTranslation(query: self.inputTextView.text)
                }
            }
            #if DEBUG
            print(error)
            #endif
        default: break
        }
    }
}

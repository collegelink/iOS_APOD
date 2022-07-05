//
//  DatePickerViewController.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 4/6/22.
//

import UIKit

class DatePickerViewController: BaseViewController {
    
    static var nibName: String { String(describing: self) }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstTextfieldLabel: UILabel!
    @IBOutlet weak var firstTextfield: UITextField!
    @IBOutlet weak var secondTextfieldLabel: UILabel!
    @IBOutlet weak var secondTextfield: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var presenter: DatePickerPresentable
    private let datePicker = UIDatePicker()
    
    init(presenter: DatePickerPresentable) {
        self.presenter = presenter
        super.init(nibName: Self.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad(view: self)
        enableTargetsIfNeeded()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        presenter.submitButtonTapped()
    }
}

// MARK: - Private

private extension DatePickerViewController {
    
    
    
    func setupUI() {
        self.title = presenter.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        titleLabel.setFont(font: .bold(16.0), color: .black)
        firstTextfieldLabel.setFont(font: .regular(14.0), color: .gray)
        secondTextfieldLabel.setFont(font: .regular(14.0), color: .gray)
        titleLabel.text = NSLocalizedString("date_picker_title", comment: "")
        firstTextfieldLabel.text = NSLocalizedString("date_picker_first_textfield_title", comment: "")
        secondTextfieldLabel.text = NSLocalizedString("date_picker_second_textfield_title", comment: "")
        
        firstTextfield.placeholder = NSLocalizedString("date_picker_first_textfield_placeholder", comment: "")
        secondTextfield.placeholder = NSLocalizedString("date_picker_second_textfield_placeholder", comment: "")
        
        submitButton.setTitle(NSLocalizedString("date_picker_button_title", comment: ""), for: .normal)
        submitButton.setTitleColor(Color.Text.white.color, for: .normal)
        submitButton.roundCorners(radius: 4.0)
        submitButton.backgroundColor = Color.Background.petrol.color
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        firstTextfield.inputView = datePicker
        secondTextfield.inputView = datePicker
        let toolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 44.0))
        let cancelBarButton = UIBarButtonItem(title: NSLocalizedString("cancel", comment: ""), style: .plain, target: self, action: #selector(cancelPressed))
        let doneBarButton = UIBarButtonItem(title: NSLocalizedString("done", comment: ""), style: .plain, target: self, action: #selector(donePressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
        firstTextfield.inputAccessoryView = toolbar
        secondTextfield.inputAccessoryView = toolbar
    }
    
    @objc
    func cancelPressed() {
        self.view.endEditing(true)
    }
    
    @objc
    func donePressed() {
        let date = datePicker.date
        if firstTextfield.isEditing {
            presenter.startDate = date
            firstTextfield.text = date.toDMonthYYYY
            datePicker.minimumDate = date
            enableTargetsIfNeeded()
            secondTextfield.becomeFirstResponder()
        } else {
            presenter.endDate = date
            secondTextfield.text = date.toDMonthYYYY
            self.view.endEditing(true)
            enableTargetsIfNeeded()
        }
    }
    
    func enableTargetsIfNeeded() {
        submitButton.setEnabled(firstTextfield.text?.isEmpty == false && secondTextfield.text?.isEmpty == false)
        secondTextfield.setEnabled(firstTextfield.text?.isEmpty == false)
        secondTextfieldLabel.setEnabled(firstTextfield.text?.isEmpty == false)
    }
}

extension DatePickerViewController: DatePickerView {
    func changeScrollViewInset(inset: UIEdgeInsets) {
        scrollView.contentInset = inset
    }
    
    func push(controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func showLoadingState(_ loading: Bool) {
        showLoading(loading)
    }
    
    func showError(_ error: Error) {
        presentError(error)
    }
}

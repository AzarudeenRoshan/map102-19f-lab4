
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var labelCelsius: UILabel!
    @IBOutlet var textFieldfahrenheitCelsius: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard));
        self.view.addGestureRecognizer(tap);
        textFieldfahrenheitCelsius.delegate = self
        
// Task 2 , 3 and 4
//        let first_frame = CGRect(x: 100, y: 100, width: 200, height: 200);
//        let first_view = UIView(frame: first_frame);
//        first_view.backgroundColor = UIColor.blue;
//
//        let second_frame = CGRect(x: 10,y:10,width: 100,height: 100);
//        let second_view = UIView(frame: second_frame);
//        second_view.backgroundColor = UIColor.green;
//        first_view.addSubview(second_view);
//        self.view.addSubview(first_view);
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let text: NSString = textField.text! as NSString
        let resultString = text.replacingCharacters(in: range, with: string)

        if textField == textField {
            let textArray = resultString.components(separatedBy: ".")
            
            if textArray.count == 2 {
                let lastString = textArray.last
                if lastString!.count > 1 { //Check number of decimal places
                    return false
                }
            }
            else if textArray.count > 2 {  //Allow only one "."
                return false
            }
            
        }
        return true
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true) //Hide Keyboard
    }
    
    @IBAction func onFahrenheitValueChanged(_ sender: UITextField)
    {
        if let celsiusString=sender.text
        {
            let enteredValue : Float? = Float(celsiusString);
            if(enteredValue != nil)
            {
                let convertedValue=(enteredValue! - 32) * 5/9;
                print(convertedValue);
                labelCelsius.text = String(format:"%.1f", convertedValue);
            }
            else{
                labelCelsius.text="0";
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




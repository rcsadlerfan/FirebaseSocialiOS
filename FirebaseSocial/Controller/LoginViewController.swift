import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: CustomUITextField!
    @IBOutlet weak var txtPassword: CustomUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text{
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, err) in
                if err == nil{
                    print("FIRE: Signed in with email")
                } else {
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, err) in
                        if err != nil{
                            print("FIRE: Unable to auth with email")
                        } else {
                            print("FIRE: User created with email")
                        }
                    })
                }
            })
        } else {
            print("FIRE: Please enter an email and password.")
        }
    }
    
}


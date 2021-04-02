//
//  CloverChargeSwiftUIView.swift
//  CloverREST
//
//  Created by Eric Rowe on 1/5/21.
//
//  Clover.ChargeView.SwiftUIView is a SwiftUI View that provides secure credit card entry and tokenization.
//  The view wraps a Clover.ChargeView.UIKitView which contains the Clover iFrame components necessary
//  for tokenization.
//
//  On initialization, pass in closures to onTokenResults to receive
//  status and tokenization results from the iFrame components.  Submit the card for
//  tokenization by setting the submit Binding after verifying that the isValid binding is true.
//  The isValid binding will be set to true once local validation of the entered data is passed.  This
//  does not guarantee a valid tokenization, and error results returned from onTokenResults must still be monitored.

import SwiftUI

extension Clover.ChargeView {
    

    public struct SwiftUIView: View {
        // isValid reflects the validation state of the field values.
        @Binding var isValid:Bool
        // Will be called when the token response is returned from the Clover servers.
        public let onTokenResults: (_ results:Clover.ChargeView.TokenizeResults) -> ()
        // Setting to true submits the contents of the iFrame for tokenization to Clover's servers.
        @Binding var submit:Bool

        /**
          Creates a secure view for accepting Credit Card information, and then tokenizing that information.  Uses a hosted iFrame for security.
          
            - **Parameters**
              - **isValid**: @Binding reflecting the current status of the validation of data entered in the iFrame.  Will be set to true by the iFrame support code when the data is valid.
              - **submit**: @Binding used to trigger the submission of the Credit Card Data to the Clover servers for tokenization.  Set to True to trigger the submission for tokenization.
              - **onTokenResults**: Callback *(Clover.TokenizeResults) -> ()* that will be called when the token response is returned from the Clover servers.
          */
        public init(
            submit:Binding<Bool>,
            onTokenResults: @escaping (_ results:Clover.ChargeView.TokenizeResults) -> (),
            isValid:Binding<Bool>) {
            self._submit = submit
            self.onTokenResults = onTokenResults
            self._isValid = isValid
        }

        public var body: some View {
            CloverChargeViewWrapper(isValid: $isValid, onTokenResults: onTokenResults, submit: $submit)
        }
    }

    
    // MARK: -


    // Wraps the Clover.ChargeView.ViewControllerWrapper in a UIViewControllerRepresentable, providing SwiftUI mapping of makeUIViewController and updateUIViewController
    internal struct CloverChargeViewWrapper: UIViewControllerRepresentable {
        @Binding internal var isValid:Bool
        internal let onTokenResults: (_ results:Clover.ChargeView.TokenizeResults) -> ()
        @Binding internal var submit:Bool
        
        // creates the view controller wrapper that will host the iFrame
        func makeUIViewController(context: UIViewControllerRepresentableContext<CloverChargeViewWrapper>) -> ViewControllerWrapper {
            let view = ViewControllerWrapper(
                isValid: $isValid,
                onTokenResults: onTokenResults,
                divHeight: context.environment.horizontalSizeClass == UserInterfaceSizeClass.compact ? 28 : 50) // TODO remove this and replace with dynamic sizing in the HTML
            return view
        }

        // Called by SwiftUI when the display needs to be redrawn.  Here will monitor the @submit binding and trigger a submit call when it is set to true
        func updateUIViewController(_ uiViewController: ViewControllerWrapper, context: UIViewControllerRepresentableContext<CloverChargeViewWrapper>) {
            if (submit) {
                uiViewController.submit()
            }
        }
    }


    // Wraps the Clover.ChargeView.UIKitView in a View Controller and provides layout support for the UIKitView when embedded in a SwiftUI View
    // Do not embed this ViewControllerWrapper in a Storyboard for UIKit
    // This class is intended for use in embedding in a SwiftUIView only
    // To use in a UIKit implementation, embed the Clover.ChargeView.UIKitView directly in your view controller
    // See the UIKit example for how to implement in a UIKit app
    internal class ViewControllerWrapper: UIViewController {
        @Binding internal var isValid:Bool
        internal let onTokenResults: (_ results:Clover.ChargeView.TokenizeResults) -> ()
        // internal reference to the UIKitView, which allows us to trigger the submission directly
        internal var webView:Clover.ChargeView.UIKitView? = nil
        internal let divHeight:CGFloat

        init(isValid:Binding<Bool>, onTokenResults: @escaping (_ results:Clover.ChargeView.TokenizeResults) -> (), divHeight:CGFloat? = nil) {
            self._isValid = isValid
            self.onTokenResults = onTokenResults
            self.divHeight = divHeight ?? 28
            super.init(nibName: nil, bundle: nil)
        }
        
        // Do not embed this ViewControllerWrapper in a Storyboard for UIKit
        // This class is intended for use in embedding in a SwiftUIView only
        // To use in a UIKit implementation, embed the Clover.ChargeView.UIKitView directly in your view controller
        // See the UIKit example for how to implement in a UIKit app
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // Passes the updated frame information to the downstream objects
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            webView?.frame = self.view.frame
            webView?.webView?.frame = self.view.frame
        }

        // Loads the view and sets up the div information
        // Note that due to when things are laid out with the static divHeight in the HTML, we must set the divHeight here... which will happen before we lay everything out properly, so some guess work is required.
        // TODO: fix this with some dynamic heights in the HTML.
        override func viewDidLoad() {
            super.viewDidLoad()
            webView = Clover.ChargeView.UIKitView(frame:CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height),
                                                  divHeight: divHeight,
                                                  onTouchResults: { results in
                                                    DispatchQueue.main.async {
                                                        self.isValid = results.isValid
                                                    }
                                                  },
                                                  onTokenResults: { results in
                                                    DispatchQueue.main.async {
                                                        self.onTokenResults(results)
                                                    }
                                                })
            if let webView = webView {
                self.view.addSubview(webView)
            }
            
        }
        
        func submit() {
            webView?.submit()
        }
    
    }
}


            
            const clover = new Clover('<PAKMS TOKEN>');
            const elements = clover.elements();
            const styles = {
                body: {
                    fontFamily: 'Roboto, Open Sans, sans-serif',
                    fontSize: '16px',
                },
                input: {
                    fontSize: '16px',
                    padding: '0px',
                    margin: '0px'
                },
            };
            const cardNumber = elements.create('CARD_NUMBER', styles);
            const cardDate = elements.create('CARD_DATE', styles);
            const cardCvv = elements.create('CARD_CVV', styles);
            const cardPostalCode = elements.create('CARD_POSTAL_CODE', styles);
            
            cardNumber.mount('#card-number');
            cardDate.mount('#card-date');
            cardCvv.mount('#card-cvv');
            cardPostalCode.mount('#card-postal-code');
            
            const cardResponse = document.getElementById('card-response');
            
            const displayCardNumberError = document.getElementById('card-number-errors');
            const displayCardDateError = document.getElementById('card-date-errors');
            const displayCardCvvError = document.getElementById('card-cvv-errors');
            const displayCardPostalCodeError = document.getElementById('card-postal-code-errors');
            
            // Handle real-time validation errors from the card Element.
            cardNumber.addEventListener('change', function(event) {
                window.webkit.messageHandlers.<DELEGATE_NAME>.postMessage({"touch":event});

            });
        
            cardNumber.addEventListener('blur', function(event) {
                window.webkit.messageHandlers.<DELEGATE_NAME>.postMessage({"touch":event});

            });
            
            cardDate.addEventListener('change', function(event) {
                window.webkit.messageHandlers.<DELEGATE_NAME>.postMessage({"touch":event});

            });
            
            cardDate.addEventListener('blur', function(event) {
                window.webkit.messageHandlers.<DELEGATE_NAME>.postMessage({"touch":event});

            });
            
            cardCvv.addEventListener('change', function(event) {
                window.webkit.messageHandlers.<DELEGATE_NAME>.postMessage({"touch":event});

            });
            
            cardCvv.addEventListener('blur', function(event) {
                window.webkit.messageHandlers.<DELEGATE_NAME>.postMessage({"touch":event});
            });
            
            cardPostalCode.addEventListener('change', function(event) {
                window.webkit.messageHandlers.<DELEGATE_NAME>.postMessage({"touch":event});
            });
            
            cardPostalCode.addEventListener('blur', function(event) {
                window.webkit.messageHandlers.<DELEGATE_NAME>.postMessage({"touch":event});
            });
            
            const form = document.getElementById('payment-form');


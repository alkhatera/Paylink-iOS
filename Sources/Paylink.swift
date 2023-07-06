import PLPaymentGateway

public class PaylinkIOS {
    private let gateway: PaylinkGateway
    
    public init(apiId: String, secretKey: String, environment: PLPaymentEnvironment) {
        gateway = PaylinkGateway(apiId: apiId, secretKey: secretKey, environment: environment)
    }

    public func authenticate(completion: @escaping (Result<String, Error>) -> Void) {
        gateway.auth { result in
            switch result {
            case .success(let idToken):
                completion(.success(idToken))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func createInvoice(idToken: String,
                              customerName: String,
                              customerMobile: String,
                              amount: Double,
                              currency: String,
                              note: String,
                              orderNumber: String,
                              products: [PLProduct],
                              completion: @escaping (Result<String, Error>) -> Void) {
        gateway.addInvoice(idToken: idToken,
                           customerName: customerName,
                           customerMobile: customerMobile,
                           amount: amount,
                           currency: currency,
                           note: note,
                           orderNumber: orderNumber,
                           products: products) { result in
            switch result {
            case .success(let paymentUrl):
                completion(.success(paymentUrl))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func openInvoiceURL(paymentUrl: URL,
                               from parentViewController: UIViewController,
                               clientName: String,
                               clientMobile: String,
                               successHandler: @escaping (String, String) -> Void,
                               failureHandler: @escaping () -> Void,
                               loadedHandler: @escaping () -> Void) {
        gateway.openInvoiceURL(url: paymentUrl,
                               from: parentViewController,
                               clientName: clientName,
                               clientMobile: clientMobile,
                               success: { orderNumber, transactionNo in
                                   successHandler(orderNumber, transactionNo)
                               },
                               failure: {
                                   failureHandler()
                               },
                               loaded: {
                                   loadedHandler()
                               })
    }

    public func getInvoiceURLView(paymentUrl: URL,
                                  clientName: String,
                                  clientMobile: String,
                                  bgColor: String,
                                  textColor: String,
                                  buttonTextColor: String,
                                  mainColor: String,
                                  completion: @escaping (String, String) -> Void) {
        gateway.getInvoiceURLView(url: paymentUrl,
                                  clientName: clientName,
                                  clientMobile: clientMobile,
                                  bgColor: bgColor,
                                  textColor: textColor,
                                  buttonTextColor: buttonTextColor,
                                  mainColor: mainColor,
                                  success: { orderNumber, transactionNo in
                                      completion(orderNumber, transactionNo)
                                  })
    }
}
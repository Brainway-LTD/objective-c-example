import Foundation
import IdxDmpSdk

let providerId: String = "bc8a7a32-7d98-4226-8af9-d2a43a8621cc"

@objc class DataManagerProviderBridge: NSObject {
    var dmp: DataManagerProvider?

    @objc func initIdx(with data: [String: Any]) {
        print("Init IDX")
        print(providerId)

        self.dmp = DataManagerProvider(providerId: providerId) {
            print("idx sdk started")

            let requestProps = EventRequestPropertiesStruct(
                url: data["url"] as? String ?? "null",
                title: data["title"] as? String ?? "null",
                domain: "https://walla.co.il",
                author: data["author"] as? String ?? "null",
                category: data["category"] as? String ?? "null",
                description: data["description"] as? String ?? "null",
                tags: []
            )

            self.dmp?.sendEvent(properties: requestProps) {
                debugPrint("""
                    Success PAGE VIEW with params:
                    URL: \(requestProps.url)
                    Title: \(requestProps.title)
                    Domain: \(requestProps.domain)
                    Author: \(requestProps.author)
                    Category: \(requestProps.category)
                    Desc: \(requestProps.description)
                    Tags: \(requestProps.tags)
                    UserId: \(String(describing: self.dmp?.getUserId()))
                    Timestamp: \(String(describing: self.dmp?.getTimestamp()))
                    OS Version: \(UIDevice.current.systemVersion)
                    Device Id: \(String(describing: UIDevice.current.identifierForVendor))
                    Model: \(UIDevice.current.model)
                """)
            }
        }
    }
    
    @objc func resume() {
        
    }
    
    @objc func stop() {
        
    }
}

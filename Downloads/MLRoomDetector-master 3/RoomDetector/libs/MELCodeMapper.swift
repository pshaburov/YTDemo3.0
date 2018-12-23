import Foundation
//import CSV

// MELCode reader maps backend values of mel codes on library codes
class MELCodeMapper {
    
    let mappingFileName = "MELCodesMapping"
    let codesMapping: CSV!
    
    // Backend lib mel code to backend mel code mapping
    var codesDict : [Int : MELCode] = [:]
    
    init() {
        if let filepath = Bundle.main.path(forResource: "MELCodesMapping", ofType: "csv") {
            do {
                let csvString = try String(contentsOfFile: filepath)
                codesMapping = try CSVReader(string: csvString,
                                             hasHeaderRow: true)
                
                while let row = codesMapping.next() {
                    let backendCode = Int(row[0])!
                    let libCode = Int(row[1])!
                    codesDict[libCode] = backendCode
                }
                
            } catch {
                fatalError("Cannot read mel codes file")
            }
        } else {
            fatalError("MEL Codes file not found")
        }
    }
    
    func map(libMelCode : Int) -> MELCode? {
        return codesDict[libMelCode]
    }

}

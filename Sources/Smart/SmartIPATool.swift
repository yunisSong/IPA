import Foundation
import PathKit
import Rainbow
public struct SmartIPATool {
    
    let shellFile: String
    let ipaShellName : String
    let updateDescription : String
    let updateName : String
    
    public init (shellFile:String,ipaShellName:String,updateDescription:String,updateName:String) {
        self.shellFile = shellFile
        self.ipaShellName = ipaShellName.uppercased()
        self.updateDescription = updateDescription
        self.updateName = updateName
    }
    public func creatIPA()
    {
        if self.ipaShellName == "YNJ"
        {
            let updateDescription = "优你家 （\(self.updateName))"+"\\\\n下载地址：https://www.pgyer.com/v0H1\\\\n更新：\\\\n"+self.updateDescription
            
            print("\(updateDescription)")
            //打包优你家
            //1 修改脚本中 上传信息
            let temp = "sed -i '' 's#updateDescription=\".*\"#updateDescription=\""+"\(updateDescription)\""+"#g' /Users/Yunis/Documents/临时放置/ZDDB/优你家.py"
            print("------- \(temp)  --------")
            
            let t = self.runShellCommand(command: temp)
            print("------- \(t ?? "rrrrrr"))  --------")
            
            //2 执行打包脚本
            let creatIPA = "python /Users/Yunis/Documents/临时放置/ZDDB/优你家.py"
            print("------- \(creatIPA)  --------")
            let t1 = self.runShellCommand(command: creatIPA)
            print("------- \(t1 ?? "rrrrrr"))  --------")
            
            
        }else if self.ipaShellName == "YNGJ"
        {
            //1 修改脚本中 上传信息
            let updateDescription = "优你管家 （\(self.updateName))"+"\\\\n下载地址：https://www.pgyer.com/YUc4\\\\n更新：\\\\n"+self.updateDescription
            let temp = "sed -i '' 's#updateDescription=\".*\"#updateDescription=\""+"\(updateDescription)\""+"#g' /Users/Yunis/Documents/临时放置/ZDDB/优你管家.py"
            print("------- \(temp)  --------")
            
            let t = self.runShellCommand(command: temp)
            print("------- \(t ?? "eeeee"))  --------")
            
            //2 执行打包脚本
            let creatIPA = "python /Users/Yunis/Documents/临时放置/ZDDB/优你管家.py"
            print("------- \(creatIPA)  --------")
            
            let t1 = self.runShellCommand(command: creatIPA)
            print("------- \(t1 ?? "rrrrrr"))  --------")
            
        }
    }
    //运行shell
    public func runShellCommand(command: String) -> String? {
        let pipe = Pipe()
        let task = Process()
        task.launchPath = "/bin/sh"
        task.arguments = ["-c", String(format: "%@", command)]
        task.standardOutput = pipe
        let file = pipe.fileHandleForReading
        task.launch()
        guard let result = NSString(data: file.readDataToEndOfFile(), encoding: String.Encoding.utf8.rawValue)?.trimmingCharacters(in: NSCharacterSet.newlines) else {
            return nil
        }
        return result as String
    }
    
    
}

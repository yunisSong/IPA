import Foundation
import CommandLineKit
import Rainbow
import Smart
/*
 
 1,修改脚本里面的提示语
 
 2，打包
 
 3，区分使用哪个脚本
 
 */
let cli = CommandLineKit.CommandLine()


let file = StringOption(shortFlag: "f", longFlag: "file",
                        helpMessage: "脚本路径")


let updateName = StringOption(shortFlag: "n", longFlag: "name",
                              helpMessage: "提交到蒲公英的名称信息")
let updateDescription = StringOption(shortFlag: "d", longFlag: "description",
                                     helpMessage: "提交到蒲公英的信息")

let ipaType = StringOption(shortFlag: "t", longFlag: "type",
                           helpMessage: "选择打包脚本")

let help = BoolOption(shortFlag: "h", longFlag: "help",
                      helpMessage: "这是一个提高打包效率的工具 ")

cli.addOptions(help,file,updateName, updateDescription, ipaType)

cli.formatOutput = { s, type in
    var str: String
    switch(type) {
    case .error:
        str = s.lightRed.bold
    case .optionFlag:
        str = s.green.underline
    case .optionHelp:
        str = s.lightBlue
    default:
        str = s
    }
    
    return cli.defaultFormat(s: str, type: type)
}


do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

let ipaName = updateName.value ?? "测试版"
let blogPostPath = file.value ?? ""
let ipaTypeStr = ipaType.value ?? ""
let updateDescriptionStr = updateDescription.value ?? ""

var ipaHelp = SmartIPATool.init(shellFile: blogPostPath, ipaShellName: ipaTypeStr, updateDescription: updateDescriptionStr,updateName:ipaName);
ipaHelp.creatIPA()





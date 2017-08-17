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
let file = BoolOption(shortFlag: "f", longFlag: "file",
                      helpMessage: "脚本路径")

let help = BoolOption(shortFlag: "h", longFlag: "help",
                      helpMessage: "这是一个提高打包效率的工具 ")

let updateDescription = StringOption(shortFlag: "d", longFlag: "description",
                              helpMessage: "提交到蒲公英的信息")

let ipaType = StringOption(shortFlag: "t", longFlag: "type",
                                     helpMessage: "选择打包脚本")


cli.addOptions(help, updateDescription, ipaType)

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

let blogPostPath = updateDescription.value ?? ""
let ipaTypeStr = ipaType.value ?? ""
let updateDescriptionStr = updateDescription.value ?? ""

var ipaHelp = SmartIPATool.init(shellFile: blogPostPath, ipaShellName: ipaTypeStr, updateDescription: updateDescriptionStr);
ipaHelp.creatIPA()





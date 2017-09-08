# IPA
调用打包脚本的工具

1. $ git clone https://github.com/yunisSong/IPA.git
2. $ swift package generate-xcodeproj
3. $ swift build
4. $ swift build -c release
5. $ cp ./.build/release/IPA /usr/local/bin/IPA


使用：

`IPA -d "1,测试自动化打包\\\n2，稍后删除，如果看到，请忽略，谢谢配合..." -t "YNGJ"`

`IPA -d "1,测试自动化打包\\\n2，稍后删除，如果看到，请忽略，谢谢配合..." -t "YNGJ" -n "不要下载版"`

参数说明：

* -d 上传到蒲公英的说明文字。
* -t 选择哪个打包脚本
* -n 打包后缀名称


打包脚本 参照：[自动化的一些实践](https://yunissong.github.io/2017/07/13/%E8%87%AA%E5%8A%A8%E5%8C%96%E7%9A%84%E4%B8%80%E4%BA%9B%E5%AE%9E%E8%B7%B5/)



# Git 设置日志显示格式

source: https://coolshell.cn/articles/7755.html and https://garmoncheg.blogspot.com/2012/06/pretty-git-log.html


```bash
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
```


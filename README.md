# GetGitInfo

###app 内部获取git信息：
思路，通过script脚本获取到想到的信息然后存入info.plist中，然后需要的时候再从info.plist中取出。


### 1. 在xcode的build phase中加入script：

```
#最后一次提交的SHA
git_version=$(git log -1 --format="%h")

#当前的分支
git_branch=$(git symbolic-ref --short -q HEAD)

#最后一次提交的作者
git_last_commit_user=$(git log -1 --pretty=format:'%an')

#最后一次提交的时间
git_last_commit_date=$(git log -1 --format='%cd')

#编译时间
build_time=$(date)

info_plist="${BUILT_PRODUCTS_DIR}/${EXECUTABLE_FOLDER_PATH}/Info.plist"
/usr/libexec/PlistBuddy -c "Set :'GitCommitSHA'       '${git_version}'"                "${info_plist}"
/usr/libexec/PlistBuddy -c "Set :'GitCommitBranch'    '${git_branch}'"                 "${info_plist}"
/usr/libexec/PlistBuddy -c "Set :'GitCommitUser'      '${git_last_commit_user}'"       "${info_plist}"
/usr/libexec/PlistBuddy -c "Set :'GitCommitDate'      '${git_last_commit_date}'"       "${info_plist}"
/usr/libexec/PlistBuddy -c "Set :'BuildTime'          '${build_time}'"                 "${info_plist}"

```

### 2. 在info.plist中加入对象的键值对：

```
	<key>GitCommitSHA</key>
    <string></string>
    <key>GitCommitBranch</key>
    <string></string>
    <key>GitCommitUser</key>
    <string></string>
    <key>GitCommitDate</key>
    <string></string>
    <key>BuildTime</key>
    <string></string>

```

### 3. 带代码获取并使用：

```

NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    
    _commitLabel.text = [NSString stringWithFormat:@"最后提交SHA：%@", [infoDic objectForKey:@"GitCommitSHA"]];
    
    _branchLabel.text = [NSString stringWithFormat:@"当前所在分支：%@", [infoDic objectForKey:@"GitCommitBranch"]];
    
    _authorLabel.text = [NSString stringWithFormat:@"最后提交用户：%@", [infoDic objectForKey:@"GitCommitUser"]];
    
    _dateLabel.text = [NSString stringWithFormat:@"最后提交时间：%@", [infoDic objectForKey:@"GitCommitDate"]];
    
    _buildTimeLabel.text = [NSString stringWithFormat:@"本次编译时间：%@", [infoDic objectForKey:@"BuildTime"]];

```

![展示图片](http://noti.qiniudn.com/37327abe09b91274ba8e9508c5ffec4f.png)



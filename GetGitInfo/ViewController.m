//
//  ViewController.m
//  GetGitInfo
//
//  Created by wentian on 17/6/24.
//  Copyright © 2017年 wentian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *commitLabel;
@property (nonatomic, strong) UILabel *branchLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *buildTimeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.commitLabel];
    [self.view addSubview:self.branchLabel];
    [self.view addSubview:self.authorLabel];
    [self.view addSubview:self.dateLabel];
    [self.view addSubview:self.buildTimeLabel];
    
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    
    _commitLabel.text = [NSString stringWithFormat:@"最后提交SHA：%@", [infoDic objectForKey:@"GitCommitSHA"]];
    
    _branchLabel.text = [NSString stringWithFormat:@"当前所在分支：%@", [infoDic objectForKey:@"GitCommitBranch"]];
    
    _authorLabel.text = [NSString stringWithFormat:@"最后提交用户：%@", [infoDic objectForKey:@"GitCommitUser"]];
    
    _dateLabel.text = [NSString stringWithFormat:@"最后提交时间：%@", [infoDic objectForKey:@"GitCommitDate"]];
    
    _buildTimeLabel.text = [NSString stringWithFormat:@"本次编译时间：%@", [infoDic objectForKey:@"BuildTime"]];
    
}


- (UILabel*)commitLabel {
    if (!_commitLabel) {
        _commitLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 300, 20)];
        _commitLabel.textColor = [UIColor colorWithRed:0x33/0xff green:0x33/0xff blue:0x33/0xff alpha:1];
    }
    return _commitLabel;
}

- (UILabel*)branchLabel {
    if (!_branchLabel) {
        _branchLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 300, 20)];
        _branchLabel.textColor = [UIColor colorWithRed:0x33/0xff green:0x33/0xff blue:0x33/0xff alpha:1];
    }
    return _branchLabel;
}

- (UILabel*)authorLabel {
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 180, 300, 20)];
        _authorLabel.textColor = [UIColor colorWithRed:0x33/0xff green:0x33/0xff blue:0x33/0xff alpha:1];
    }
    return _authorLabel;
}

- (UILabel*)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 210, 300, 20)];
        _dateLabel.textColor = [UIColor colorWithRed:0x33/0xff green:0x33/0xff blue:0x33/0xff alpha:1];
    }
    return _dateLabel;
}

- (UILabel*)buildTimeLabel {
    if (!_buildTimeLabel) {
        _buildTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 240, 300, 20)];
        _buildTimeLabel.textColor = [UIColor colorWithRed:0x33/0xff green:0x33/0xff blue:0x33/0xff alpha:1];
    }
    return _buildTimeLabel;
}


@end

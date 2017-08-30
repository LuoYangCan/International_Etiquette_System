//
//  HomeTableViewCell.m
//  InternationalEtiquette
//
//  Created by 孤岛 on 2017/8/19.
//  Copyright © 2017年 孤岛. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "Tool.h"
@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
    //self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    
        [self setup];
    }
    return self;
}

-(void)setup{

    UIImageView *leftimage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 105 ,90)];
    leftimage.backgroundColor = RGBColor(211, 211, 211, 1);
    
    UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(128, 45, SCREEN_WIDTH - 190, 60)];
 //   content.backgroundColor = [UIColor cyanColor];
    content.textAlignment = NSTextAlignmentLeft;
    content.numberOfLines = 2;
    content.text = @"这个Cell非常的清真，超级清真，非常的清真，舒服的舒服哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦oooo o o o oooo哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦";
    [content setFont:[UIFont systemFontOfSize:12]];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(127, 20, SCREEN_WIDTH, 20)];
   // title.backgroundColor = [UIColor greenColor];
    title.text = @"这是一个非常清真的标题";
    title.font = [UIFont systemFontOfSize:17];
    title.textAlignment = NSTextAlignmentLeft;
    [self addSubview:title];
    [self addSubview:leftimage];
    [self addSubview:content];
    
}
@end

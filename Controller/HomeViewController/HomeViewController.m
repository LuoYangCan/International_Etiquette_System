//
//  HomeViewController.m
//  InternationalEtiquette
//
//  Created by 孤岛 on 2017/8/18.
//  Copyright © 2017年 孤岛. All rights reserved.
//
#import <Masonry.h>
#import "HomeViewController.h"
#import "Tool.h"
#import "HomeTableViewCell.h"
#import "SearchView.h"

@interface HomeViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
//@property (nonatomic,strong) UISearchBar *topSearch ;
@property (nonatomic,strong) UITableView *baseTableView;
@property (nonatomic,strong) UIView *TopView;        /**< 顶部View  */
@property (nonatomic,assign) CGFloat marginTop;        /**< contentInset.top  */
@property (nonatomic,strong) UIView *SearchView;        /**< 搜索框  */

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setup{
    [self initBaseUI];
}


-(void)initBaseUI{
    self.view.backgroundColor = [UIColor clearColor];
  //  [self initSearchBar];
    [self initbaseTableView];
    [self initTopView];
}

//-(void)initSearchBar{
//    self.topSearch = [[UISearchBar alloc]init];
//    UIImage *img = [Tool GetImageWithColor:[UIColor clearColor] andHeight:32.0f];
//    [self.topSearch setBackgroundImage:img];
//    self.topSearch.delegate = self;
//    [self.view addSubview:self.topSearch];
//    [self.topSearch mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.view.mas_top).mas_offset(60);
//        make.left.and.right.equalTo(self.view);
//    }];
//}
-(void)initbaseTableView{
    self.baseTableView = [[UITableView alloc]init];
    self.baseTableView.backgroundColor = [UIColor clearColor];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    self.baseTableView.scrollIndicatorInsets = UIEdgeInsetsMake(200, 0, 0, 0);
    [self.view addSubview:self.baseTableView];
    [self.baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.equalTo(self.view);
        //make.top.equalTo(self.view).mas_offset(200);
        //make.top.equalTo(self.TopView.mas_bottom);
    }];
    [self.baseTableView setContentOffset:CGPointMake(0, -200) animated:NO];
    self.baseTableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
}






-(void)initTopView{
    
    
    self.TopView = [[UIView alloc]init];
    self.TopView.backgroundColor = [UIColor grayColor];
    [self.baseTableView addSubview:self.TopView];
    [self.TopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.right.equalTo(self.view);
        //make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_top).mas_offset(200);
       // make.bottom.mas_equalTo(self.baseTableView.mas_top);
    }];
    self.TopView.contentMode = UIViewContentModeScaleToFill;
    
    
    
    self.SearchView = [[UIView alloc]init];
    self.SearchView.backgroundColor = [UIColor orangeColor];
    [self.TopView addSubview:self.SearchView];
    [self.SearchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.TopView).mas_offset(10);
        make.top.equalTo(self.TopView).mas_offset(17);
        make.right.equalTo(self.TopView).mas_offset(-7);
        make.bottom.equalTo(self.TopView.mas_bottom).mas_offset(-5);
    }];
    self.SearchView.contentMode = UIViewContentModeScaleToFill;
    self.SearchView.layer.cornerRadius = 15.0f;
    self.SearchView.layer.masksToBounds= YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(PushtoSearch)];
    [self.SearchView addGestureRecognizer:tap];
}
-(void)PushtoSearch{
    SearchView *searchVC = [[SearchView alloc]init];
    [self presentViewController:searchVC animated:NO completion:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UITableViewDelegate&&UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
       HomeTableViewCell *cell = [[HomeTableViewCell alloc]initWithDic:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.marginTop != scrollView.contentInset.top) {
        self.marginTop =scrollView.contentInset.top;
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat newoffsetY = offsetY + self.marginTop;
    if (newoffsetY >=140) {
        newoffsetY = 140;
    }else if (newoffsetY <= 0){
        newoffsetY = 0;
    }
    if (scrollView == self.baseTableView) {
        if (newoffsetY >=0 &&newoffsetY <=140) {
            [self.TopView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.bottom.equalTo(self.view.mas_top).mas_offset(200-newoffsetY);
            }];
//            if (scrollView.isScrollEnabled && (newoffsetY >20 && newoffsetY <140)) {
//                [UIView animateWithDuration:0.7 animations:^{
//                    [self.TopView mas_updateConstraints:^(MASConstraintMaker *make) {
//                        make.bottom.equalTo(self.view.mas_top).mas_offset(60);
//                    }];
//                    [self.TopView.superview layoutIfNeeded];
//                }];
//            }
        }

    }
}
@end

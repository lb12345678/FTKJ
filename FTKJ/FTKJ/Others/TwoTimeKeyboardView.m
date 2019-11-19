//
//  TwoTimeKeyboardView.m
//  PGGFrame
//
//  Created by IOS on 2017/12/25.
//  Copyright © 2017年 com.xiewei. All rights reserved.
//

#import "TwoTimeKeyboardView.h"
#import "PGGPublicClass.h"
#define ARIAL @"Arial"///项目主体字

#define MAINCOLOR [UIColor colorWithRed:255/255.0 green:70/255.0 blue:70/255.0 alpha:1]
#define RGB(R, G, B ,P)    [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:P]

@implementation TwoTimeKeyboardView
@synthesize viewselect,pickview,viewline1,viewline2,lbday,lbyear,lbhouar,lbmouth,lbmintes;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        
        viewtopbutton = [[UIView alloc] initWithFrame:CGRectZero];
        [viewtopbutton setBackgroundColor:[UIColor whiteColor]];
        btstart = [[UIButton alloc] initWithFrame:CGRectZero];
        [btstart setBackgroundColor:MAINCOLOR];
        [btstart setTitle:@"开始时间" forState:UIControlStateNormal];
        btstart.hidden=YES;
        [btstart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btstart.titleLabel setFont:[UIFont fontWithName:ARIAL size:13]];
        [btstart setTag:1];
        [btstart addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
        
        btend = [[UIButton alloc] initWithFrame:CGRectZero];
        [btend setBackgroundColor:[UIColor whiteColor]];
        [btend setTitle:@"结束时间" forState:UIControlStateNormal];
        [btend setTitleColor:RGB(30, 30, 30, 1) forState:UIControlStateNormal];
        [btend.titleLabel setFont:[UIFont fontWithName:ARIAL size:13]];
        btend.hidden=YES;
        [btend setTag:2];
        [btend addTarget:self action:@selector(endAction) forControlEvents:UIControlEventTouchUpInside];
        
        viewbottombt = [[UIView alloc] initWithFrame:CGRectZero];
        [viewbottombt setBackgroundColor:[UIColor whiteColor]];
        
        btok = [[UIButton alloc] initWithFrame:CGRectZero];
        [btok setTitle:@"确认" forState:UIControlStateNormal];
        [btok setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btok.titleLabel setFont:[UIFont fontWithName:ARIAL size:13]];
        [btok setBackgroundColor:MAINCOLOR];
        [btok.layer setMasksToBounds:YES];
        [btok addTarget:self action:@selector(okAction) forControlEvents:UIControlEventTouchUpInside];
        
        btcancle = [[UIButton alloc] initWithFrame:CGRectZero];
        [btcancle setTitle:@"取消" forState:UIControlStateNormal];
        [btcancle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btcancle.titleLabel setFont:[UIFont fontWithName:ARIAL size:13]];
        [btcancle setBackgroundColor:RGB(167, 167, 167, 1)];
        [btcancle.layer setMasksToBounds:YES];
        [btcancle addTarget:self action:@selector(cancleAction) forControlEvents:UIControlEventTouchUpInside];
        
        viewselect = [[UIView alloc]initWithFrame:CGRectZero];
        [viewselect setBackgroundColor:[UIColor whiteColor]];
        
        viewline1 = [[UIView alloc]initWithFrame:CGRectZero];
        [viewline1 setBackgroundColor:[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1]];
        
        viewline2 = [[UIView alloc]initWithFrame:CGRectZero];
        [viewline2 setBackgroundColor:[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1]];
        
        
        pickview = [[UIPickerView alloc]initWithFrame:CGRectZero];
        [pickview setDelegate:self];
        [pickview setDataSource:self];
        [pickview setBackgroundColor:[UIColor whiteColor]];
        
        arralltitlelb = [NSMutableArray new];
        
        lbyear = [[UILabel alloc]initWithFrame:CGRectZero];
        [lbyear setTextColor:MAINCOLOR];
        [lbyear setTextAlignment:NSTextAlignmentCenter];
        [lbyear setFont:[UIFont fontWithName:@"Arial" size:14]];
        
        lbmouth = [[UILabel alloc]initWithFrame:CGRectZero];
        [lbmouth setTextColor:MAINCOLOR];
        [lbmouth setTextAlignment:NSTextAlignmentCenter];
        [lbmouth setFont:[UIFont fontWithName:@"Arial" size:14]];
        
        
        lbday = [[UILabel alloc]initWithFrame:CGRectZero];
        [lbday setTextColor:MAINCOLOR];
        [lbday setTextAlignment:NSTextAlignmentCenter];
        [lbday setFont:[UIFont fontWithName:@"Arial" size:14]];
        
        lbhouar = [[UILabel alloc]initWithFrame:CGRectZero];
        [lbhouar setTextColor:MAINCOLOR];
        [lbhouar setTextAlignment:NSTextAlignmentCenter];
        [lbhouar setFont:[UIFont fontWithName:@"Arial" size:14]];
        
        lbmintes = [[UILabel alloc]initWithFrame:CGRectZero];
        [lbmintes setTextColor:MAINCOLOR];
        [lbmintes setTextAlignment:NSTextAlignmentCenter];
        [lbmintes setFont:[UIFont fontWithName:@"Arial" size:14]];
        
        [arralltitlelb addObject:lbyear];
        [arralltitlelb addObject:lbmouth];
        [arralltitlelb addObject:lbday];
        [arralltitlelb addObject:lbhouar];
        [arralltitlelb addObject:lbmintes];
    }
    return self;
}


-(void)getdata
{
    arryear = [NSMutableArray new];
    arrmouth = [NSMutableArray new];
    arrday = [NSMutableArray new];
    arrhouar = [NSMutableArray new];
    arrmintes = [NSMutableArray new];
    
    NSString *strnowtime = [PGGPublicClass getnowdata:@"yyyy-MM-dd HH:mm:ss" bigType:@""];
    strstarttime = [PGGPublicClass getnowdata:@"yyyy-MM-dd HH:mm" bigType:@""];
    strnowtime = [strnowtime stringByReplacingOccurrencesOfString:@" " withString:@":"];
    strnowtime = [strnowtime stringByReplacingOccurrencesOfString:@"-" withString:@":"];
    arrnowtime = [strnowtime componentsSeparatedByString:@":"];
    
  
    
    
    stryear = arrnowtime[0];
    strmouth= arrnowtime[1];
    strday= arrnowtime[2];
    strhouar= arrnowtime[3];
    strmintes= arrnowtime[4];
    if(_isNotnowtime == YES)
    {
        for(int i = 1949;i<=[arrnowtime[0] intValue]+20;i++)
        {
            
            [arryear addObject:[NSString stringWithFormat:@"%d",i]];
            
        }
        for(int j = 1;j<=12;j++)
        {
            [arrmouth addObject:[NSString stringWithFormat:@"%d",j]];
        }
        for(int i =1; i <= [PGGPublicClass countday:stryear andmouth:strmouth];i++)
        {
            [arrday addObject:[NSString stringWithFormat:@"%d",i]];
        }
        for(int j = 0;j<24;j++)
        {
            [arrhouar addObject:[NSString stringWithFormat:@"%d",j]];
        }
        for(int j = 0;j<=60;j++)
        {
            [arrmintes addObject:[NSString stringWithFormat:@"%d",j]];
        }
    }
    else
    {
        for(int i = 1949;i<=[arrnowtime[0] intValue];i++)
        {
            
            [arryear addObject:[NSString stringWithFormat:@"%d",i]];
            
        }
        for(int j = 1;j<=[arrnowtime[1] intValue];j++)
        {
            [arrmouth addObject:[NSString stringWithFormat:@"%d",j]];
        }
        for(int j = 1;j<=[arrnowtime[2] intValue];j++)
        {
            [arrday addObject:[NSString stringWithFormat:@"%d",j]];
        }
        for(int j = 0;j<=[arrnowtime[3] intValue];j++)
        {
            [arrhouar addObject:[NSString stringWithFormat:@"%d",j]];
        }
        for(int j = 0;j<=[arrnowtime[4] intValue];j++)
        {
            [arrmintes addObject:[NSString stringWithFormat:@"%d",j]];
        }
    }
   
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
    
    UITapGestureRecognizer *tapview = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismisself)];
    [self addGestureRecognizer:tapview];
    
    if(viewselect.height <= 1)
    {
        [self getdata];
        
        btnowtop = btstart;
        
        [pickview setFrame:CGRectMake(0, self.height-190, self.width, 150)];
        [self addSubview:pickview];
        
        [viewselect setFrame:CGRectMake(0, pickview.top-40, self.width, 40)];
        [self addSubview:viewselect];
        
        [viewtopbutton setFrame:CGRectMake(0, viewselect.top-40, viewselect.width, 40)];
        [self addSubview:viewtopbutton];
        [btstart setFrame:CGRectMake(10, 0, (viewtopbutton.width-20)/2.0, viewtopbutton.height)];
        [viewtopbutton addSubview:btstart];
        [btend setFrame:CGRectMake(btstart.right, 0, btstart.width, viewtopbutton.height)];
        [viewtopbutton addSubview:btend];
        
        
        [viewbottombt setFrame:CGRectMake(0, pickview.bottom, pickview.width, 40)];
        [self addSubview:viewbottombt];
        [btok setFrame:CGRectMake(20, 5, (viewbottombt.width-60)/2.0, viewbottombt.height-10)];
        [btok.layer setCornerRadius:2];
        [viewbottombt addSubview:btok];
        
        [btcancle setFrame:CGRectMake(btok.right+20, btok.top, btok.width, btok.height)];
        [btcancle.layer setCornerRadius:2];
        [viewbottombt addSubview:btcancle];
        
        NSArray *arrttemp = [NSArray arrayWithObjects:@"年",@"月",@"日",@"时",@"分", nil];
        for(int i = 0 ; i < _iline; i++)
        {
            UILabel *lb = arralltitlelb[i];
            [lb setFrame:CGRectMake(viewselect.width/_iline*i, 0, viewselect.width/_iline, viewselect.height)];
            [lb setText:arrttemp[i]];
            [viewselect addSubview:lb];
        }
        
        [viewline1 setFrame:CGRectMake(0, 0, viewselect.width, 1)];
        [viewselect addSubview:viewline1];
        
        
        [viewline2 setFrame:CGRectMake(0, viewselect.height-1, viewselect.width, 1)];
        [viewselect addSubview:viewline2];
        
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(selecttempaction) userInfo:nil repeats:NO];
        
    }
    
    
}

-(void)selecttempaction
{
    if(_iline == 1)
    {
        [pickview selectRow:[self getnomoline:arryear andvalue:stryear] inComponent:0 animated:YES];
        
//        [self.degelate TwochangetimeValue:[NSString stringWithFormat:@"%@",stryear]];
    }
    else if (_iline == 2)
    {
        [pickview selectRow:[self getnomoline:arryear andvalue:stryear] inComponent:0 animated:YES];
        [pickview selectRow:[self getnomoline:arrmouth andvalue:strmouth] inComponent:1 animated:YES];
        
//        [self.degelate TwochangetimeValue:[NSString stringWithFormat:@"%@-%@",stryear,strmouth]];
    }
    else if (_iline == 3)
    {
        [pickview selectRow:[self getnomoline:arryear andvalue:stryear] inComponent:0 animated:YES];
        [pickview selectRow:[self getnomoline:arrmouth andvalue:strmouth] inComponent:1 animated:YES];
        [pickview selectRow:[self getnomoline:arrday andvalue:strday] inComponent:2 animated:YES];
        
//        [self.degelate TwochangetimeValue:[NSString stringWithFormat:@"%@-%@-%@",stryear,strmouth,strday]];
    }
    else if (_iline == 4)
    {
        [pickview selectRow:[self getnomoline:arryear andvalue:stryear] inComponent:0 animated:YES];
        [pickview selectRow:[self getnomoline:arrmouth andvalue:strmouth] inComponent:1 animated:YES];
        [pickview selectRow:[self getnomoline:arrday andvalue:strday] inComponent:2 animated:YES];
        [pickview selectRow:[self getnomoline:arrhouar andvalue:strhouar] inComponent:3 animated:YES];
        
//        [self.degelate TwochangetimeValue:[NSString stringWithFormat:@"%@-%@-%@ %@",stryear,strmouth,strday,strhouar]];
    }
    else if (_iline == 5)
    {
        [pickview selectRow:[self getnomoline:arryear andvalue:stryear] inComponent:0 animated:YES];
        [pickview selectRow:[self getnomoline:arrmouth andvalue:strmouth] inComponent:1 animated:YES];
        [pickview selectRow:[self getnomoline:arrday andvalue:strday] inComponent:2 animated:YES];
        [pickview selectRow:[self getnomoline:arrhouar andvalue:strhouar] inComponent:3 animated:YES];
        [pickview selectRow:[self getnomoline:arrmintes andvalue:strmintes] inComponent:4 animated:YES];
        
//        [self.degelate TwochangetimeValue:[NSString stringWithFormat:@"%@-%@-%@ %@:%@",stryear,strmouth,strday,strhouar,strmintes]];
    }
    
}

-(NSInteger)getnomoline:(NSMutableArray *)arr andvalue:(NSString *)strnomo
{
    NSInteger i = 0;
    for(NSString *str in arr)
    {
        if([str intValue] == strnomo.intValue)
        {
            return i;
        }
        i++;
    }
    return 0;
}


-(void)dismisself
{
    
    [UIView animateWithDuration:0.5 animations:^{
        [viewtopbutton setTop:kScreenHeight];
        [viewselect setTop:viewtopbutton.bottom];
        [pickview setTop:viewselect.bottom];
        [viewbottombt setTop:pickview.bottom];
    } completion:^(BOOL finished) {
        
        
        [self removeFromSuperview];
    }];
}

#pragma mark - 开始时间
-(void)startAction
{
    
    
    [btstart setBackgroundColor:MAINCOLOR];
    
    
    [btstart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    [btend setBackgroundColor:[UIColor whiteColor]];
    
    
    [btend setTitleColor:RGB(30, 30, 30, 1) forState:UIControlStateNormal];
    btnowtop = btstart;
    if(strstarttime == nil){
        strstarttime = [self getbat];
    }
    
}

#pragma mark - 结束时间
-(void)endAction
{
    
    [btend setBackgroundColor:MAINCOLOR];
    
    
    [btend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    [btstart setBackgroundColor:[UIColor whiteColor]];
    

    [btstart setTitleColor:RGB(30, 30, 30, 1) forState:UIControlStateNormal];
    btnowtop = btend;
    
    if(strendtime == nil){
        strendtime = [self getbat];
    }
}

#pragma mark - 确认
-(void)okAction
{
    if(btnowtop.tag == 1){
        strstarttime = [self getbat];
    }
    else
    {
        strendtime = [self getbat];;
    }
    ////
    strendtime= strstarttime;
    
    
    if(strendtime == nil){
        [PGGPublicClass altetshow:@"请选择结束时间"];
        return;
    }
    
    if(strstarttime == nil){
        [PGGPublicClass altetshow:@"请选择开始时间"];
        return;
    }
    
    NSLog(@"strstarttime=%@\nstrendtime=%@",strstarttime,strendtime);
    
    
    
    if([self isjudgeTimeLength]){
        [self.degelate TwochangetimeValue:strstarttime andendvalue:strendtime];
        
        [self dismisself];
    }
    else{
        [PGGPublicClass altetshow:@"结束时间需大于等于开始时间"];
    }
    
}

-(BOOL)isjudgeTimeLength
{
    BOOL isback = NO;
    
    NSInteger start = [[PGGPublicClass timechangechuo:strstarttime andtype:@"yyyy-MM-dd"] integerValue];
    NSInteger end = [[PGGPublicClass timechangechuo:strendtime andtype:@"yyyy-MM-dd"] integerValue];
    
    if(start <= end){
        isback = YES;
    }
    
    return isback;
}



-(NSString *)getbat
{
    NSString *strtemp = @"";
    if(_iline == 1)
    {
        strtemp = [NSString stringWithFormat:@"%@",stryear];
        
    }
    else if (_iline == 2)
    {
        strtemp = [NSString stringWithFormat:@"%@-%@",stryear,strmouth];
        
    }
    else if (_iline == 3)
    {
        strtemp = [NSString stringWithFormat:@"%@-%@-%@",stryear,strmouth,strday];
        
    }
    else if (_iline == 4)
    {
        strtemp = [NSString stringWithFormat:@"%@-%@-%@ %@",stryear,strmouth,strday,strhouar];
        
    }
    else if (_iline == 5)
    {
        strtemp = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",stryear,strmouth,strday,strhouar,strmintes];
    }
    
    
    
    return strtemp;
}

#pragma mark - 取消
-(void)cancleAction
{
    [self dismisself];
}

#pragma mark - UIPickerView
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return _iline;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
    {
        return arryear.count;
    }
    else if(component == 1)
    {
        return arrmouth.count;
    }
    else if(component == 2)
    {
        return arrday.count;
    }
    else if(component == 3)
    {
        return arrhouar.count;
    }
    else if(component == 4)
    {
        return arrmintes.count;
    }
    return 0;
}
// returns width of column and height of row for each component.
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    float fline = 5.2;
    if(_iline == 3)
    {
        fline = 3.2;
    }
    return pickerView.width/fline;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:( UIView *)view
{
    float fline = 5.2;
    if(_iline == 3)
    {
        fline = 3.2;
    }
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, pickerView.width/fline, 40)];
    if(component == 0)
    {
        [lb setText:arryear[row]];
    }
    else if(component == 1)
    {
        [lb setText:arrmouth[row]];
    }
    else if(component == 2)
    {
        [lb setText:arrday[row]];
    }
    else if(component == 3)
    {
        [lb setText:arrhouar[row]];
    }
    else if(component == 4)
    {
        [lb setText:arrmintes[row]];
    }
    
    [lb setTextColor:[UIColor colorWithRed:84/255.0 green:84/255.0 blue:84/255.0 alpha:1]];
    [lb setTextAlignment:NSTextAlignmentCenter];
    [lb setFont:[UIFont fontWithName:@"Arial" size:kWidthChange(18)]];
    return lb;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    
    
    if(component == 0)
    {
        stryear = arryear[row];
        
        [self yearjudge];
        [self mouthjudge];
        [self dayjudge];
        [self houarjudge];
        
        
        [pickerView reloadAllComponents];
        
    }
    else if(component == 1)
    {
        strmouth = arrmouth[row];
        
        [self mouthjudge];
        [self dayjudge];
        [self houarjudge];
        
        [pickerView reloadAllComponents];
        
    }
    else if(component == 2)
    {
        
        strday = arrday[row];
        
        [self dayjudge];
        [self houarjudge];
        
        [pickerView reloadAllComponents];
        
        
    }
    else if(component == 3)
    {
        
        strhouar = arrhouar[row];
        
        [self houarjudge];
        
        [pickerView reloadComponent:4];
        
    }
    else if(component == 4)
    {
        strmintes = arrmintes[row];
    }
    
    if([strmouth intValue] < 10)
    {
        strmouth = [NSString stringWithFormat:@"0%d",[strmouth intValue]];
    }
    if([strday intValue] < 10)
    {
        strday = [NSString stringWithFormat:@"0%d",[strday intValue]];
    }
    if([strhouar intValue] < 10)
    {
        strhouar = [NSString stringWithFormat:@"0%d",[strhouar intValue]];
    }
    if([strmintes intValue] < 10)
    {
        strmintes = [NSString stringWithFormat:@"0%d",[strmintes intValue]];
    }
    
    if (btnowtop.tag == 1) {
        strstarttime = [self getbat];
    }
    
    
    
    
    
    
    
    
//    switch (_iline) {
//        case 1:
//        {
//            [self.degelate TwochangetimeValue:[NSString stringWithFormat:@"%@",stryear]];
//        }
//            break;
//        case 2:
//        {
//            [self.degelate TwochangetimeValue:[NSString stringWithFormat:@"%@-%@",stryear,strmouth]];
//        }
//            break;
//        case 3:
//        {
//            [self.degelate TwochangetimeValue:[NSString stringWithFormat:@"%@-%@-%@",stryear,strmouth,strday]];
//        }
//            break;
//        case 4:
//        {
//            [self.degelate TwochangetimeValue:[NSString stringWithFormat:@"%@-%@-%@ %@",stryear,strmouth,strday,strhouar]];
//        }
//            break;
//        case 5:
//        {
//            [self.degelate TwochangetimeValue:[NSString stringWithFormat:@"%@-%@-%@ %@:%@",stryear,strmouth,strday,strhouar,strmintes]];
//        }
//            break;
//
//        default:
//            break;
//    }
    
    
}

-(void)yearjudge
{
    if(_isNotnowtime == YES)
    {
        arrmouth = [NSMutableArray new];
        for(int i =1; i <= 12;i++)
        {
            [arrmouth addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    else
    {
        if([stryear intValue] == [arrnowtime[0]intValue])
        {
            arrmouth = [NSMutableArray new];
            for(int i =1; i <= [arrnowtime[1] intValue];i++)
            {
                [arrmouth addObject:[NSString stringWithFormat:@"%d",i]];
            }
            if([strmouth intValue] > [arrnowtime[1] intValue])
            {
                strmouth =arrnowtime[1];
            }
            [self mouthjudge];
            
        }
        else
        {
            arrmouth = [NSMutableArray new];
            for(int i =1; i <= 12;i++)
            {
                [arrmouth addObject:[NSString stringWithFormat:@"%d",i]];
            }
        }
    }
    
    
}

-(void)mouthjudge
{
    if(_isNotnowtime == YES)
    {
        arrday = [NSMutableArray new];
        for(int i =1; i <= [PGGPublicClass countday:stryear andmouth:strmouth];i++)
        {
            [arrday addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    else
    {
        if([strmouth intValue] == [arrnowtime[1]intValue]&&[stryear intValue] == [arrnowtime[0]intValue])
        {
            arrday = [NSMutableArray new];
            for(int i =1; i <= [arrnowtime[2] intValue];i++)
            {
                [arrday addObject:[NSString stringWithFormat:@"%d",i]];
            }
            if([strday intValue] > [arrnowtime[2] intValue])
            {
                strday =arrnowtime[2];
            }
            
            [self dayjudge];
        }
        else
        {
            arrday = [NSMutableArray new];
            for(int i =1; i <= [PGGPublicClass countday:stryear andmouth:strmouth];i++)
            {
                [arrday addObject:[NSString stringWithFormat:@"%d",i]];
            }
        }
    }
    
}

-(void)dayjudge
{
    
    if([strday intValue] == [arrnowtime[2]intValue]&&[strmouth intValue] == [arrnowtime[1]intValue]&&[stryear intValue] == [arrnowtime[0]intValue])
    {
        arrhouar = [NSMutableArray new];
        for(int i =0; i <= [arrnowtime[3] intValue];i++)
        {
            [arrhouar addObject:[NSString stringWithFormat:@"%d",i]];
        }
        if([strhouar intValue] > [arrnowtime[3] intValue])
        {
            strhouar =arrnowtime[3];
        }
        [self houarjudge];
    }
    else
    {
        arrhouar = [NSMutableArray new];
        for(int i =0; i <= 23;i++)
        {
            [arrhouar addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
}

-(void)houarjudge
{
    
    if([strhouar intValue] == [arrnowtime[3]intValue]&&[strday intValue] == [arrnowtime[2]intValue]&&[strmouth intValue] == [arrnowtime[1]intValue]&&[stryear intValue] == [arrnowtime[0]intValue])
    {
        arrmintes = [NSMutableArray new];
        for(int i =0; i <= [arrnowtime[4] intValue];i++)
        {
            [arrmintes addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    else
    {
        arrmintes = [NSMutableArray new];
        for(int i =0; i <= 59;i++)
        {
            [arrmintes addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
}


@end

//
//  StringCheck.m
//  IOCDOC-DC
//
//  Created by ZC on 15/11/5.
//  Copyright © 2015年 ZC. All rights reserved.
//

#import "StringCheck.h"

@implementation StringCheck

#pragma mark - 字符串校验是否为空
inline BOOL ICIsStringEmpty(NSString *string){
    
    //去除空格
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if (string.length == 0) {
        return YES;
    }
    
    if ([string isEqualToString:@"<null>"]) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isStringEmpty:(NSString *)emptyString
{
    //去除空格
    emptyString = [emptyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (emptyString == nil) {
        return YES;
    }
    
    if (emptyString == NULL) {
        return YES;
    }
    
    if (emptyString.length == 0) {
        return YES;
    }
    
    if ([emptyString isEqualToString:@"<null>"]) {
        return YES;
    }
    
    if ([emptyString isEqualToString:@"(null)"]) {
        return YES;
    }
    
    return NO;
}

#pragma mark - 字符串格式校验是否合法
+ (BOOL)isStringMobileNumberValid:(NSString *)mobileNum
{
    /**
     * 手机号码(11位，判断前三位网络识别号)
     * 移动：(2G):134[0-8],135,136,137,138,139,
     (2G):150,151,152,157,158,159,
     (3G):182,183,184,187,188,
     (4G):178,
     * 联通：(2G):130,131,132,
     (2G):155,156,
     (3G):185,186,
     (4G):176
     * 电信：(2G):133,1349(卫星通信),
     (2G):153,
     (3G):180,181,189
     (4G):177
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9]|7[6-8])\\d{8}$";
    //NSString * MOBILE = @"^1(3[0-9]|5[0-9]|8[0-9]|7[6-8])\\d{8}$";//放宽要求只检验前两位
    /**
     * 中国移动：China Mobile
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[0-27-9]|8[2-478]|78)\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     */
    NSString * CU = @"^1(3[0-2]|5[56]|8[56]|76)\\d{8}$";
    /**
     * 中国电信：China Telecom
     */
    NSString * CT = @"^1((33|53|8[019]|77)[0-9]|349)\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)){
        if([regextestcm evaluateWithObject:mobileNum] == YES) {
            NSLog(@"China Mobile");
        } else if ([regextestcu evaluateWithObject:mobileNum] == YES) {
            NSLog(@"China Unicom");
        } else if([regextestct evaluateWithObject:mobileNum] == YES) {
            NSLog(@"China Telecom");
        } else {
            NSLog(@"Unknow");
        }
        
        return YES;
    }
    else{
        return NO;
    }
}

//是否11位数字
+ (BOOL)isStringElevenNumberValid:(NSString *)mobileNum
{
    NSString *Regex=@"^[\\d]{11}$";
    NSPredicate *passString=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",Regex];
    return [passString evaluateWithObject:mobileNum];
}

+ (BOOL)isStringPasswordValid:(NSString *)passNum
{
    NSString *Regex=@"[A-Z0-9a-z._%+-]{6,12}";
    NSPredicate *passString=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",Regex];
    return [passString evaluateWithObject:passNum];
}

+ (BOOL)isStringEmailValid:(NSString *)emailNum
{
    NSString *Regex=@"[A-Z0-9a-z._%+-]+@[A-Z0-9a-z._]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailString=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",Regex];
    return [emailString evaluateWithObject:emailNum];
}


+(NSString*) getTheCorrectNumWithoutPrefix:(NSString*)tempString
{
    while ([tempString hasPrefix:@"0"])
    {
        tempString = [tempString substringFromIndex:1];
        NSLog(@"压缩之后的tempString:%@",tempString);
    }
    return tempString;
}




/**
 *  常用正则表达式：
 
 1、非负整数：^\d+$
 
 2、正整数：^[0-9]*[1-9][0-9]*$
 
 3、非正整数：^((-\d+)|(0+))$
 
 4、负整数：^-[0-9]*[1-9][0-9]*$
 
 5、整数：^-?\d+$
 
 6、非负浮点数：^\d+(\.\d+)?$
 
 7、正浮点数：^((0-9)+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$
 
 8、非正浮点数：^((-\d+\.\d+)?)|(0+(\.0+)?))$
 
 9、负浮点数：^(-((正浮点数正则式)))$
 
 10、英文字符串：^[A-Za-z]+$
 
 11、英文大写串：^[A-Z]+$
 
 12、英文小写串：^[a-z]+$
 
 13、英文字符数字串：^[A-Za-z0-9]+$
 
 14、英数字加下划线串：^\w+$
 
 15、E-mail地址：^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$
 
 16、URL：^[a-zA-Z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\s*)?$
 或：^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>""])*$
 
 17、邮政编码：^[1-9]\d{5}$
 
 18、中文：^[\u0391-\uFFE5]+$
 
 19、电话号码：^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$
 
 20、手机号码：^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$
 
 21、双字节字符(包括汉字在内)：^\x00-\xff
 
 22、匹配首尾空格：(^\s*)|(\s*$)（像vbscript那样的trim函数）
 
 23、匹配HTML标记：<(.*)>.*<\/\1>|<(.*) \/>
 
 24、匹配空行：\n[\s| ]*\r
 
 25、提取信息中的网络链接：(h|H)(r|R)(e|E)(f|F)  *=  *('|")?(\w|\\|\/|\.)+('|"|  *|>)?
 
 26、提取信息中的邮件地址：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
 
 27、提取信息中的图片链接：(s|S)(r|R)(c|C)  *=  *('|")?(\w|\\|\/|\.)+('|"|  *|>)?
 
 28、提取信息中的IP地址：(\d+)\.(\d+)\.(\d+)\.(\d+)
 
 29、提取信息中的中国手机号码：(86)*0*13\d{9}
 
 30、提取信息中的中国固定电话号码：(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}
 
 31、提取信息中的中国电话号码（包括移动和固定电话）：(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}
 
 32、提取信息中的中国邮政编码：[1-9]{1}(\d+){5}
 
 33、提取信息中的浮点数（即小数）：(-?\d*)\.?\d+
 
 34、提取信息中的任何数字 ：(-?\d*)(\.\d+)?
 
 35、IP：(\d+)\.(\d+)\.(\d+)\.(\d+)
 
 36、电话区号：/^0\d{2,3}$/
 
 37、腾讯QQ号：^[1-9]*[1-9][0-9]*$
 
 38、帐号(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
 
 39、中文、英文、数字及下划线：^[\u4e00-\u9fa5_a-zA-Z0-9]+$
 
 40、匹配首尾空白字符的正则表达式：^\s*|\s*$
 评注：可以用来删除行首行尾的空白字符(包括空格、制表符、换页符等等)，非常有用的表达式
 
 41、匹配网址URL的正则表达式：(https?|ftp|file)://[-A-Z0-9+&@#/%?=~_|!:,.;]*[-A-Z0-9+&@#/%=~_|]
 
 
 */


//+ (BOOL)isValidateMobilePhone:(NSString *)mobilePhone{
//
//    /**
//     * 手机号码
//     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，183
//     * 联通：130,131,132,152,155,156,185,186
//     * 电信：133,1349,153,180,189
//     */
//    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
//    /**
//     10         * 中国移动：China Mobile
//     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,183
//     12         */
//    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
//    /**
//     15         * 中国联通：China Unicom
//     16         * 130,131,132,152,155,156,185,186
//     17         */
//    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
//    /**
//     20         * 中国电信：China Telecom
//     21         * 133,1349,153,180,189
//     22         */
//    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
//    /**
//     25         * 大陆地区固话及小灵通
//     26         * 区号：010,020,021,022,023,024,025,027,028,029
//     27         * 号码：七位或八位
//     28         */
//    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
//
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//
//    if (([regextestmobile evaluateWithObject:mobilePhone] == YES)
//        || ([regextestcm evaluateWithObject:mobilePhone] == YES)
//        || ([regextestct evaluateWithObject:mobilePhone] == YES)
//        || ([regextestcu evaluateWithObject:mobilePhone] == YES))
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//}
//
//+ (BOOL)isValidateMobilePhoneTextFiled:(UITextField *)textFiled{
//
//    if (textFiled.text.length == 0 || [[textFiled.text stringByDeleteWhitespaceAndWrap] length] == 0) {
//        return NO;
//    }
//
//    return [YYFormatValidate isValidateMobilePhone:[textFiled.text stringByDeleteWhitespaceAndWrap]];
//}
//
//+ (BOOL)isValidateEmail:(NSString *)email{
//
//    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
//    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
//
//    return [emailTest evaluateWithObject:email];
//}
//
//+ (BOOL)isValidateNumber:(NSString *)number{
//
//    NSString *regex = @"[0-9]*";
//    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
//
//    return [numberTest evaluateWithObject:number];
//}
//
//+ (BOOL)isValidateStrictNumber:(NSString *)number{
//
//    //严格判断
//    NSString *regex = @"^((\\(\\d{2,3}\\))|(\\d{4}\\-))?1[3,4,5,8]\\d{9}$";
//    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
//
//    return [numberTest evaluateWithObject:number];
//
//}
//
//+ (BOOL)isValidateTelephone:(NSString *)telephone{
//
//    //判断电话
//    NSString *regex = @"^[\\d+-]*$";
//    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
//
//    return [numberTest evaluateWithObject:telephone];
//
//}
//
//+ (BOOL)isTextFiledValidate:(UITextField *)textFiled minLenght:(int)min maxLenght:(int)max{
//
//    if (textFiled.text.length == 0 || [[textFiled.text stringByDeleteWhitespaceAndWrap] length] == 0) {
//        return NO;
//    }
//
//    if ([[textFiled.text stringByDeleteWhitespaceAndWrap] length] > max || [[textFiled.text stringByDeleteWhitespaceAndWrap] length] < min) {
//        return NO;
//    }
//
//    return YES;
//
//}
//
//+ (BOOL)validateIDCardNumber:(NSString *)value {
//
//    if (value.length != 18) {
//        return  NO;
//    }
//    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
//    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
//
//    NSScanner* scan = [NSScanner scannerWithString:[value substringToIndex:17]];
//
//    int val;
//    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
//    if (!isNum) {
//        return NO;
//    }
//    int sumValue = 0;
//
//    for (int i =0; i<17; i++) {
//        sumValue+=[[value substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
//    }
//
//    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
//
//    if ([strlast isEqualToString: [[value substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
//        return YES;
//    }
//    return  NO;
//}
//
//+ (BOOL) validatefloatString:(NSString *)floatString{
//
//    NSScanner* scan = [NSScanner scannerWithString:floatString];
//    float val;
//    return [scan scanFloat:&val] && [scan isAtEnd];
//}


@end

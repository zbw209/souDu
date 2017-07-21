//
//  StringCheck.h
//  IOCDOC-DC
//
//  Created by ZC on 15/11/5.
//  Copyright © 2015年 ZC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *自定义字符串检测类
 */

@interface StringCheck : NSObject

#pragma mark - 字符串校验是否为空
/**
 *  判断字符串是否为空
 *
 *  @param emptyString 待判断字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isStringEmpty:(NSString *)emptyString;



#pragma mark - 字符串格式校验是否合法
/**
 *  检验字符串是否手机号码
 *
 *  @param mobileNum 待检验字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isStringMobileNumberValid:(NSString *)mobileNum;
//是否11位数字
+ (BOOL)isStringElevenNumberValid:(NSString *)mobileNum;

/**
 *  密码校验
 *  条件:(6~12位，英文大小写、数字、“._%+-”)
 *
 *  @param passNum 待检验字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isStringPasswordValid:(NSString *)passNum;

/**
 *  邮件地址校验
 *
 *  @param emailNum 待校验的字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isStringEmailValid:(NSString *)emailNum;

/**
 *  去除数字前面的0
 */
+(NSString*)getTheCorrectNumWithoutPrefix:(NSString*)tempString;
///**
// *  验证手机号码
// *
// *  @param mobilePhone 手机号
// *
// *  @return 布尔值
// */
//+ (BOOL)isValidateMobilePhone:(NSString *)mobilePhone;
//
///**
// *  判断输入的内容是否合理
// *
// *  @param textFiled 输入框对象
// *
// *  @return 布尔值
// */
//+ (BOOL)isValidateMobilePhoneTextFiled:(UITextField *)textFiled;
//
///**
// *  验证邮箱
// *
// *  @param email 邮箱
// *
// *  @return 布尔值
// */
//+ (BOOL)isValidateEmail:(NSString *)email;
//
///**
// *  验证是否为纯数字
// *
// *  @param number 字符串
// *
// *  @return 布尔值
// */
//+ (BOOL)isValidateNumber:(NSString *)number;
//
///**
// *  验证手机号码是否符合格式
// *
// *  @param number 手机号字符串
// *
// *  @return 校验结果
// */
//+ (BOOL)isValidateStrictNumber:(NSString *)number;
//
///**
// *  验证是否为电话号码，规则为123456789- 的字符串
// *
// *  @param telephone 电话号码
// *
// *  @return 布尔值
// */
//+ (BOOL)isValidateTelephone:(NSString *)telephone;
//
//
///**
// *	在某个区域内是否合理，默认为0-16
// *
// *	@param	textFiled	待验证的输入框
// *	@param	min	最小长度
// *	@param	max	最大长度
// *
// *	@return	布尔值
// */
//+ (BOOL)isTextFiledValidate:(UITextField *)textFiled minLenght:(int)min maxLenght:(int)max;
//
//
///**
// *  验证身份证号码
// *
// *  @param value 待验证的身份证号码
// *
// *  @return 布尔值
// */
//+ (BOOL)validateIDCardNumber:(NSString *)value;
//
///**
// *  检验是否只包含数字（0-9）和"."符号
// *
// *  @param floatString 待校验的字符串
// *
// *  @return 校验结果
// */
//+ (BOOL) validatefloatString:(NSString *)floatString;

@end

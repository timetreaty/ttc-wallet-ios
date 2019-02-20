//
//  HttpHelper.h
//  TTC_ios
//
//  Created by 弹指婆婆纳 on 2018/9/26.
//  Copyright © 2018年 弹指婆婆纳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tool.h"
#import "AFNetworking.h"
@interface HttpHelper : NSObject
#pragma mark - 注册、登录、获取验证码、找回密码
/**
 * 登录接口
 *（REQUEST_LOGIN/username/pwd--20000-blockId/token/password）
 *  @param username  登录id
 *  @param pwd       登录密码
 */
- (void)loginAppByAccount:(NSString *)username
                 password:(NSString *)pwd
                  success:(void (^)(NSDictionary *resultDic))success
                     fail:(void (^)(NSString *description))fail;
/**
 * 获取注册验证码
 *（REQUEST_GET_CODE/phone/project=3）
 *  @param phone   输入注册手机号
 *  @param project 3
 */
- (void)getVerificationCodeByMobile:(NSString *)phone
                            project:(NSString *)project
                            success:(void (^)(NSDictionary *resultDic))success
                               fail:(void (^)(NSString *description))fail;
/**
 *验证注册验证码
 *（REQUEST_CHECKED_CODE/phone/code/project=3----phone）
 *  @param phone   输入注册手机号
 *  @param code    验证码
 *  @param project 3
 */
- (void)verifyRegistrationVerificationPhone:(NSString *)phone
                                      code:(NSString *)code
                                   project:(NSString *)project
                                   success:(void (^)(NSDictionary *resultDic))success
                                      fail:(void (^)(NSString *description))fail;

/**
 * 区块身份认证
 *(SAVE_IDENTITY_CARD/userName/identityCard/account/project=3--blockId/token)
 * @param userName      姓名
 * @param identityCard  证件号
 * @param account       phone手机号
 * @param project       3
 */
- (void)blockIdentificationUserName:(NSString *)userName
                       identityCard:(NSString *)identityCard
                            account:(NSString *)account
                            project:(NSString *)project
                            success:(void (^)(NSDictionary *resultDic))success
                               fail:(void (^)(NSString *description))fail;

/**
 *设置密码
 *(UPDATE_PWD/pwd/token/blockId)
 * @param pwd   密码
 * @param token      token
 * @param blockId    区块ID
 */
- (void)setPassword:(NSString *)pwd
              token:(NSString *)token
            blockId:(NSString *)blockId
            success:(void (^)(NSDictionary *resultDic))success
               fail:(void (^)(NSString *description))fail;

/**
 *找回密码验证ID
 *(JUDGE_BLOCK_ID/blockId)
 * @param blockId    区块ID
 */
- (void)passwordRecoveryVerificationBlockId:(NSString *)blockId
                                    success:(void (^)(NSDictionary *resultDic))success
                                       fail:(void (^)(NSString *description))fail;

/**
 *找回密码发送验证码
 *(BLOCK_ID_PHONE_CODE/blockId)
 * @param blockId    区块ID
 */
- (void)retrievePasswordSendVerificationCode:(NSString *)blockId
                                    success:(void (^)(NSDictionary *resultDic))success
                                       fail:(void (^)(NSString *description))fail;
/**
 *找回密码验证
 *(FIND_PWD/code/pwd/blockId)
 * @param code    验证码
 * @param pwd     密码
 * @param blockId 区块ID
 */
-(void)passwordRecoveryVerificationCode:(NSString *)code
                                    pwd:(NSString *)pwd
                                blockId:(NSString *)blockId
                                success:(void (^)(NSDictionary *resultDic))success
                                   fail:(void (^)(NSString *description))fail;

/**
 *找回区块ID获取验证码
 *(FIND_BLOCK_ID_CODE/phone)
 * @param phone   手机号
 */
-(void)retrieveBlockidVerificationCodePhone:(NSString *)phone
                                    success:(void (^)(NSDictionary *resultDic))success
                                       fail:(void (^)(NSString *description))fail;


/**
 * 找回区块ID验证验证码
 *(FIND_BLOCK_ID/code/userName/identityCard/phone--20000/blockId/token)
 * @param code          验证码
 * @param userName      姓名
 * @param identityCard  证件号
 * @param phone         手机号
 */
-(void)retrieveBlockIDVerificationVerificationCode:(NSString *)code
                                          userName:(NSString *)userName
                                      identityCard:(NSString *)identityCard
                                             phone:(NSString *)phone
                                           success:(void (^)(NSDictionary *resultDic))success
                                              fail:(void (^)(NSString *description))fail;

/**
 * 找回区块ID重置密码
 *(FIND_UPDATE_PWD/pwd/token/blockId)
 * @param pwd        验证码
 * @param token      token
 * @param blockId    区块ID
 */
-(void)retrieveBlockIDResetPassword:(NSString *)pwd
                              token:(NSString *)token
                            blockId:(NSString *)blockId
                            success:(void (^)(NSDictionary *resultDic))success
                               fail:(void (^)(NSString *description))fail;



/**
 * 获取资产
 *(GET_PROPERTY/token)
 * @param token      token
 */
-(void)accessAssetsToken:(NSString *)token
                 success:(void (^)(NSDictionary *resultDic))success
                    fail:(void (^)(NSString *description))fail;

/**
 * OTC交易记录
 *(GET_OTC/token/page/row)
 * @param token     token
 * @param page      第几页从1开始
 * @param row       每页请求多少行
 */
-(void)OTCTransactionRecordsToken:(NSString *)token
                             page:(NSString *)page
                              row:(NSString *)row
                          success:(void (^)(NSDictionary *resultDic))success
                            fail:(void (^)(NSString *description))fail;

/**
 * 获取Kyc认证等级
 *(REQUEST_WHETHERKYC/token/project)
 * @param token     token
 * @param project     4
 */
-(void)getKycAuthenticationLevelToken:(NSString *)token
                             project:(NSString *)project
                          success:(void (^)(NSDictionary *resultDic))success
                             fail:(void (^)(NSString *description))fail;
/**
 * 获取KYC认证二级认证姓名，身份证，进度
 *int state = kycAttestationContent.getData().getState();//状态码 0未提交 1成功 2驳回 4审核中 onImg backImg
 *(WHETHER_KYC_CONTENT/token/project-4/blockToken-token)
 * @param token       token
 * @param project     4
 * @param blockToken  token
 */

-(void)getKycTwoAuthenticationLevelToken:(NSString *)token
                              project:(NSString *)project
                              blockToken:(NSString *)blockToken
                              success:(void (^)(NSDictionary *resultDic))success
                                 fail:(void (^)(NSString *description))fail;

/**
 * KYC二级认证 上传图片
 *(EGG_IDENTITY_CARD/token/blockToken/project-4/identityCard/userName/frontUrl/backUrl)
 * @param token        token
 * @param blockToken   token
 * @param project      4
 * @param identityCard identityCard
 * @param userName     userName
 * @param frontUrl     frontUrl
 * @param backUrl      backUrl
 */
-(void)KycAuthenticationLevelToken:(NSString *)token
                                token:(NSString *)blockToken
                              project:(NSString *)project
                         identityCard:(NSString *)identityCard
                             userName:(NSString *)userName
                             frontUrl:(NSString *)frontUrl
                              backUrl:(NSString *)backUrl
                              success:(void (^)(NSDictionary *resultDic))success
                                 fail:(void (^)(NSString *description))fail;

/**
 * 获取绑定邮箱和手机号
 *(GET_SAFETY_BY_ID/token/project-4)
 * @param token     token
 * @param project      4
 */
-(void)getBindEmailAndCellPhoneNumbersToken:(NSString *)token
                                    project:(NSString *)project
                                    success:(void (^)(NSDictionary *resultDic))success
                                       fail:(void (^)(NSString *description))fail;

/**
 * 是否设置资产密码
 *(WHETHER_FUN_PWD/token)
 * @param token     token
 */
-(void)whetherToSetTheAssetPasswordToken:(NSString *)token
                                 success:(void (^)(NSDictionary *resultDic))success
                                    fail:(void (^)(NSString *description))fail;

/**
 * 修改登录密码
 *(UPDATE_PWD2/token/oldPwd/newPwd)
 * @param token     token
 * @param oldPwd    oldPwd
 * @param newPwd    newPwd
 */
-(void)changeLoginPasswordToken:(NSString *)token
                         oldPwd:(NSString *)oldPwd
                         newPwd:(NSString *)newPwd
                        success:(void (^)(NSDictionary *resultDic))success
                           fail:(void (^)(NSString *description))fail;

/**
 * 设置资产密码获取验证码
 *(FUN_PWD_CODE/token)
 * @param token     token
 */
-(void)SetTheAssetPasswordToGetTheVerificationCodeToken:(NSString *)token
                                                success:(void (^)(NSDictionary *resultDic))success
                                                   fail:(void (^)(NSString *description))fail;

/**
 * 设置资产密码
 *(SAVE_FUND_PWD/token/code/newPwd/oldPwd/type-1)
 * @param token     token
 * @param code      code
 * @param newPwd    newPwd
 * @param oldPwd    oldPwd
 * @param type      0(无资产密码)/1(有资产密码)
 */
-(void)setAssetPasswordToken:(NSString *)token
                        code:(NSString *)code
                      oldPwd:(NSString *)oldPwd
                      newPwd:(NSString *)newPwd
                        type:(NSString *)type
                     success:(void (^)(NSDictionary *resultDic))success
                        fail:(void (^)(NSString *description))fail;

/**
 * 安全验证获取验证码
 *(UPDATE_PHONE_CODE/token/project-4)
 * @param token     token
 * @param project   project
 */
-(void)securityVerificationGetsTheVerificationCodeToken:(NSString *)token
                                                project:(NSString *)project
                                                success:(void (^)(NSDictionary *resultDic))success
                                                   fail:(void (^)(NSString *description))fail;

/**
 * 安全验证验证验证码
 *(UPDATE_CODE_CONFIRM/token/code/project-4)
 * @param token     token
 * @param code      code
 * @param project   project
 */
-(void)SecurityVerificationVerificationVerificationCodeToken:(NSString *)token
                                                        code:(NSString *)code
                                                     project:(NSString *)project
                                                    success:(void (^)(NSDictionary *resultDic))success
                                                       fail:(void (^)(NSString *description))fail;
/**
 * 绑定手机号获取验证码
 *(UPDATE_PHONE_CODE_NEW/token/phone/project)
 * @param token     token
 * @param phone     phone
 * @param project   project
 */
-(void)GetTheVerificationCodeByBindingThePhoneNumberToken:(NSString *)token
                                                  phone:(NSString *)phone
                                                project:(NSString *)project
                                                success:(void (^)(NSDictionary *resultDic))success
                                                   fail:(void (^)(NSString *description))fail;
/**
 * 绑定手机号
 *(UPDATE_PHONE/token/phone/code/project)
 * @param token     token
 * @param phone     phone
 * @param code     code
 * @param project   project
 */
-(void)BindMobilePhoneNumberToken:(NSString *)token
                            phone:(NSString *)phone
                             code:(NSString *)code
                          project:(NSString *)project
                          success:(void (^)(NSDictionary *resultDic))success
                             fail:(void (^)(NSString *description))fail;


/**
 * 绑定邮箱获取邮箱验证码
 *(UPDATE_EMAIL_CODE_NEW/token/email/project-4)
 * @param token     token
 * @param email     email
 * @param project   project
 */
-(void)BindEmailToGetEmailVerificationCodeToken:(NSString *)token
                                          email:(NSString *)email
                                        project:(NSString *)project
                                        success:(void (^)(NSDictionary *resultDic))success
                                           fail:(void (^)(NSString *description))fail;
/**
 * 绑定邮箱
 *(UPDATE_EMAIL/token/code/email/project-4)
 * @param token     token
 * @param code      code
 * @param email     email
 * @param project   project
 */
-(void)BindEmailToken:(NSString *)token
                 code:(NSString *)code
                email:(NSString *)email
              project:(NSString *)project
              success:(void (^)(NSDictionary *resultDic))success
                 fail:(void (^)(NSString *description))fail;

/**
 * 修改绑定邮箱获取原邮箱验证码
 *(UPDATE_EMAIL_CODE/token/project)
 * @param token     token
 * @param project   project
 */
-(void)modifyBindEmailToken:(NSString *)token
                    project:(NSString *)project
                    success:(void (^)(NSDictionary *resultDic))success
                       fail:(void (^)(NSString *description))fail;

/**
 * 验证原邮箱验证码
 *(UPDATE_EMAIL_CODE_CONFIRM/token/code/project-4)
 * @param token     token
 * @param code      code
 * @param project   project
 */
-(void)VerifyTheOriginalEmailVerificationCodeToken:(NSString *)token
                                              code:(NSString *)code
                                           project:(NSString *)project
                                           success:(void (^)(NSDictionary *resultDic))success
                                              fail:(void (^)(NSString *description))fail;

/**
 * 公告
 *(GET_Messagetoken可传可不传/page/row  1已读 0未查看)
 * @param token     token
 * @param page      page
 * @param row       row
 */
-(void)getMessageToken:(NSString *)token
                  page:(NSString *)page
                   row:(NSString *)row
               success:(void (^)(NSDictionary *resultDic))success
                  fail:(void (^)(NSString *description))fail;


/**
 * 获取本人常用地址列表
 *(GET_Address/token/page/row/type传0)
 * @param token     token
 * @param page      page
 * @param row        row
 * @param type        0
 */
-(void)getMyListOfCommonAddressesToken:(NSString *)token
                                  page:(NSString *)page
                                   row:(NSString *)row
                                  type:(NSString *)type
                               success:(void (^)(NSDictionary *resultDic))success
                                  fail:(void (^)(NSString *description))fail;
/**
 * 添加本人常用地址
 *(SAVE_Address/token/type传0/currency币种/address地址/remark备注)
 * @param token         token
 * @param currency      currency
 * @param address       address
 * @param remark        remark
 * @param type          0
 */
-(void)addMyUsualAddressToken:(NSString *)token
                     currency:(NSString *)currency
                      address:(NSString *)address
                       remark:(NSString *)remark
                  addressName:(NSString *)addressName
                         type:(NSString *)type
                      success:(void (^)(NSDictionary *resultDic))success
                         fail:(void (^)(NSString *description))fail;

/**
 * 删除本人常用地址
 *(DELETE_Address/token/id常用地址id)
 * @param token         token
 * @param idAddress     id
 */
-(void)deleteMyUsualAddressToken:(NSString *)token
                              id:(NSString *)idAddress
                         success:(void (^)(NSDictionary *resultDic))success
                            fail:(void (^)(NSString *description))fail;

/**
 * 修改本人常用地址
 *(UPDATE_Address/token/id常用地址id/currency币种/address地址/remark备注)
 * @param token         token
 * @param idAddress     id
 * @param currency      currency
 * @param address       address
 * @param remark        remark
 * @param type          0
 */
-(void)updateMyUsualAddressToken:(NSString *)token
                              id:(NSString *)idAddress
                        currency:(NSString *)currency
                         address:(NSString *)address
                          remark:(NSString *)remark
                     addressName:(NSString *)addressName
                            type:(NSString *)type
                         success:(void (^)(NSDictionary *resultDic))success
                            fail:(void (^)(NSString *description))fail;
/**
 * 查询他人地址
 *(SELECT_Address/blockId/page/row
 * @param blockId       blockId
 * @param page          page
 * @param row           row
 */
-(void)addresSenquiryBlockId:(NSString *)blockId
                      page:(NSString *)page
                       row:(NSString *)row
                   success:(void (^)(NSDictionary *resultDic))success
                      fail:(void (^)(NSString *description))fail;
/**
 * 币达钱包流水
 *(GET_BIDTWALLET/token
 * @param token        token
 * @param page         page
 * @param row          row
 */
-(void)walletRunsDownToken:(NSString *)token
                      page:(NSString *)page
                       row:(NSString *)row
                   project:(NSString *)project
                     success:(void (^)(NSDictionary *resultDic))success
                        fail:(void (^)(NSString *description))fail;
/**
 * 判断kyc跟密码/
 *(WHETHERKYCORFUNDPWD/token
 * @param token        token
 */
-(void)judgeKYCToken:(NSString *)token
             success:(void (^)(NSDictionary *resultDic))success
                fail:(void (^)(NSString *description))fail;
/**
 * 验证资金密码/
 *(VERIFYFUNDPWD/token/pwd
 * @param token        token
 * @param pwd          pwd
 */
-(void)VerifyFundPasswordToken:(NSString *)token
                           pwd:(NSString *)pwd
             success:(void (^)(NSDictionary *resultDic))success
                fail:(void (^)(NSString *description))fail;
/**
 * 币达提现/token/address地址/num金钱/remarks备注
 *(WITHDRAWDEPOSIT/token
 * @param token        token
 * @param address      address
 * @param num            num
 * @param remarks       remarks
 * @param blockId       blockId
 */
-(void)CurrencyOfWithdrawalToken:(NSString *)token
                         address:(NSString *)address
                             num:(NSString *)num
                         remarks:(NSString *)remarks
                              blockId:(NSString *)blockId
                         success:(void (^)(NSDictionary *resultDic))success
                            fail:(void (^)(NSString *description))fail;

/**
 * 交易详情/token/id
 *(GET_BIDTWALLETCONTENT
 * @param token        token
 * @param ID           id哪行
 */
-(void)TransactionDetailsToken:(NSString *)token
                            id:(NSString *)ID
                       success:(void (^)(NSDictionary *resultDic))success
                          fail:(void (^)(NSString *description))fail;



/**
 * 更新/
 *(MOBILEVERSIONNUMBER/appVersion-app版本号/type-ios/blockID
 * @param appVersion        appVersion
 * @param type              type
 * @param blockID           blockID
 */
-(void)updateAppVersion:(NSString *)appVersion
                   type:(NSString *)type
                blockID:(NSString *)blockID
             success:(void (^)(NSDictionary *resultDic))success
                fail:(void (^)(NSString *description))fail;

/**
 * 币管家首页币/token
 *(GET_HK_COUNT
 * @param token        token
 */
-(void)currencyHousekeeperToken:(NSString *)token
                        success:(void (^)(NSDictionary *resultDic))success
                           fail:(void (^)(NSString *description))fail;
/**
 * 币管家首页昨日币累积币/token
 *(GET_PR0FIT_BY_TOKEN
 * @param token        token
 */
-(void)currencyHousekeeperHomeTopToken:(NSString *)token
                           success:(void (^)(NSDictionary *resultDic))success
                              fail:(void (^)(NSString *description))fail;
/**
 * 币管家已投人数
 *(GET_HK_PEOPLENUM
 */
-(void)currencyHousekeeperPeopleUrlStr:(NSString *)urlStr
                               success:(void (^)(NSDictionary *resultDic))success
                                  fail:(void (^)(NSString *description))fail;

/**
 * 币管家首页/page/rows
 *(GET_HK_LIST
 * @param page        page
 * @param rows        rows
 */
-(void)currencyHousekeeperHomePage:(NSString *)page
                              rows:(NSString *)rows
                           success:(void (^)(NSDictionary *resultDic))success
                              fail:(void (^)(NSString *description))fail;
/**
 * 币管家项目详情/id
 *(GET_HK_BY_ID
 * @param id_ID        id
 */
-(void)currencyHousekeeperdDetailsID:(NSString *)id_ID
                               success:(void (^)(NSDictionary *resultDic))success
                                  fail:(void (^)(NSString *description))fail;
/**
 * //币管家投资接口/pid/num/type/address/token
 *(HKPAY
 * @param pid              项目id
 * @param num              投资数量
 * @param type             支付类型 1，币达支付 2，imtoken钱包支付
 * @param token            用户唯一标识
 * @param address           如果用户选择imtoken钱包支付  传用户输入的地址  ，如果是币达支付传空就行
 */
-(void)moneyManagerPnvestmentPid:(NSString *)pid
                             num:(NSString *)num
                            type:(NSString *)type
                           token:(NSString *)token
                          address:(NSString *)address
                         success:(void (^)(NSDictionary *resultDic))success
                            fail:(void (^)(NSString *description))fail;

/**
 * 币管家 投资记录
 *(GET_HK_PAYINFO
 * @param token            token
 * @param page             page
 * @param rows             rows
 */
-(void)moneyManagerInvestmentRecordToken:(NSString *)token
                                    page:(NSString *)page
                                    rows:(NSString *)rows
                                 success:(void (^)(NSDictionary *resultDic))success
                                    fail:(void (^)(NSString *description))fail;

/**
 * 币管家投资记录详情id=1
 *(GET_HK_PAYDETAILSBYID
 * @param id_ID        1
 */
-(void)moneyManagerInvestmentRecordDetailsID:(NSString *)id_ID
                             success:(void (^)(NSDictionary *resultDic))success
                                fail:(void (^)(NSString *description))fail;
/**
 * 币管家是否投资过/token
 *(GET_USER_PAYINFOSTATE
 * @param token        token
 */
-(void)moneyManagerHasInvestedToken:(NSString *)token
                                     success:(void (^)(NSDictionary *resultDic))success
                                        fail:(void (^)(NSString *description))fail;
/**
 * 币管家是否投资过项目/token
 *(GET_USER_PAYISTATE
 * @param token        token
 * @param pid         pid
 */
-(void)moneyManagerInvestedToken:(NSString *)token
                             pid:(NSString *)pid
                         success:(void (^)(NSDictionary *resultDic))success
                            fail:(void (^)(NSString *description))fail;
/**
 * 币管家其他钱包地址//id
 *(GET_CONTRACTADRESS
 * @param ID        id
 */
-(void)getContractAdressID:(NSString *)ID
                   success:(void (^)(NSDictionary *resultDic))success
                      fail:(void (^)(NSString *description))fail;

/**
 * 获取祝福语列表
 *(GET_LUCKBAGBLESSLIST
 */
-(void)getLuckbagBlessList:(void (^)(NSDictionary *resultDic))success
                      fail:(void (^)(NSString *description))fail;

/**
 * 发红包接口/type=1是随机发/bidtnum总金额/bagnum红包数量
 *(HANDLUCKBAG_type_1
 * @param type        1是随机发
 * @param bidtnum     总金额
 * @param bagnum      红包数量
 * @param lbid        祝福语列表里面对应的id
 * @param token        token
 */
-(void)handLuckBagTypeOne:(NSString *)type
               bidtnum:(NSString *)bidtnum
                bagnum:(NSString *)bagnum
                  lbid:(NSString *)lbid
                 token:(NSString *)token
               success:(void (^)(NSDictionary *resultDic))success
                  fail:(void (^)(NSString *description))fail;


/**
 * 发红包接口固定金额/type=2把bidtnum换成money/money每个红包的金额（固定金额）/token
 *(HANDLUCKBAG_type_2
 * @param type        2是固定金额
 * @param money       总金额
 * @param bagnum      红包数量
 * @param lbid        祝福语列表里面对应的id
 * @param token        token
 */
-(void)handLuckBagTypeTwo:(NSString *)type
                 money:(NSString *)money
                bagnum:(NSString *)bagnum
                  lbid:(NSString *)lbid
                 token:(NSString *)token
               success:(void (^)(NSDictionary *resultDic))success
                  fail:(void (^)(NSString *description))fail;

/**
 * 收到红包记录/token/page/rows
 *(GET_ACCEPLUCKBAGHISTORY
 * @param rows      rows
 * @param page        page
 * @param token        token
 */
-(void)getaccepLuckBagHistoryToken:(NSString *)token
                       page:(NSString *)page
                       rows:(NSString *)rows
                    success:(void (^)(NSDictionary *resultDic))success
                       fail:(void (^)(NSString *description))fail;
/**
 * 收到红包记录/token/page/rows
 *(GET_SENDLUCKBAGHISTORY
 * @param rows      rows
 * @param page        page
 * @param token        token
 */
-(void)getsendLuckBagHistoryToken:(NSString *)token
                              page:(NSString *)page
                              rows:(NSString *)rows
                           success:(void (^)(NSDictionary *resultDic))success
                              fail:(void (^)(NSString *description))fail;
/**
 * 红包记录详情/id/token
 *(GET_LUCKBAGINFO
 * @param id_id          id
 * @param token        token
 */
-(void)getLuckBagInfoToken:(NSString *)token
                        id:(NSString *)id_id
                   success:(void (^)(NSDictionary *resultDic))success
                      fail:(void (^)(NSString *description))fail;

/**
 * 是否开启蛋生游戏0关闭1开启
 *(EGGCONTROL
 */
-(void)eggcontrolSuccess:(void (^)(NSDictionary *resultDic))success
                      fail:(void (^)(NSString *description))fail;

/**
 * 全民竞猜banner轮播/bid是投注项目对应的id/bannerUrl是连接
 *(GET_BETBANNER
 */
-(void)getBetBannerSuccess:(void (^)(NSDictionary *resultDic))success
                      fail:(void (^)(NSString *description))fail;

/**
 * 全民竞猜下注接口/oid=8(选相对应id)&betnum=10(注数)&token
 *(BET
 * @param oid          选相对应id
 * @param betnum        注数
 * @param token        token
 */
-(void)betToken:(NSString *)token
            oid:(NSString *)oid
         betnum:(NSString *)betnum
        success:(void (^)(NSDictionary *resultDic))success
           fail:(void (^)(NSString *description))fail;

/**
 * 全民竞猜数据  type=2&page=1&rows=10-----optionType1是两个选项 2是2个以上/status0竞猜进行中1是结果结算中2已结束
 *(GET_BETLIST
 * @param type          type
 * @param page        page
 * @param rows        rows
 */
-(void)betType:(NSString *)type
          rows:(NSString *)rows
          page:(NSString *)page
       success:(void (^)(NSDictionary *resultDic))success
          fail:(void (^)(NSString *description))fail;

/**
 * 选择币种 type=2
 *(GET_COINLIST
 * @param type          type
 */
-(void)getCoinListType:(NSString *)type
               success:(void (^)(NSDictionary *resultDic))success
                  fail:(void (^)(NSString *description))fail;
/**
 * 充值cid=1/bidtnum/token
 *(CHARGE
 * @param cid            cid
 * @param bidtnum        bidtnum
 * @param token          token
 */
-(void)chargeCid:(NSString *)cid
         bidtnum:(NSString *)bidtnum
           token:(NSString *)token
         success:(void (^)(NSDictionary *resultDic))success
            fail:(void (^)(NSString *description))fail;
/**
 * 充币记录token
 *(GET_CHARGEHISTORY
 * @param token          token
 */
-(void)getChargeHistoryToken:(NSString *)token
         success:(void (^)(NSDictionary *resultDic))success
            fail:(void (^)(NSString *description))fail;
/**
 * 充币详情id
 *(CHARGEINfO
 * @param ID          ID
 */
-(void)chargeInfoID:(NSString *)ID
                     success:(void (^)(NSDictionary *resultDic))success
                        fail:(void (^)(NSString *description))fail;
/**
 * 判断是否绑定地址/token/cid=1
 *(CHECKCHARGESTATE
 * @param cid          cid
 */
-(void)checkChargeStateCid:(NSString *)cid
                     token:(NSString *)token
                   success:(void (^)(NSDictionary *resultDic))success
                      fail:(void (^)(NSString *description))fail;
/**
 * 获取充币地址/token/cid=1/type=1
 *(GET_CHARGEINfO
 * @param cid          cid
 * @param type          type
 * @param token          token
 */
-(void)getCoinInfoCid:(NSString *)cid
                     type:(NSString *)type
                     token:(NSString *)token
                   success:(void (^)(NSDictionary *resultDic))success
                      fail:(void (^)(NSString *description))fail;
/**
 * 修改地址/id//address
 *(UPDATEADDRESS
 * @param address          address
 * @param ID          ID
 */
-(void)updateAddress:(NSString *)address
                 ID:(NSString *)ID
              success:(void (^)(NSDictionary *resultDic))success
                 fail:(void (^)(NSString *description))fail;
/**
 * 绑定地址/cid/address/token
 *(BINDINGADDRESS
 * @param address          address
 * @param cid            cid
 * @param token          token
 */
-(void)bindingAddress:(NSString *)address
                  cid:(NSString *)cid
                 token:(NSString *)token
             success:(void (^)(NSDictionary *resultDic))success
                fail:(void (^)(NSString *description))fail;

/*
 * 加载启动页
 */
- (void)getstartPageSuccess:(void (^)(NSDictionary *resultDic))success
                       fail:(void (^)(NSString *description))fail;


+ (AFHTTPSessionManager *)shareSessionManager;



@end

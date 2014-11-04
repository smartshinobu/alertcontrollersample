//
//  ViewController.m
//  alertcontroller
//
//  Created by ビザンコムマック０７ on 2014/10/25.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//1つ目のアラートを表示というボタンを押したら呼ばれるメソッド
- (IBAction)alertshow:(id)sender {
    //UIAlertControllerという名前のクラスを取得する
    Class class = NSClassFromString(@"UIAlertController");
    //クラスUIAlertControllerが存在するかどうか
    if (class) {
        NSLog(@"クラスUIAlertControllerが存在する");
        //クラスUIAlertControllerを用いてアラートの変数を生成
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"警告です" preferredStyle:UIAlertControllerStyleAlert];
        //キャンセルというタイトルのボタンを追加
        //このボタンが押されたときメソッドcanselを実行するようにする
        [alert addAction:[UIAlertAction actionWithTitle:@"キャンセル" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self cansel];
        }]];
        //OKというタイトルのボタンを追加
        //このボタンが押されたときメソッドOKを実行するようにする
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self OK];
        }]];
        //アラート表示
        [self presentViewController:alert animated:YES completion:nil];
    }
    //存在しない場合の処理
    else{
        NSLog(@"クラスUIAlertControllerが存在しない");
        //クラスUIAlertViewを用いてアラートの変数を生成
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"警告です" delegate:self cancelButtonTitle:@"キャンセル" otherButtonTitles:@"OK", nil];
        //タグ付けする
        alert.tag = 1;
        //アラート表示
        [alert show];
    }
    /*
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"警告です" delegate:self cancelButtonTitle:@"キャンセル" otherButtonTitles:@"OK", nil];
    alert.tag = 1;
    [alert show];
     */
}

//2つ目のアラートを表示というボタンを押したら呼ばれるメソッド
- (IBAction)alertshow2:(id)sender {
    //UIAlertControllerという名前のクラスを取得する
    Class class = NSClassFromString(@"UIAlertController");
    //クラスUIAlertControllerが存在するかどうか
    if (class) {
        NSLog(@"クラスUIAlertControllerが存在する");
        //クラスUIAlertControllerを用いてアラートの変数を生成
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"選択" message:@"どちらか選択してください" preferredStyle:UIAlertControllerStyleAlert];
        //いいえというタイトルのボタンを追加
        //このボタンが押されたときメソッドiieを実行するようにする
        [alert addAction:[UIAlertAction actionWithTitle:@"いいえ" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self iie];
        }]];
        //はいというタイトルのボタンを追加
        //このボタンが押されたときメソッドhaiを実行するようにする
        [alert addAction:[UIAlertAction actionWithTitle:@"はい" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self hai];
        }]];
        //アラート表示
        [self presentViewController:alert animated:YES completion:nil];
    }
    //存在しない場合の処理
    else{
        NSLog(@"クラスUIAlertControllerが存在しない");
        //クラスUIAlertViewを用いてアラートの変数を生成
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"選択" message:@"どちらか選択してください" delegate:self cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
        //タグ付けする
        alert.tag = 2;
        //アラート表示
        [alert show];
    }
    /*
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"選択" message:@"どちらか選択してください" delegate:self cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
    alert.tag = 2;
    [alert show];
     */
}

-(void)OK{
    self.label.text = @"OKボタン押した";
}

-(void)cansel{
    self.label.text = @"キャンセルボタンを押した";
}

-(void)hai{
    self.label.text = @"はいボタン押した";
}

-(void)iie{
    self.label.text = @"いいえボタンを押した";
}


//アラートのボタンを押したら呼ばれるメソッド
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //ボタンを押したアラートのタグが1であるかどうか
    if (alertView.tag == 1) {
        //押したボタンが1番目(タイトルが0Kのボタン)であるかどうか
        if (buttonIndex == 1) {
            //メソッドOKを実行
            [self OK];
        }
        //押したボタンが0番目(タイトルがキャンセルのボタン)の場合の処理
        else{
            //メソッドcanselを実行
            [self cansel];
        }
    }
    //ボタンを押したアラートのタグが2であるかどうか
    else if(alertView.tag == 2){
        //押したボタンが1番目(タイトルがはいのボタン)であるかどうか
        if (buttonIndex == 1) {
            //メソッドhaiを実行
            [self hai];
        }
        //押したボタンが0番目(タイトルがいいえのボタン)の場合の処理
        else{
            //メソッドiieを実行
            [self iie];
        }

    }
}
@end


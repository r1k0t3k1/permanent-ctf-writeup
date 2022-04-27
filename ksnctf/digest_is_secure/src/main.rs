use reqwest::header::WWW_AUTHENTICATE;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let username = "q9";
    let realm = "secret";
    let algorithm = "MD5";
    let uri = "/q9/flag.html";
    let qop = "auth";
    let nc = "00000002";
    let cnonce = "656335d78cef6e86";
    let md5_a1 = "c627e19450db746b739f41b64097d449";
    let a2 = "GET:/q9/flag.html";

    let client = reqwest::Client::new();
    let url = "http://ctfq.u1tramarine.blue/q9/flag.html";

    let res = client.get(url).send().await?;
    let header = &res
        .headers()
        .get(WWW_AUTHENTICATE)
        .expect("none authenticate");
    let auth: Vec<&str> = header.to_str().unwrap().split(",").collect();
    let nonce = &auth[1][8..&auth[1].len() - 1];

    // responseを作成
    let md5_a2 = md5::compute(a2);
    let plain_response = format!(
        "{}:{}:{}:{}:{}:{:x}",
        md5_a1, nonce, nc, cnonce, qop, md5_a2
    );
    let response = format!("{:x}", md5::compute(&plain_response));
    let auth_header = format!{"Digest username=\"{}\", realm=\"{}\", nonce=\"{}\",uri=\"{}\", algorithm={}, response=\"{}\", qop={}, nc={}, cnonce=\"{}\"",
                                username,
                                realm,
                                nonce,
                                uri,
                                algorithm,
                                response,
                                qop,
                                nc,
                                cnonce
                            };
    let res = client.get(url).header(reqwest::header::AUTHORIZATION, auth_header).send().await?;
    let body = res.text().await?;
    println!("{:?}",body);
    Ok(())
}

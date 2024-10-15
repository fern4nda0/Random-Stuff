use tokio_tungstenite::connect_async;
use url::Url;
use futures::{ StreamExt };

#[tokio::main]
async fn main() {
    let binance_ws_url = "wss://stream.binance.com:9443/ws/btcusdt@trade";
    let url = Url::parse(binance_ws_url).unwrap();
    let (ws_stream, _) = connect_async(url.to_string()).await.expect("Failed to connect");
    println!("Connected to Binance WebSocket");

    let (_, mut read) = ws_stream.split();

    while let Some(message) = read.next().await {
        match message {
            Ok(msg) => {
                if msg.is_text() {
                    println!("Received: {}", msg.to_text().unwrap());
                }
            }
            Err(e) => {
                eprintln!("Error: {}", e);
                break;
            }
        }
    }
}

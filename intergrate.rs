fn main() {
    let mut res: f64 = 0.0;
    let dx: f64 = 0.0000001;   
    let mut x: f64 = 0.0;

    while x <= 1.0 {
        res += dx * ((3.0 * x.powi(3) - x.powi(2) + 2.0 * x - 4.0) / ((x.powi(2) - 3.0 * x + 2.0).sqrt()));
        x += dx;
    }

    println!("{:?}", res);
}

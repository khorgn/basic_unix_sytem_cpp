fn main() {
    // instanciate an empty immutable vector of i32
    let v: Vec<i32> = Vec::new();

    // use macro to fill vector
    // no need to annotate here, rust guess the type from the values
    let v = vec![1, 2, 3];

    // no need to annotate here, rust guess the type from the next pushes
    let mut v = Vec::new();
    v.push(5);
    v.push(6);

    //===== access elements =====//
    let v = vec![1, 2, 3, 4, 5];
    let third: &i32 = &v[2]; // panic! if out of bounds
    match v.get(2) // returns None if out of bounds
    {
        Some(third) => (),
        None => (),
    }

    //===== a vector owns it's data =====//
    let mut v = vec![1, 2, 3, 4, 5];
    let first = &v[0];
    // v.push(6);
    // won't compile because there is already an immutable reference borrowed
    
    //===== iteration =====//
    let mut v = vec![100, 32, 57];
    for i in &mut v // i is &mut Vec
    {
        *i += 50; // needs to dereference to modify the value directly
    }

    //===== mutliple types stored =====//
    enum SpreadSheetCell
    {
        Int(i32),
        Float(f64),
        Text(String),
    }
    let row = vec!
        [
        SpreadSheetCell::Int(3),
        SpreadSheetCell::Text("blue".to_owned()),
        SpreadSheetCell::Float(10.12),
        ];

}

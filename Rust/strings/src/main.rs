fn main() {
    // strings are UTF-8 encoded
    // they are an array of bytes, and a character can be made of more than one byte
    let s1: String = "data".to_string();
    let s2: String = String::from("你好");


    let mut s3 = format!("{} {}", s1, s2);

    s3.push_str(" aaa");
    s3.push('l');

    //========== indexing into string ==========//
    // s3[0]
    // doesn't work, needs to precise if user wants:
    //    bytes (actual content stored)
    //    scalar values (`char`)
    //    grapheme clusters (human characters)

    let s = &s3[0..4]; // clearly tells it it's a string slice. the program will panic! if the slice is not valid unicode characters

    let s: String = String::from("你好");
    println!("你好 is of length {}", s.len()); // each char is 3 bytes
    print!("你好 in bytes: ");
    for c in "你好".bytes()
    {
        print!("{}, ", c);
    }
    print!("\n");
    print!("你好 in chars: ");
    for c in "你好".chars()
    {
        print!("{}, ", c);
    }
    print!("\n");

    print!("नमस्ते in chars: ");
/*
न
म
स
्
त
े
*/
    for c in "नमस्ते".chars()
    {
        print!("{}, ", c);
    }
    print!("\n");


    //=== handle grapheme clusters ===//
    use unicode_segmentation::UnicodeSegmentation;
    let g = UnicodeSegmentation::graphemes("नमस्ते", true).collect::<Vec<&str>>();
    println!("{:?}", g);
    for c in &g
    {
        print!("{}, ", c);
    }

}

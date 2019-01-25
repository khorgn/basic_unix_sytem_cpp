fn main() {
    // HashMap is not as often used as Vec and String, so it's not in the prelude
    use std::collections::HashMap;

    let mut scores = HashMap::new();
    scores.insert(String::from("Blue"), 10);
    scores.insert(String::from("Yellow"), 50);


    let teams = vec![String::from("Blue"), String::from("Yellow")];
    let initial_scores = vec![10, 50];

    let scores: HashMap<_, _> = teams.iter().zip(initial_scores.iter()).collect();
    // needs to specify HashMap<_, _> because collect can be done into different data structures
    // create a vector of tuples, then collect it into a hashmap


    //===== HashMap ownership =====//
    // hashmaps own their values
    let field_name = "Favorite color".to_owned();
    let field_value = "Blue".to_owned();
    let mut map = HashMap::new();
    map.insert(field_name, field_value);
    // field_name and field_value are invalid now
    
    
    //===== Accessing values =====//
    let mut scores = HashMap::new();
    scores.insert(String::from("Blue"), 10);
    scores.insert(String::from("Yellow"), 50);

    let team_name = String::from("Blue");
    let score: Option<_> = scores.get(&team_name);

    //===== Iterate over HashMap =====//
    for (key, value) in &scores
    {
        println!("{}: {}", key, value);
    }


    //===== Insertions =====//
    //=== Overwriting a value ===//
    scores.insert(String::from("Blue"), 10);
    scores.insert(String::from("Blue"), 50);

    //=== Only inserting a value if the key has no value ===//
    // entry() return an enum Entry, or_insert return &mut if the entry exists, or inserts it
    scores.entry(String::from("Green")).or_insert(10);
    scores.entry(String::from("Blue")).or_insert(10);
    
    //=== Updating a value based on the old value ===//
    let text = "hello world wonderful world";
    let mut map = HashMap::new();

    for word in text.split_whitespace() // split the &str by whitespace
    {
        // for each word, return a &mut of the entry if the word already exists in the hashmap,
        // else create it with a count of 0
        let count = map.entry(word).or_insert(0);
        *count += 1;
    }
}

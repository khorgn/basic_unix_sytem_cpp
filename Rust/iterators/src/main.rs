fn main() {
    
    //=== for ===//
    let v1 = vec![1, 2, 3];
    let v1_iter = v1.iter(); // doesn't need to be mutable because for takes ownership of the iterator

    for val in v1_iter {
        println!("Got: {}", val);
    }

    //=== next ===//
    let v1 = vec![1, 2, 3];
    let mut v1_iter = v1.iter(); // needs to be mutable because next takes a mutable reference
    assert_eq!(v1_iter.next(), Some(&1));
    assert_eq!(v1_iter.next(), Some(&2));
    assert_eq!(v1_iter.next(), Some(&3));
    assert_eq!(v1_iter.next(), None);

}

// Representation of the Iterator trait
trait StdIterator {
    type Item;
    fn next(&mut self) -> Option<Self::Item>;
    // ...
}

//=== consume iterator ===//
fn iterator_sum() {
    let v1 = vec![1, 2, 3];
    let v1_iter = v1.iter(); // v1 borrowed

    let total: i32 = v1_iter.sum(); // v1_iter consumed
    assert_eq!(total, 6);
}

//=== produce iterator (iterator adaptors) ===//
//= map =//
fn iterator_map() {
    let v1: Vec<i32> = vec![1, 2, 3];
    v1.iter().map( |x| x +1); // do nothing until used, so this doesn't actually do anything
    // iterator adapters are lazy
    

    let v1: Vec<i32> = vec![1, 2, 3];
    let v2: Vec<_> = v1.iter().map(|x| x + 1).collect();

    assert_eq!(v2, vec![2, 3, 4]);
}

//= filter =//
#[derive(PartialEq, Debug)]
struct Shoe {
    size: u32,
    style: String,
}

fn shoes_in_my_size(shoes: Vec<Shoe>, shoe_size: u32) -> Vec<Shoe> {
    shoes.into_iter() // takes ownership of data
        .filter(|s| s.size == shoe_size) // uses closures env capture
        .collect()
}


//=== Custom Iterators ===//
// The only method that must be implemented is next(), all the associated methods (filter, map,
// ...) use it (with potentially more traits, like sum)
// all others methods have default implementations depending on it
struct Counter {
    count: u32,
}

impl Counter {
    fn new() -> Counter {
        Counter { count: 0, }
    }
}

impl Iterator for Counter {
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item> {
        self.count += 1;
        if self.count < 6 {
            Some(self.count)
        } else {
            None
        }
    }
}

// Notes, using iterators is as performant as manual implementation (or better if the
// implementation is bad)
fn using_counter() {
    let mut  counter = Counter::new();

    assert_eq!(counter.next(), Some(1));
    assert_eq!(counter.next(), Some(2));
    assert_eq!(counter.next(), Some(3));
    assert_eq!(counter.next(), Some(4));
    assert_eq!(counter.next(), Some(5));
    assert_eq!(counter.next(), None);


    let sum: u32 = Counter::new()
        .zip(Counter::new() // creates a new iterator countaining a tuple with the first elements, then another tuple and so on
             .skip(1)) // returns an iterator skipping of the first element
        // zip returns None if one of the elements of the tupple is None, so this one stops at (4,
        // 5) rather than (5, None)
        .map( |(a, b)| a*b) // returns a new iterator after modifying each instance of it
        .filter(|x| x % 3 == 0) // return a new iterator only containing elements returning true
        .sum(); // return a sum of the elements of the iterator

    // Notes: because the iterator adapters are lazy, they don't do unecessary iterative cycles and wait
    // to be necessary. The zip, map, filter, and sum are all done in one cycle, not one for each
    // like we could think
    assert_eq!(18, sum);
}

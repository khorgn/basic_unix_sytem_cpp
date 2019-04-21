use std::thread;
use std::time::Duration;
use std::collections::HashMap;
use std::collections::hash_map::Entry::{Vacant, Occupied};
use std::fmt::Debug;

fn main() {
    let simulated_user_specified_value = 10;
    let simulated_random_number = 7;

    generate_workout(
        simulated_user_specified_value,
        simulated_random_number,
    );

    //=== Equivalencies between functions and closures
    /*
    fn add_one_v1 (x: u32) -> u32 { x + 1 }
    let add_one_v2 = |x: u32| -> u32 { x + 1 };
    let add_one_v3 = |x| { x + 1 };
    let add_one_v4 = |x| x + 1 ;
    */
}

fn generate_workout(intensity: u32, random_number: u32) {

    // defines a closure
    // it contains the definition of an anonymous function
//    let expensive_closure = |num| {
//        println!("calculating slowly...");
//        thread::sleep(Duration::from_secs(2));
//        num
//    };
    let mut expensive_result = Cacher::new( |&num| {
        println!("calculating slowly...");
        thread::sleep(Duration::from_secs(2));
        num
    });

    if intensity < 25 {
        println!("Today do {} pushups!", expensive_result.value(&intensity));
        println!("Next do {} situps!", expensive_result.value(&intensity));
    } else {
        if random_number == 3 {
            println!("Take a break today! Remember to stay hydrated!");
        } else {
            println!("Today, run for {} minutes!", expensive_result.value(&intensity));
        }
    }
}

fn simulated_expensive_calculation(intensity: u32) -> u32 {
    println!("calculating slowly...");
    thread::sleep(Duration::from_secs(2));
    
    intensity
}

//===== Implement a Cacher to save the result of the closure =====//
struct Cacher<C, I, O> where C: Fn(&I) -> O, I: std::cmp::Eq + std::hash::Hash + std::clone::Clone + Debug, O: Debug {
    calculation: C,
    values: HashMap<I, O>,
}

impl<C, I, O> Cacher<C, I, O> where C: Fn(&I) -> O, I: std::cmp::Eq + std::hash::Hash + std::clone::Clone + Debug, O: Debug {
    fn new(calculation: C) -> Cacher<C, I, O> {
        Cacher {
            calculation,
            values : HashMap::new(),
        }
    }

    fn value(&mut self, arg: I) -> &O {
        // we want to insert the value if it doesn't exists, so we use
        // entry(VacantEntry|OccupiedEntry)
        // rather than get(Some|None)

        let closure = &self.calculation; // Rust can't distinguish the fields borrowed in a closure, so in `or_insert_with` all self is borrowed, instead of just calculation. The solution is to first borrow calculation, when Rust can't differanciate it
        self.values.entry(arg.clone()).or_insert_with(|| closure(&arg))
        
//        match self.values.entry(arg.clone()) {
//            Occupied(entry) => entry.into_mut(),
//            Vacant(entry) => {
//                let res = (self.calculation)(&arg);
//                entry.insert(res)
//            }
//        }
    }
}

//========== capturing the environment ==========//
// There are three traits representing the different ways a closure can capture its environment.
// FnOnce: it captures it once => it takes ownership of the environment captured (T)
// FnMut: it takes a mutable reference of the environment captured (&mut T)
// Fn: it takes a reference of the environment captured (&T)
fn capturing_immutable_references() {
    let x = 4;
    let equal_to_x = |z| z == x;
    let y = 4;

    assert!(equal_to_x(y));
}
fn taking_ownership() {
    let x = vec![1, 2, 3];
    let equal_to_x = move |z| z == x;
    let y = vec![1, 2, 3];
    // println!("can't execute this statement because {} has been moved", x);
    assert!(equal_to_x(y));
}

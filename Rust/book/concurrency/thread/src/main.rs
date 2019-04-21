use std::thread;
use std::time::Duration;

fn main() {
    println!("==========");
    spawn_thread();
    println!("==========");
    join_thread();
    println!("==========");
    move_closure();
}

fn spawn_thread() {
    // spawn a thread running the closure
    println!("spawn a thread for 10 ite");
    println!("main thread for 5 ite");
    thread::spawn(|| {
        for i in 1..10 {
            println!("hi number {} from the spawned thread!", i);
            thread::sleep(Duration::from_millis(1));
        }
    });

    for i in 1..5 {
        println!("hi number {} from the main thread!", i);
        thread::sleep(Duration::from_millis(1));
    }
}

fn join_thread() {
    println!("spawn a thread for 10 ite");
    println!("main thread for 5 ite");
    let handle = thread::spawn(|| {
        for i in 1..10 {
            println!("hi number {} from the spawned thread!", i);
            thread::sleep(Duration::from_millis(1));
        }
    });

    for i in 1..5 {
        println!("hi number {} from the main thread!", i);
        thread::sleep(Duration::from_millis(1));
    }

    // join() will return a Result, Ok if the thread has been joined correctly, Err if the child
    // panicked
    handle.join().unwrap();
}

fn move_closure() {
    let v = vec![1, 2, 3];
    // we need to move the data captured when using threads
    let handle = thread::spawn(move || {
        println!("Here's a vector: {:?}", v);
    });

    handle.join().unwrap();
}

use std::sync::Mutex;
use std::thread;
use std::sync::Arc;

fn main() {
    println!("==========");
    basic_mutex();
    println!("==========");
    mutex_in_threads();
}

fn basic_mutex() {
    let m = Mutex::new(5);

    {
        // lock returns a Return, and the resulting ref mut will free the lock when it goes out of
        // scope
        // It fails if the thread holding the lock panicked
        // The object returned is a smart pointer, a MutexGuard
        let mut num = m.lock().unwrap();
        *num = 6;
    }

    println!("m = {:?}", m);
}

// Mutex, like RefCell, provide interior mutability
fn mutex_in_threads() {
    let counter = Arc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..10 {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move|| {
            let mut num = counter.lock().unwrap();

            *num += 1;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Result: {}", *counter.lock().unwrap());
}

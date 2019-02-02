// Multiple Producers Single Consumer
use std::thread;
use std::sync::mpsc;
use std::time::Duration;

fn main() {
    println!("==========");
    basic_channel();
    println!("==========");
    long_channel();
    println!("==========");
    multiple_producers();
}

fn basic_channel() {
    // (transmitter, receiver)
    let (tx, rx) = mpsc::channel();

    thread::spawn(move|| {
        let val = String::from("hi");
        tx.send(val).unwrap();
        // send move the value, so it can't be used later
        // println!("val is {}", val);
    });

    let received =rx.recv().unwrap();
    println!("Got: {}", received);
}

fn long_channel() {
    // (transmitter, receiver)
    let (tx, rx) = mpsc::channel();

    thread::spawn(move|| {
        let vals = vec![
            String::from("hi"),
            String::from("from"),
            String::from("the"),
            String::from("dead"),
        ];

        for val in vals {
            tx.send(val).unwrap();
            thread::sleep(Duration::from_secs(1));
        }
    });

    // if rx is treated as in iterator, next will return a Option
    for received in rx {
        println!("Got: {}", received);
    }
}

fn multiple_producers() {
    let (tx, rx) = mpsc::channel();

    // clones the transmitter so it can be used in multiple thread for the same receiver
    let tx1 = mpsc::Sender::clone(&tx);
    thread::spawn(move|| {
        let vals = vec![
            String::from("hi"),
            String::from("from"),
            String::from("the"),
            String::from("dead"),
        ];

        for val in vals {
            tx1.send(val).unwrap();
            thread::sleep(Duration::from_secs(1));
        }
    });

    thread::spawn(move|| {
        let vals = vec![
            String::from("more"),
            String::from("messages"),
            String::from("for"),
            String::from("you"),
        ];

        for val in vals {
            tx.send(val).unwrap();
            thread::sleep(Duration::from_secs(1));
        }
    });

    for received in rx {
        println!("Got: {}", received);
    }
}

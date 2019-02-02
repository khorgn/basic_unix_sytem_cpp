// RefCells allow interior mutability. At compilation time the Ownership rules are conservatives
// and prevent it
// It also allows mutliple owners of mutable data through use of Rc

//========== Interior mutability ==========//
pub trait Messenger {
    fn send(&self, msg: &str);
}

pub struct LimitTracker<'a, T: 'a + Messenger> {
    messenger: &'a T,
    value: usize,
    max: usize,
}

impl<'a, T> LimitTracker<'a, T> where T: Messenger {
    pub fn new(messenger: &T, max: usize) -> LimitTracker<T> {
        LimitTracker {
            messenger,
            value: 0,
            max,
        }
    }

    pub fn set_value(&mut self, value: usize) {
        self.value = value;

        let percentage_of_max = self.value as f64 / self.max as f64;

        if percentage_of_max >= 1.0 {
            self.messenger.send("Error: You are over your quota!");
        } else if percentage_of_max >= 0.9 {
            self.messenger.send("Urgent Warning: You've used up over 90% of your quota!");
        } else if percentage_of_max >= 0.75 {
            self.messenger.send("Warning: You've used up over 75% of your quota!");
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::cell::RefCell;

    struct MockMessenger {
        // needs to be a refcell so we can modify Vec<String>
        sent_messages: RefCell<Vec<String>>,
    }

    impl MockMessenger {
        fn new() -> MockMessenger {
            MockMessenger { sent_messages: RefCell::new(vec![]) }
        }
    }

    impl Messenger for MockMessenger {
        fn send(&self, message: &str) {
            // borrow it as a RefMut (mutable at runtime). It still follow borrow rules, only one
            // RefMut or multiple Ref at a time
            self.sent_messages.borrow_mut().push(String::from(message));
        }
    }

    #[test]
    fn it_sends_over_75_percent_warning_message() {
        let mock_messenger = MockMessenger::new();
        let mut limit_tracker = LimitTracker::new(&mock_messenger, 100);

        limit_tracker.set_value(80);
        
        assert_eq!(mock_messenger.sent_messages.borrow().len(), 1);
    }

}


//========== mutliple owners of mutable data ==========//
// Use Rc<RefCell<T>>
// RefCell allows to borrow T while still being immutable
// Rc allows RefCell to be owned by multiple variables
#[derive(Debug)]
enum List {
    // we modified the List in ref_count to allow the owners to change the value
    Cons(Rc<RefCell<i32>>, Rc<List>),
    Nil,
}

use List::{Cons, Nil};
use std::rc::Rc;
use std::cell::RefCell;

pub fn share_list_and_mutate_value() {
    // the data to be stored in the list
    // we create the value to be able to access it directly
    let value = Rc::new(RefCell::new(5));
    // the list that will be shared
    let a = Rc::new(Cons(Rc::clone(&value), Rc::new(Nil)));
    
    let b = Cons(Rc::new(RefCell::new(6)), Rc::clone(&a));
    let c = Cons(Rc::new(RefCell::new(10)), Rc::clone(&a));
    println!("a before = {:?}", a);
    println!("b before = {:?}", b);
    println!("c before = {:?}", c);

    *value.borrow_mut() += 10;

    println!("a after = {:?}", a);
    println!("b after = {:?}", b);
    println!("c after = {:?}", c);
}

// similar: Cell<T>, it copies the value instead of giving a reference

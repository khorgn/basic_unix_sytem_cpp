#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        // you can add optional args to assert macros, which are passed to format! when panicking
        assert_eq!(2 + 2, 4);
    }
//    #[test]
//    fn it_doesnt_work() {
//        panic!("Makes this test fail");
//    }

    use super::*; // else needs crate::Rectangle
    #[test]
    fn larger_can_hold_smaller() {
        let larger = Rectangle { length: 8, width: 7, };
        let smaller = Rectangle { length: 5, width: 1, };

        assert!(larger.can_hold(&smaller));
    }

    // assert_eq and assert_ne needs their args to implement PartialEq and Debug
    #[test]
    fn it_adds_two() {
        assert_eq!(4, add_two(2));
    }
    #[test]
    fn it_doesnt_add_three() {
        assert_ne!(5, add_two(2), "It should add two, instead it added {}", 5-2);
    }


    #[test]
    #[should_panic]
    fn should_panic_correcty() {
        panic!("Perfect");
    }
    #[test]
    #[should_panic(expected = "Exact error message")]
    fn should_panic_exactly() {
        panic!("Exact error message, with possible additions");
    }

    #[test]
    fn test_with_result() -> Result<(), String>
    {
        if 2 + 2 == 4 {
            Ok(())
        } else {
            Err(String::from("2 + 2 != 4"))
        }
    }
}


// These traits are derivable, and in our case their implementation is simple,
// so we let the compiler automatically implement these traits
#[derive(Debug, PartialEq)]
pub struct Rectangle { length: u32, width: u32, }

impl Rectangle {
    pub fn can_hold(&self, other: &Rectangle) -> bool {
        self.length > other.length && self.width > other.width
    }
}

pub fn add_two(a: i32) -> i32 {
    a + 2
}

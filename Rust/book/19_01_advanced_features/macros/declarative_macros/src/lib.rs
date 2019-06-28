//========== Declaratives Macros ==========//
// declared manually and add code, like println! or vec!

// the annotation is necessary to make the macro available whenever this crate is brought into
// scope
//
// if the code is in the form expr, expr, ...
// it will match this arm
// the part in the arm ($(\n)) will loop as many submatches (3 in the call)

#[macro_export]
macro_rules! vec2 {
    ( $( $x:expr ),* ) => {
        {
            let mut temp_vec = Vec::new();
            $(
                temp_vec.push($x);
            )*
            temp_vec
        }
    };
}

pub fn use_vec2() {
    let temp_vec = vec2![1, 2, 3];
}


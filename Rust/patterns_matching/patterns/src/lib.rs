pub fn match_arms() {
    let x = Some(1);
    let y =false;

    match x {
        Some(3) => println!("three"),
        Some(x @ 10...20) => println!("between ten and twenty: {}", x),
        Some(x@1) | Some(x@2) => println!("one or two: {}", x),
        Some(12) | Some(13) | Some(14) if y => println!("foobar"),
        Some(x) if x < 30 && x > 40 => println!("between 31 and 39: {}", x),
        Some(_) => println!("x"),
        None => println!("None"),
    };
}

pub fn if_let() {
    let favorite_color: Option<&str> = None;
    let is_tuesday = false;
    let age: Result<u8, _> = "34".parse();

    if let Some(color) = favorite_color {
        println!("Using your favorite color, {}, as the background", color);
    } else if is_tuesday {
        println!("Tuesday is green day!");
    } else if let Ok(age) = age {
        if age > 30 {
            println!("Using purple as the background color");
        } else {
            println!("Using orange as the background color");
        }
    } else {
        println!("Using blue as the background color");
    }
}

pub fn while_let() {
    let mut stack = Vec::new();
    stack.push(1);
    stack.push(2);
    stack.push(3);

    while let Some(top) = stack.pop() {
        println!("{}", top);
    }
}

pub fn for_loops() {
    let v = vec!['a', 'b', 'c'];

    // enumerate adapts an iterator to be a tuple (ind, val)
    for (index, value) in v.iter().enumerate() {
        println!("{} is at index {}", value, index);
    }
}

pub fn let_statements() {
    let _x = 5;
    let (_x, _y, _z) = (1, 2, 3);
}

pub fn fnc_params(&(x, y): &(i32, i32)) {
    println!("Current location: ({}, {})", x, y);
}

pub fn destructuring_struct() {
    struct Point { x:i32, y:i32 }
    {
        let p = Point { x: 0, y: 7 };

        let Point {x: a, y: b} = p;
        assert_eq!(0, a);
        assert_eq!(7, b);
    }
    {
        let p = Point { x: 0, y: 7 };

        let Point {x, y} = p;
        assert_eq!(0, x);
        assert_eq!(7, y);
    }
    {
        let p = Point { x: 0, y: 7 };

        match p {
            Point { x, y: 0 } => println!("On the x axis at {}", x),
            Point {x: 0, y} => println!("On the y axis at {}", y),
            Point {x, y} => println!("On neither axis at ({}, {})", x, y),
        }
    }
}

pub fn destructuring_enum() {
    enum Message {
        Quit,
        Move {x: i32, y: i32},
        Write(String),
        ChangeColor(Color),
    }
    enum Color {
        Rgb(i32, i32, i32),
        Hsv(i32, i32, i32),
    }

    let msg = Message::ChangeColor ( Color::Hsv(0, 160, 255) );

    match msg {
        Message::Quit => {
            println!("The Quit variant has no data to destructure.")
        },
        Message::Move { x, y } => {
            println!(
                "Move in the x direction {} and in the y direction {}",
                x, y)
        },
        Message::Write(text) => println!("Test message: {}", text),
        Message::ChangeColor(Color::Rgb(r, g, b)) => {
            println!("Change the color to red {}, green {}, and blue {}",
                     r, g, b)
        },
        Message::ChangeColor(Color::Hsv(h, s, v)) => {
            println!("Change the color to hue {}, saturation {}, and value {}",
                     h, s, v)
        },
    };
}

pub fn destructuring_reference() {
    #[derive(Debug)]
    struct Point { x: i32, y: i32 }
    let points = vec![
        Point {x: 0, y: 0 },
        Point {x: 1, y: 5 },
        Point {x: 10, y: -3 },
    ];

    let sum_of_squares = points.iter()
        .map(|&Point {x, y}| (x*x, y*y))
        .fold((0, 0), |(acc_x, acc_y), (x, y)| (acc_x + x, acc_y + y));

//    for val in sum_of_squares.clone() {
//        println!("val: {:?}", val);
//    }
    println!("sum_of_squares: {:#?}", sum_of_squares);
}


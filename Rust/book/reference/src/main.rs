#[allow(unused_variables)]

fn main() {
    println!("Hello, world!");

    let mut s = String::from("foo");
    display(&s);
    change(&mut s);
    display(&s);

    {
        let r1: &mut String = &mut s;
        // let r2 = &mut s;
        // can't have a second mutable reference
    }
    {
        let r1: &String = &s;
        let r2: &String = &s;
        // let r3 = &mut s;
        // can't have a mutable reference when there are immutable references
    }
    {
        let r1 = &mut s;
        change(r1);
        display(&s);
    }
    {
        let r1 = &s;
        display(r1);
        // change(&mut s);
        // s.push_str("bar");
        // can't burrow mutable reference
        display(r1);
    }
}


fn display(s: &String)
{
    println!("{}", s);
}

fn change(s: &mut String)
{
    s.push_str(&format!(" {}", s));
}

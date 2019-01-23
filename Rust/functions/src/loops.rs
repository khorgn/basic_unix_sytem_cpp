pub fn loops()
{
    // ===== loop ===== //
    loop
    {
        if false
        {
            break;
        }
        else
        {
            continue;
        }
    }

    let mut counter = 0;
    let result = loop
    {
        counter +=1;
        if counter == 10
        {
            break counter*2;
        }
    };

    // ===== while ===== //
    let a: i32 = 0;
    while a > 5
    {

    }

    // ===== for ===== //
    for i in (1..5)
    {

    }
    let tab = [10, 20, 30];
    for element in tab.iter()
    {
        println!("the value is: {}", element);
    }

    // ===== assertion ===== //
    assert_eq!(result, 20);
}


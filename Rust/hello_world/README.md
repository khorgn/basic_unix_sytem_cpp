# scalar types

## integer types
i8, u8, i16, u16, i32, u32, i64, u64, i128, u128  
isize, usize: size depends on the architecture, 32 or 64

## number literals
decimal: 98_222  
hexa: 0xff  
octal: 0o77  
binary: 0b1111_0000  
byte (u8 only): b'A'  

98u8 is a number of type u8

## floating-point types
f32, f64  

## boolean
bool
values: true, false

## character type
char: unicode  
ex: let c = '😻';  

## string literals
let s = "aaa";  
not the same as the String type  

# compound types

## type type
fixed length, can mix types

let tup: (i32, i64, bool) = (500, 6.4, false);  
let tup = (500, 6.4, false);  
let (x, y, z) = tup;  
let v = tup.0;  

## array type
fixed length, cannot mix types

let a = [1, 2, 3];  
let months: [String, 7] = ["Monday", "Thusday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];  
let mon = months[0];

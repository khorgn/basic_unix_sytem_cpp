# Comments
* `;` single line comment
  by convention `;` is used when the line starts with code, `;;` when the full line is a comment, and `;;;` for headings`
* `#;` S-expression comment, the full S-expression starting on the following line will be commented
* `#| ... |#` multi-lines comment
  These can be nested, so `#| ... #| ... |# ... |#` will have the whole snippet commented out

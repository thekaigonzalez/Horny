# HORNY - A Programming Language for gods.

Horny is a stack-based programming language designed to be fast, lightweight, and easy to use.

A basic horny program looks like:

```
('hello, world!') !
```

Essentially, the parameters are called before the function name. Which means you could do something like:

```
(1, 2) +
```

Where the parameters are encased in "()" and the action is executed after the arguments are defined.

## So, where's the stack?

Great question jimmy. To access the stack, use the "*" operator.

If you want to get the last entry in the stack, the star is your friend to leverage all of the stack-based features.

To add two numbers, use the "+" operator.
```
(1,2) +
```

But, where's the output?

My friend, it's in the stack!

To access it, print "*"

```
(*) !
```

The "*" is replaced with the last member of the stack at runtime.

Full code:

```
(1,2) +
(*) !
```

Your output would be: `3`

# Comments

So.. you want to learn how to comment? I gotchu!

Basically, just use ;.

```
; My comment ;

(69,420) +
```

This also allows long comments.

```
;

Long
A**
Comment!
;
```
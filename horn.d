import std.stdio;
import std.string;
import std.conv;
import std.file : read;
void horny_execute_chunk(string chunk) {
  int state
    = 7;
  string[] arguments;
  string[] stack;
  string buffer = "";
  int ps = 0;
  foreach (char s; chunk) {
    if (s == '\'' && (state == 7 || state == 10) ) {
      ps = state;
      state = 9;
    } 

    else if (s == '\'' && state == 9) { state = ps; }

    else if (s == '!' && state == 7) {
      if (arguments.length == 0 && buffer.length > 0) {
        // try to fill in a missing argument
        arguments ~= strip(buffer);
      }
      writeln(arguments[0]);
      buffer = "";
      state = 7;
      arguments = [];
    } else if (s == '@' && state == 7) {
      stack ~= arguments[0];
      buffer = "";
      arguments = [];
    } else if (s == '+' && state == 7) {
      stack ~= to!string(to!int(arguments[0]) + to!int(arguments[1]));
      buffer = "";
      arguments = [];
    } else if (s == ';' && state == 7) {
      state = 0;
    } else if (s == ';' && state == 0) {
      state = 7;
      buffer = "";
    } else if (s == '*' && (state != 9 && state > 1)) {
      buffer ~= stack[stack.length-1];
    } else if (s == '(' && state == 7) {
      state = 10;
      buffer = "";
    } else if (s == ',' && state == 10) {
      arguments ~= strip(buffer);
      buffer = "";
    } else if (s == ')' && state == 10) {
      state = 7;
      if (buffer.length > 0) arguments ~= strip(buffer);
    }
    else {
      buffer ~= s;
    }
  }
}

void main(string[] args) {
  if (args.length == 1) {
    writeln("Horny REPL (C) Kai Daniel Gonzalez");
    while (true) {
      horny_execute_chunk(readln());
    }
  } 
  else
    horny_execute_chunk(to!string(read(args[1])));
}

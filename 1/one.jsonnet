// Read our input data
//local input = importstr 'input.txt';
local input = importstr 'example_input.txt';

// Array-ify our input
local data = std.split(input, '\n');

// Rid of empty lines
// Force strings into integers <-- this is was really bit me
local cleaned_data = [std.parseInt(x) for x in data if std.prune(x) != ''];

local addNumber(number) = function(x) number + x;

local foo(i, v) = (
  if i == 0 then 0 else if cleaned_data[i] > cleaned_data[i - 1] then 1 else 0
);

local baz(i, v) = (
  if i == 0 then null else if cleaned_data[i] > cleaned_data[i - 1] then 1 else null
);

local bar = std.mapWithIndex(foo, cleaned_data);

local charlie = std.prune(std.mapWithIndex(baz, cleaned_data));

{
  input_lines: std.length(data),
  clean_lines: std.length(cleaned_data),
  bar_count: std.length(bar),
  charlie_count: std.length(charlie),
  fold_result: std.foldl(function(x, y) (x + y), bar, 0),
}

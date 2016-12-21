# DISTRIBUTION TEST

This is a simple program get sentinels data from Matrix and sends data to Zion

## Ruby
It uses ruby 2.3.1 at the time of writing the program with the gemset distribution

## Install

    bundle install

## Usage
    $ cd (dir)
    $ ruby ./lib/main.rb

## Gems used
The runtime dependecy for the gem is 'activesupport' for the use of parse of time for zone support.

### Test
The code is covered to the max possible with lots of specs for each file written.

You can run the spec by calling

```ruby
$ rspec .
```

## Basic Structure

- I have to write this to explain what I was actually thinking.

## TODOS

- Read Loopholes and sniffers
- Add validations on GET and POST request
- Make my screen look like Matrix
- Write now everything is Happy Path so need to add more of sad/different paths

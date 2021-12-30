# Omnicalc

The goal of this project is to get more practice with writing Ruby programs; but now, you are going to see your output in the browser rather than in Terminal.

In order to achieve this, we're going to write and execute our Ruby programs using a different technique; in the past, we used to create a file and name it whatever we wanted, write the code into the file, and then execute the code with `ruby whatever.rb` from Terminal.

Now, you are going to write your Ruby code inside specific files which already exist. You will execute the code simply by visiting a particular URL in your browser. **Your visit will trigger the execution of the Ruby code, and the output will appear in your browser window.**

## Target

Ultimately, you will build this application:

http://omnicalc-target.herokuapp.com/

It is a collection of calculators that do various things; count the number of words in a block of text, the monthly payment for a loan, etc. Over time, we may add more and more calculators if we feel like it (if you have a suggestion for a calculator you think we should add, please let me know).

## Setup

You'll find a brief Getting Started video in Canvas under Pages > Additional Videos. **Read the instructions below carefully also.**

 1. **First fork** this repo, and *then* clone **your fork** to your computer.
 1. Navigate to the folder you downloaded in Terminal.
 1. Open up the entire folder in Sublime.
 1. In Terminal,

        bundle install

 1. **If you receive an error on the `bundle install`, let me know right away.**
 1. Once that is complete,

        rails server

 1. If the server doesn't start up successfully, you probably have an old app running somewhere. Find the old window or tab and close it. Then try `rails server` from within the `omnicalc` folder again.
 1. Once the server has successfully started up, in Chrome, go to [http://localhost:3000](http://localhost:3000).
 1. If all went well, you should see the New Word Count form. **If not, let me know right away.**
 1. Type in some text and submit the form.
 1. On the results page, you will currently see just a bunch of placeholders.
 1. In Sublime, find the `/app/controllers/calculations_controller.rb` file.
 1. Locate the part of the file that looks like this:

        def word_count
          @text = params[:user_text]
          @special_word = params[:user_word]

          # ================================================================================
          # Your code goes below.
          # The text the user input is in the string @text.
          # The special word the user input is in the string @special_word.
          # ================================================================================


          @character_count_with_spaces = "Replace this string with your answer."

          @character_count_without_spaces = "Replace this string with your answer."

          @word_count = "Replace this string with your answer."

          @occurrences = "Replace this string with your answer."
        end

 1. The code between the `def word_count` and `end` is the program that gets executed. I have already written some code that retrieves the inputs from the form and places them into variables for you to use, `@text` and `@special_word`.
 1. Your job is to write code below the comments and, ultimately, store the correct values in the variables I created at the bottom of the method. For example, to solve the first part, call `.length` on the user's input, `@text`, and assign the result to `@character_count_with_spaces`.

        @character_count_with_spaces = @text.length

 1. You have to figure out how to calculate the correct value for the rest: `@character_count_without_spaces`, `@word_count`, and `@occurrences`. Don't change the names of these variables; if you do, your results won't appear in the browser in the end.
 1. Refresh the results page in your browser to re-run your code and see new output.
 1. You can write as much or as little code as it takes to produce the correct answer; create intermediate variables if you want, or do anything else that you learned about from Pine (except we don't use `puts` and `gets` for output and input anymore). It's all just the same Ruby as before.
 1. Similarly, next work on `def loan_payment` and check your output by submitting the form located at [http://localhost:3000/loan_payment/new](http://localhost:3000/loan_payment/new)
 1. Some tasks are easier, some are much harder. For example, in the Descriptive Statistics calculator, finding the mode (the number that occurs most frequently in a list of numbers) is surprisingly hard. Do your best, but don't get discouraged if you can't quite solve it.
 1. For the mode calculation, just worry about the simplest case; when there's one number that occurs most frequently, that should be shown as the mode. I won't be testing the case that there's a tie.
 1. In the `essential_ruby` repository from class, there are some comments in `8_return_values.rb` and `challenge_1.rb` that may be helpful for finding some of the formulae you'll need.
 1. Ask lots of questions!

## Regular Expressions ##

Regular expressions, or regex, are a symbolic language that can define or identify a sequence of characters. This language can then be used to test, match, or replace a given body of text. 

* By _test_ we mean it can evaluate if text is equivelent to the regex we defined. This is typically used for validation of things like email addresses, zip codes, phone numbers, and so on.

* By _match_ we mean it will evaluate parts of a body of text and return back the portion that matches our regex. We use this to parse text, grabbing the bits we want and discarding the rest.

* By _replace_ we refer to a combination of `match` and substitution. We match something, then replace the matched portion with new content, updating the original string.

#### Getting Started ####

In the examples below I will attempt to show you sample regular expressions in three line groupings. The top line represents the string we are attempting to test/match/replace. Our regular expressions will appear below it between the `/.../` characters. Finally, the output of the operation will appear on lines starting with `>`. For example:

	"Sample String"
	/SampleRegex/
	> Output

> _Note: The `>` character is just there to show you the result. It isn't part of the result itself._

You can go to [this page](http://gskinner.com/RegExr/) to try out any of these regular expression examples or make up your own. Simply copy the string we are trying to match to the big section on the bottom.

> _Note: Don't copy the string's surrounding quotes. It may break later examples._

Then, copy your regex, or retype it onto the top line.

> _Note: When copying the regex, the surrounding slashes will disappear in the testing tool._


#### Basic Structure ####

Regular expressions vary by program, platform, and language, but not by very much. In the examples I'm going to teach you, you will see almost no difference if you are using these in Unix's _sed_ command or using them in a Windows copy of _Excel_. 

A typical regex looks something like this:

	/#?[0-9A-Fa-f]{6}/

Most of you are probably looking at that and seeing:

	/ABunchOfStuffSmashedTogether/

That's where most people stop when it comes to regular expressions. They see the gibberish and say, "That's way over my head." I'm here to tell you that despite it looking complex, regex is actually extremely simple. 

Regex, like most symbolic languages, treats each character as if were a whole word. When you learn the words (and there are not many), the giant string of gibberish becomes an elegantly simple sentence. In the example above, the sentence would read in English:

> Look for an optional pound sign followed by exactly six characters that can be lowercase or capital A through F, or a digit 0 through 9.

This is a regular expression that matches a 24bit hexidecimal color value (think RGB). As you can see, writing the rules in regex was much simpler than doing so in English.

Now, lets take our example and break it apart into its components to see what each one does.

* `/.../` - The outer forward slashes donote the start and end of a regular expression. This is the format you'll see in JavaScript, ActionScript, sed, vi, sublime, and many more. VBScript in Excel often uses `"..."` instead. 
* `#?` - In this case, the \# sign means a literal pound sign. The question mark after it means that it is optional. If it's not there, that's ok too.
* `[...]` - Everything between square brackets is summed up as a single character. This enables us to say, "the next character will be…" then lay out all the rules for it inside the brackets.
* `0-9` - A number between 0 and 9, inclusive
* `A-F` - A character between capital A and capital F
* `a-f` - Lowercase is ok too
* `{6}` - Whatever the last character rule was, it applies to exactly 6 characters

That is a fairly complex regular expression. If you didn't follow along for everything, that's ok. We'll go over each rule in sequence in a moment. For now just try to understand that regex isn't made up of sorcery. Each character has a rule, and if you learn them, that's all there is to it.

#### Matching Literals ####

The simplest way to match something using Regex is to use a literal string. 

For example:

	"The quick brown fox jumps over the lazy dog."
	/quick/
	> quick
	
	"The quick brown fox jumps over the lazy dog."
	/jum/
	> jum
	
	"The quick brown fox jumps over the lazy dog."
	/moo/
	> 

When searching a string for a literal, we get back either the literal we just searched for (if found) or nothing (if not found). Normal alpha-numeric characters automatically are literals in most versions of regex. The _Perl_ programming language is one exception, but none of you are using that, so I'll just move on.

You can probably see that using regular expressions with literals isn't very helpful. It works, but it doesn't get you anything a normal _find_ wouldn't get. Still, it's important to know because we can use literals with any of the other techniques you're about to learn.

#### Optional, Zero or More, One or More ####

Wildcards are very common in search parameters. There are three types of wildcards in regex:

`?` - Optional. You've seen this before. It means that whatever character preceeded it is optional. We will match the string if it is there or not.

	"Spam"
	/p?am/
	> pam
	
	"Sam"
	/p?am/
	> am

`*` - Zero or more. This will match the string if there are 0 of the preceeding character or 5000. Any number is ok.

	"aaaaah"
	/a*h/
	> aaaaah
	
	"Booh"
	/a*h/
	> h


`+` - One or more. Just like the asterix, but we require at least one character to match.

	"aaaaah"
	/a+h/
	> aaaaah
	
	"Booh"
	/a+h/
	> 

See the subtle difference between `*` and `+`? Good!

#### Any character ####

Sometimes vagueness is a good thing. What if you want to match any character at all? In that case the `.` character is your friend. Unlike most literals, the `.` doesn't just match a period, it matches any character at all.

	'Superman'
	/.../
	> Sup
	
	`Superman`
	/S.p.r.a./
	> Superman
	
	'Supercalifragilisticexpialadocius'
	/.*/
	> Supercalifragilisticexpialadocius

In our second example I've mixed the `.` character with the `*` wildcard we learned in the last section. This regular expression matches zero or more of any character!

#### Sets ####

Ok, now we're getting to the core of regex. Remember those square brackets from our example in the beginning? Those were a set, and sets are what make regex amazing. They let us define a bunch of rules that all apply to a single character.

While we are in between brackets, all letters or special characters are interpretted as valid options for the single character that the bracket represents. For instance, if we wanted to match only even numbers we could write `[02468]`. If we wanted to match any lowercase letter we can cheat a bit and use a range like `[a-z]`. Or maybe a combination of the two like `[a-z02468]`. Lets see how they match in some examples:

	`Pennsylvania 6-5000'
	/[0-9]/
	> 6
	
	`Pennsylvania 6-5000'
	/[0-9]+/
	> 6

	`Pennsylvania 6-5000'	
	/[0-9].[0-9]+/
	> 6-5000
	
	`Pennsylvania 6-5000'
	/[A-Za-z0-9]+/
	> Pennsylvania
	
Notice how in the second example we still only match a single six despite looking for bigger numbers. Regular expressions only find the first occurance of a match (by default) and the `-` prevented our regex from extending to the 5000. In the third example we accounted for the `-` character and were able to find the whole number section. Finally in the last example note how the space after Pennsylvania ended our match.

If we want to match special characters, spaces, and the like in our brackets, we need to _escape_ them. That's a term that means, prefix it with a backslash (`\`). By prefixing those characters, we tell the regex to treat it as a literal and not use it for its special purpose. To match all of our sample string using this method, we might write something like:

	/[A-Za-z0-9\ \-]+/
	
Notice the first `\ ` has a space after it. We can even escape empty spaces! Now all of these characters are considered valid matches, and we are looking for one or more of them. 


#### Negative Sets ####

What if we wanted to match all characters except for one? That would be an enormous bracket, wouldn't it? What if there were a shortcut? Regex solves this for us as well.

Introducing the `^` character! The caret serves two purposes in regular expressions depending on whether it is inside a square bracket or not. In this section we'll just cover what happens when it is inside the brackets.

	'abcdefghijklmnopqrstuvwxyz'
	/[^g]+/
	> abcdef

By putting the caret inside the square brackets as the very first character it means that anything in those brackets does NOT match. It is the complete opposite of a normal set. Handy!

- - - - -

### Break ###

Lets take a little break and review what you've learned.

* Literals 
	* Do this by just typing the chars, and using \ to escape regex symbols you want to match. 
* Any Character
	* Use the . (dot) to match any one char.
* Sets
	* Use [...] to make a set, including ranges of characters to match like [0-9]
* Negative Sets
	* Put a ^ inside a set and it inverts: [^a-z].
* Optional Modifier
	* Put a ? after a regex symbol, character, or set and it will make that thing optionally matched.
* One or More
	* A + after a regex symbol, character, or set and it will match one-or-more of them.
* Zero or More
	* A * after a regex symbol, character, or set and it will match zero-or-more of them.
	
- - - - -

#### Beginnings and Endings ####

Sometimes you want to match something at the very beginning or very end of a string. This happens a lot when testing for validation, but also when trying to grab the first or last word with a match. There are two characters responsible for this behavior, `^` and `$`. 

Remember when I mentioned that the caret worked differently outside of a bracket? Here it is! The caret marks a search as applying only to the beginning of a string.

	"Somewhere I have never travelled, gladly beyond"
	/^Some/
	> Some
	
	"Somewhere I have never travelled, gladly beyond"
	/^travelled/
	> 

Despite _travelled_ being a valid match, it is not at the beginning of the string. Therefore this regex returns nothing.

We can test the end of the string by putting the `$` character at the end of our regular expression.

	"Somewhere I have never travelled, gladly beyond"
	/beyond$/
	> beyond
	
	"Somewhere I have never travelled, gladly beyond"
	/travelled$/
	> 

Since _travelled_ isn't at the end of the string, it doesn't match either.

You can use both of these together to test an entire string in its completion. This is very common with validation tests. Here is a simple zip-code validation example. We're almost ready to build something like this ourselves!

	/^[0-9]{5}([- \/]?[0-9]{4})?$/
	
#### This or That ####

Sometimes you need to match one thing or another. Maybe your string is valid if it ends in _.com_ or _.org_. The `|` operator will do that for you.

In this example, we want to write a regular expression that will match either strings that are all alphabetical or all numeric, but not ones that do both. See if you can pick this regex apart into its pieces and follow along.

	/^[A-Za-z]+$|^[0-9]+$/
	
Here's an example that will match either _.com_ or _.org_:

	/\.com|\.org/
	
#### Some special characters ####

You have quite a library of tools at your disposal and you can now accomplish most simple tasks with regex. This section aims to simplify some of those tasks by introducing a few special characters to make your lives easier.

`\w` - Word character. Matches any character that is alphanumeric or an underscore.

`\d` - Digit character. Matches any digit 0-9.

`\s` - Whitespace character. Matches spaces, tabs, or line breaks.

`\W` - NOT word character. Matches anything that isn't a word character.

`\D` - NOT digit character. Matches anything not a digit character.

`\S` - NOT whitespace character. Matches anything not a whitespace character.

Try tossing some of these characters into your tests and see what you can accomplish.


#### Specifying a number of characters ####

Occasionally you need an exact number of characters. In the case of zip codes, you either need 5 or 9 digits. If you need to specify the number of characters, curly braces will denote this.

`/.{4}/` - will match any 4 characters

`/\d{3|5}/` - will match any 3 or 5 digits

#### Grouping ####

The last piece of regular expressions I want to cover is grouping. By wrapping all or part of your expressions in parentheses you can match not only the entire string, but smaller portions as well. 

In a real world example from JavaScript, we have grabbed the css class names off of a button. The string we have looks like this:

	button button_2 draggable index_15

We want to get the number off of the _button_2_ portion of this string. Lets start by searching for the first occurrance of one or more digits.

	/\d+/
	> 2
	
But what if those classes might not be in that order? What if index_15 happened to be first? We need to look more carefully for the right class name.

	/button_\d+/
	> button_2
	
This gets us the right class no matter what, but we have too much information. We only want the number, not the whole word.

	/button_(\d+)/
	> button_2, 2

By wrapping part of our regular expression in parentheses, that portion is returned as an additional match. In all of our previous examples we were getting back matches that were a list with only one item. Once we start adding grouping to our regex, those lists will grow. In javascript, this list is an Array, and we can easily grab the second item from it. Your various programs may find different ways of getting at these lists.


### Further Things to Cover ###

#### Global Searches ####
	
	/.../g

#### Greedy vs Lazy Searches ####
	
`*?` - Matches 0 or more of the preceeding token. This is a lazy match, and will match as few characters as possible before satisfying the next token.

`+?` - Matches 1 or more of the preceeding token. This is a lazy match, and will match as few characters as possible before satisfying the next token.

#### Group without creating Capture Group ####

	/(?:ABC)/

#### Positive Lookahead ####

	/(?=ABC)/

#### Negative Lookahead ####

	/(?!ABC)/

#### Positive Lookbehind ####

	/(?<=ABC)/

#### Negative Lookbehind ####

	/(?<!ABC)/

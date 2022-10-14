# Challenge: Grammar Stats Method Design

## Tests

### GrammarStats #check

```ruby
1: create an instance of GrammarStats and check blank text entry
grammar = GrammarStats.new
grammar.check('') => false

2: create an instance of GrammarStats and check capital
grammar = GrammarStats.new
grammar.check('Capital') => true

3: create an instance of GrammarStats and check ending .
grammar = GrammarStats.new
grammar.check('capital.') => true

4: create an instance of GrammarStats and check ending !
grammar = GrammarStats.new
grammar.check('capital!') => true

5: create an instance of GrammarStats and check ending ?
grammar = GrammarStats.new
grammar.check('capital?') => true

6: create an instance of GrammarStats and capital and check ending
grammar = GrammarStats.new
grammar.check('Capital.') => true

7: create an instance of GrammarStats and no capital and no ending
grammar = GrammarStats.new
grammar.check('capital') => false
```

### GrammarStats #check

```ruby
1: for one .check that fails
grammar = GrammarStats.new
grammar.check('capital')
grammar.percentage_good => 0

2: for one .check that passes
grammar = GrammarStats.new
grammar.check('Capital.')
grammar.percentage_good => 100

3: for two .check that passes
grammar = GrammarStats.new
grammar.check('Capital.')
grammar.check('Capital.')
grammar.percentage_good => 100

4: for two .check one passes one fails
grammar = GrammarStats.new
grammar.check('Capital.')
grammar.check('Capital')
grammar.percentage_good => 50

5: for two .check that both fail
grammar = GrammarStats.new
grammar.check('Capital')
grammar.check('capital.')
grammar.percentage_good => 0

6: for three .check two fail one pass
grammar = GrammarStats.new
grammar.check('Capital')
grammar.check('Capital.')
grammar.check('capital.')
grammar.percentage_good => 0
```

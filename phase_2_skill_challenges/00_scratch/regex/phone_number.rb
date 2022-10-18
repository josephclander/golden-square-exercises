array = ['I need to call Robin at 3pm on 07828392810', 'call mum 07812321112 at lunch', '07128328191 call vet',
         'call at 07:15 this morning']
         
numbers = array.map { |string| string.scan(/\d{11}/).first }

p numbers

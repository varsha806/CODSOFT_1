% Define chatbot responses based on user inputs
response(hello, 'Hello! How can I help you today?').
response(hi, 'Hello! How can I help you today?').
response(how_are_you, 'I am just a bot, but I am doing great! How about you?').
response(weather, 'I am not connected to a weather service yet, but I hope it is sunny!').
response(name, 'I am a simple chatbot created to help you with basic queries.').
response(unknown, 'Sorry, I don\'t understand that.').

% Match user input to a keyword
match_keyword(Input, hello) :- sub_string(Input, _, _, _, 'hello'), !.
match_keyword(Input, hi) :- sub_string(Input, _, _, _, 'hi'), !.
match_keyword(Input, how_are_you) :- sub_string(Input, _, _, _, 'how are you'), !.
match_keyword(Input, weather) :- sub_string(Input, _, _, _, 'weather'), !.
match_keyword(Input, name) :- sub_string(Input, _, _, _, 'name'), !.
match_keyword(_, unknown).

% Start the chatbot
chatbot :-
    write('Welcome to the Prolog Chatbot!'), nl,
    write('Type your message below (type "exit" to quit):'), nl,
    chatbot_loop.

% Chatbot loop
chatbot_loop :-
    write('You: '),
    read_line_to_string(user_input, Input),
    (   Input == "exit"
    ->  write('Goodbye!'), nl
    ;   match_keyword(Input, Keyword),
        response(Keyword, Response),
        write('Bot: '), write(Response), nl,
        chatbot_loop
    ).

% Initialize chatbot on startup
:- initialization(chatbot).

% Find:
% Some free Prolog tutorials
% http://www.csc.uvic.ca/~labspg/Reference/Gprolog_Prolog_CSC212.htm
% http://jmvanel.free.fr/ai/prolog-getting-started.html

% A support forum (there are several)
% http://www.reddit.com/r/prolog

% One online reference for the Prolog version you're using
% http://www.gprolog.org/manual/gprolog.html

% Do:

% Make a simple knowledge base. Represent some of your favorite books and authors.
book('Anathem', 'Neal Stephenson').
book('Lies of Locke Lamora', 'Scott Lynch').
book('Red Seas Under Red Skies', 'Scott Lynch').

% Find all books in your knowledge base written by one author.
book(What, 'Neal Stephenson').
book(What, 'Scott Lynch').

% Make a knowledge base representing musicians and instruments. Also represent musicians and their genre of music.
musician_instrument('Brian May', guitar).
musician_instrument('Roger Taylor', drums).
musician_instrument('Freddie Mercury', vocals).
musician_instrument('John Deacon', guitar).

musician_genre('Brian May', rock).
musician_genre('Roger Taylor', rock).
musician_genre('Freddie Mercury', rock).
musician_genre('John Deacon', rock).

% Find all musicians who play the guitar.
musician_instrument(What, guitar).
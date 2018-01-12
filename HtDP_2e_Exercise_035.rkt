;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_35) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 35. Design the function string-last, which extracts the last character from a non-empty string.

;;;We use a string (data) to represent string information.        ;1. Express how you want to represent information as data. Formulate data definitions.
;String -> String                                                 ;2. A function signature tells how many inputs the function consumes, from which
                                                                  ;   classes they are drawn, and what kind of data it produces.
;measure length of strg and return only the last character        ;2. The purpose statemenet summarizes the purpose of the function and answers the
;in strg                                                          ;   question, what does the function compute? The purpose should be self-evident.
                                                                  ;   Every reader should understand it without having to read the function itself.
                                                                  ;   When formulating the purpose statement, it is often useful to employ the parameter
                                                                  ;   names to clarify what is computed.
;(define (string-last strg) "a")                                  ;2. Construct a function header, aka stub, a simplistic function with any piece of of
                                                                  ;   data from output class as function body.
;given: "string", expect: "g"                                     ;3. Construct functional examples.
;given: "batman", expect: "n"                                     ;3. Construct functional examples.
;(define (string-last strg)                                       ;4. Take inventory to understand what are the givens and what we need to compute.
;    ((...strg...))                                               ;   Replace function body in stub with function template.
(define (string-last strg)                                        ;5. Code--that is, replace function body in function template with expression that
  (substring strg (-(string-length strg) 1)))                     ;   fulfills purpose statement.

;examples were tested in interactions area                        ;6. Test examples from step 3 in the interactions area for expected results.

;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_34) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 34. Design the function string-first,
;which extracts the first character from a non-empty string.
;Don’t worry about empty strings.

;;;We use a string (data) to represent a string (information).      ;1. Formulate data definitions and express how to represent information as data.
;String -> String                                                   ;2. Signature
;takes strg and returns only the character in position 0 from strg  ;2. Purpose
;;;(define (a strg) "a")                                            ;2. Function header (aka stub), a simplistic function with any piece of
                                                                    ;   piece of data from output class as function body
;given: "string", expect: "s"                                       ;3. Construct functional example
;given: "batman", expect: "b"                                       ;3. Construct functional example
;;;(define (string-first strg)                                      ;4. Take inventory, replace function body with function template
;;;  (...strg...))
(define (string-first strg)                                         ;5. Code--that is, replace function body from template with expression that
  (substring strg 0 1))                                             ;   fulfills purpose statement

;;;examples were run in interactions area                           ;6. Test examples from step 3 in the interactions area for expected results


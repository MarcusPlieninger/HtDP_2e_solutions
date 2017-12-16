;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_23) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 23. The first 1String in "hello world" is "h". How does the following function compute this result?
(define (string-first s)
  (substring s 0 1))
;Use the stepper to confirm your ideas

(string-first "hello world")

;The application of the defined function string-first to "hello world" computes the result "h" by
;first checking if the number of arguments and parameters is the same. Then, in the function body,
;the parameter "s" is replaced with the argument "hello world." Then, DrRacket taks the substring
;of the argument from position 0 up to but not including position 1 (i.e., the first character).

;Note that DrRacket would first determine the value of the argument expressions as the very first step.
;But, this is not required here since expression is the value.
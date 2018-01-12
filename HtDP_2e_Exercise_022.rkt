;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_22) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 22. Use DrRacket’s stepper on this program fragment:

(define (distance-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))

(distance-to-origin 3 4)

;Does the explanation match your intuition? 

;My intuition is that DrRacket determines the value first of 3 squared and then 4 squared.
;DrRacket then adds 9 and 16 together.
;Then DrRacket determines the value of the square root of this sum to get 5.

;After running the stepper, I saw that I missed first steps:
;DrRacket checks that the number of arguments and the number of function parameters are the same.
;Then, it replaces all parameters by the corresponding argument values and computes the value of the body of the function.
;I got the computation steps right, but I missed the initial check of number of arguments against number of function parameters
;as well as the substitution of the latter by the former.

;From 2.2 Computing:
;"Evaluating a function application proceeds in three steps: DrRacket determines the values of the argument expressions;
;it checks that the number of arguments and the number of function parameters are the same;
;if so, DrRacket computes the value of the body of the function, with all parameters replaced by the corresponding argument values.
;This last value is the value of the function application."

;Note that DrRacket does not need to determine the values of the argument expressions here because the expressions are the values.

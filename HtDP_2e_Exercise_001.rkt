;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 1.
;Add the following definitions for x and y to DrRacket’s definitions area:
;(define x 3)
;(define y 4)
;Now imagine that x and y are the coordinates of a Cartesian point. Write down an expression that computes the distance of this point to the origin, that is, a point with the coordinates (0,0).
;The expected result for these values is 5, but your expression should produce the correct result even after you change these definitions.

(define x 3)
(define y 4)

(sqrt (+ (sqr x) (sqr y)))

;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_15) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 15. Define ==>. The function consumes two Boolean values, call them sunny and friday.
;Its answer is #true if sunny is false or friday is true.
;Note Logicians call this Boolean operation implication, and they use the notation sunny ==> friday for this purpose.

(define sunny #false)
(define friday #true)

(define (==> sunny friday)
  (or (not sunny) friday))

(==> sunny friday)

;Note: Look up the definition of "implication" and any associated truth table in The Elements of Logic.
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_24) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 24. Here is the definition of ==>:

(define (==> x y)
  (or (not x) y))

;Use the stepper to determine the value of (==> #true #false). 

(==> #true #false)

;This is how I think the stepper will proceed:
;1. Substitute argument #true for parameter x in function body.
;2. Substitute argument #false for parameter y in function body.
;3. Determine value of (not #true), which evaluates to #false.
;4. Determine value of (or #false #false), which evalautes to #false.

;I verified that this is indeed how the stepper proceeds.

;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_45) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 45. Design a “virtual cat” world program that continuously moves the cat from left to right.
; Let’s call it cat-prog and let’s assume it consumes the starting position of the cat. Furthermore,
; make the cat move three pixels per clock tick. Whenever the cat disappears on the right,
; it reappears on the left. You may wish to read up on the modulo function.

(require 2htdp/image)
(require 2htdp/universe)

; Physical constants

; Graphical constants

(define CAT1 <insert cat image here>)

(define BACKGROUND (10 (image-width CAT1)) (image-height CAT1))

; data definition and interpretation

; WorldState is a Number
; interpretation a number denotes the x-coordinate of the right-most
; edge of cat, except when the cat disappears off the right edge of the canvas,
; which makes it appear again from the left edge of the canvas

; Wish List

;;render
; WorldState -> Image
; places right-most edge if the image of the cat 3 pixels from the left margin of the canvas
; (define (render 0) (CAT1))



;;tock
; WorldState -> WorldState
; adds 3 to x and moves the cat to the right, except if the cat disappears
; off the right edge of the canvas, in which case it must reappear out of the
; left edge
; (define (tock 3) 6)
; given: 0, expect: 3
; given: (/ (image-width BACKGROUND) 2), expect: (+ (/ (image-width BACKGROUND) 2) 3)
; given: (image-width BACKGROUND), expect: 0
(check-expect (tock 0) 3)
(check-expect (tock (/ (image-width BACKGROUND) 2)) (+ (/ (image-width BACKGROUND) 2) 3))
(check-expect (+ (image-width BACKGROUND) (image-width CAT2)) 0)
(define (tock ws)
  (cond
    [(number=? 0 ws) (+ ws 3)]
    [(number=? 1 (modulo (+ (image-width BACKGROUND) (image-width CAT2)) (+ ws 3)) (0))]
    [else (+ ws 3)]))

;;main

; Note that a stop-when clause is not necessary since the problem
; statement did not specify that the program should end.
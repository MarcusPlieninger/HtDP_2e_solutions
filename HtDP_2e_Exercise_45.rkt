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

(define CAT1 "insert cat pic here")

(define CAT-BUFFER 10) ;to avoid any unwanted overlapping of edges

(define Y-CAT1 (/ (+ (image-height CAT1) CAT-BUFFER) 2))

(define BACKGROUND (empty-scene (* 10 (image-width CAT1)) (+ (image-height CAT1) CAT-BUFFER)))

; data definition and interpretation

; WorldState is a Number
; interpretation a number denotes the x-coordinate of the right-most
; edge of cat, except when the cat disappears off the right edge of the canvas,
; which makes it appear again from the left edge of the canvas

; Wish List

;;render
; WorldState -> Image
; places right-most edge of cat image 3 pixels from the left margin of the canvas
; (define (render 0) (CAT1))
(check-expect (render 0) (place-image/align CAT1 0 Y-CAT1 "right" "center" BACKGROUND))
(check-expect (render (/ (image-width BACKGROUND) 2)) (place-image/align CAT1 (/ (image-width BACKGROUND) 2) Y-CAT1 "right" "center" BACKGROUND))
(define (render ws)
  (place-image/align CAT1 ws Y-CAT1 "right" "center" BACKGROUND))



;;tock
; WorldState -> WorldState
; adds 3 to x and moves the cat to the right, except if the cat disappears
; off the right edge of the canvas, in which case it must reappear out of the
; left edge;
; this is where the modulo function comes in: as long as the divisor is larger than
; the dividend, then the remainder will be the dividend
; the remainder will be 0 when the dividend and the divisor are the same
; (define (tock 3) 6)
; given: 0, expect: 3
; given: (/ (image-width BACKGROUND) 2), expect: (+ (/ (image-width BACKGROUND) 2) 3)
; given: (image-width BACKGROUND), expect: 0
(check-expect (tock 0) 3) ;test for left edge
(check-expect (tock (+ (image-width BACKGROUND) (image-width CAT1))) 3) ;test for right edge
(check-expect (tock (/ (image-width BACKGROUND) 2)) (+ (/ (image-width BACKGROUND) 2) 3)) ;test for middle
(define (tock ws)
    (modulo (+ ws 3) (+ (image-width BACKGROUND) (image-width CAT1))))
    

;;main
; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]))


; Note that a stop-when clause is not necessary since the problem
; statement did not specify that the program should end.
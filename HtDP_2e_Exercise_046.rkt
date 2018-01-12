;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_46) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 46. Improve the cat animation with a slightly different image:
; (define cat2 "insert cat2 image here")

; Adjust the rendering function from exercise 45 so that it uses one cat image
; or the other based on whether the x-coordinate is odd. Read up on odd? in the HelpDesk,
; and use a cond expression to select cat images.

(require 2htdp/image)
(require 2htdp/universe)

; Physical constants

; Graphical constants

(define CAT1 "insert CAT1 image here")

(define CAT2 "insert CAT2 image here")

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
(check-expect (render 3) (place-image/align CAT1 3 Y-CAT1 "right" "center" BACKGROUND))
(check-expect (render 100) (place-image/align CAT2 100 Y-CAT1 "right" "center" BACKGROUND))
(define (render ws)
  (cond
  [(odd? ws) (place-image/align CAT1 ws Y-CAT1 "right" "center" BACKGROUND)] ;Y-CAT1 is also valid for CAT2
  [else (place-image/align CAT2 ws Y-CAT1 "right" "center" BACKGROUND)]))

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

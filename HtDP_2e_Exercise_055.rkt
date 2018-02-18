;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_055) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 55. Take another look at show.

(define (show x)
  (cond
    [(string? x)
     (place-image ROCKET 10 (- HEIGHT CENTER) BACKG)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (place-image ROCKET
                               10 (- HEIGHT CENTER)
                               BACKG))]
    [(>= x 0)
     (place-image ROCKET 10 (- x CENTER) BACKG)]))


; It contains three instances of an expression with the approximate shape:
; (place-image ROCKET 10 (- ... CENTER) BACKG)

; This expression appears three times in the function: twice to draw a resting rocket
; and once to draw a flying rocket. Define an auxiliary function that performs this work
; and thus shorten show. Why is this a good idea? You may wish to reread Prologue: How to Program. 

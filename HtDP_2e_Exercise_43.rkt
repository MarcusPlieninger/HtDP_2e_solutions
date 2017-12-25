;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_43) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 43. Let’s work through the same problem statement with a time-based data definition:

; An AnimationState is a Number.
; interpretation the number of clock ticks since the animation started

; Like the original data definition, this one also equates the states of the world with the class of numbers.
; Its interpretation, however, explains that the number means something entirely different.
; Design the functions tock and render. Then develop a big-bang expression so that once again you get an animation
; of a car traveling from left to right across the world’s canvas.

; How do you think this program relates to animate from Prologue: How to Program?
; The tick-expr function is called on the current state of the world every time the clock ticks. The result becomes
; the current world. The tick-expr function simply returns the number of clock ticks.
; The number of clock ticks is then used to compute the distance travelled per clock tick,
; which is velocity multiplied by time or three pixels per clock tick.
; Since the clock ticks 28 times per second, the car will travel 84 pixels per second.
; The render function will depict the growing distance as a result of accumulating clock tics.

; Use the data definition to design a program that moves the car according to a sine wave. (Don’t try to drive like that.)

; constants duplicated from Exercise 41


; An AnimationState is a Number.
; interpretation the number of clock ticks since the animation started

; WISH LIST

; render
; AnimtationState --> Image
; places the image of the car in the background according to the accumulating number of clock ticks
; (define (render as) <image>);
; (check-expect (render 0) (place-image/align 
; (check-expect (render 100) (place-image/align


; tock
; AnimationState --> Number
; the number of clock ticks since the animation started is returned as a number
; (define (tock as) 4)
(check-expect (tock 0) 0)
(ceck-expect (tock 100) 100)
(define (tock as)
  as)

; end?
; AnimationState --> Boolean
; ends the animation when the car is disappears off the screen

; big-bang
; AnimationState --> AnimationState
; launches the world with car just outside of the left border of the scene


(require 2htdp/image)
(require 2htdp/universe)

; design of functions tock and render


; develop a big-bang expression


; This program relates to animate from Prologue: How to Program? in the following way:


; using the data defintiion to design a program that moves the car according to a sine wave:
















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

; Use the data definition to design a program that moves the car according to a sine wave. (Don’t try to drive like that.)


; An AnimationState is a Number.
; interpretation the number of clock ticks since the animation started

; WISH LIST

; render
; AnimtationState -> Image

; AnimationState -> AnimationState

; end?
; AnimationState -> Boolean

; main


(require 2htdp/image)
(require 2htdp/universe)















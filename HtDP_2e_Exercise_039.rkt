;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_39) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 39. Good programmers ensure that an image such as CAR can be enlarged
;or reduced via a single change to a constant definition. Good programmers establish
;a single point of control for all aspects of their programs, not just the graphical
;constants. Several chapters deal with this issue. We started the development of our
;car image with a single plain definition:
;(define WHEEL-RADIUS 5)

;The definition of WHEEL-DISTANCE is based on the wheel’s radius. Hence, changing
;WHEEL-RADIUS from 5 to 10 doubles the size of the car image. This kind of program
;organization is dubbed single point of control, and good design employs this idea as
;much as possible.

;Develop your favorite image of an automobile so that WHEEL-RADIUS remains the single
;point of control.

;MP: In other words, physical constants will be used to build graphical constants.

;Question: Does developing this image entail working with computed global constants
;based on WHEEL-RADIUS? Or, is it more useful to think about this as composing a
;function? After all, the car image itself is a constant in the world program.
;Therefore, I will build this image as an agglomeration of computed constants.

;Another question: Describe the difference between a function and a computed constant
;(e.g., one whose value is the result of an expresssion with a literal constant).


;[see Section 3.4 From Functions to Programs]
;I am not using a wish list here because the entire image will serve as a constant.
;Therefore, a wish list to understand what auxiliary functions are necessary would
;not be appropriate. However, it is possible to speak of "auxiliary constants" here.
;So, in that sense, a complex constant is analagous to composing a function (i.e.
;a whole systematically made up of parts.)

(require 2htdp/image)

;Physical constants supplied in text
(define WHEEL-RADIUS 10)                    ;this is the single point of control
(define WHEEL-DISTANCE (* WHEEL-RADIUS 2))  

;Graphical constants supplied in text (partly)
(define WHEEL                                                         
  (circle WHEEL-RADIUS "solid" "black"))    
(define SPACE                             
  (rectangle WHEEL-DISTANCE (/ WHEEL-RADIUS 8) "solid" "white")) ;divided by 8 to make bottom more flush
(define BOTH-WHEELS                       
  (beside WHEEL SPACE WHEEL))

;Additional graphical (computed) constants

;This builds the chassis
(define CHASSIS
  (above
   (rectangle (* WHEEL-DISTANCE 2) WHEEL-RADIUS "solid" "red")
   (rectangle (* WHEEL-DISTANCE 4) (* WHEEL-RADIUS 2) "solid" "red")))

;This puts it all together
 ;(define CAR
  (overlay/align/offset "middle" "bottom"
   BOTH-WHEELS
   0 (* WHEEL-RADIUS -1)
   CHASSIS);)




   

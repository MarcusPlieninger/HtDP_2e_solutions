;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercse_44) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 44. Formulate the examples as BSL tests. Click RUN and watch them fail.

;Sample Problem
; Design a program that moves a car across the world canvas, from left to right,
;at the rate of three pixels per clock tick. If the mouse is clicked anywhere on the canvas,
;the car is placed at the x-coordinate of that click.
;
;When we are confronted with a modified problem, we use the design process to guide us to the
;necessary changes. If used properly, this process naturally determines what we need to add to our
;existing program to cope with the expansion of the problem statement. So here we go:
;There are no new properties, meaning we do not need new constants.

; "PHYSICAL" CONSTANTS

(require 2htdp/image)
(require 2htdp/universe)

(define WHEEL-RADIUS 10)                    ;this is the single point of control
(define WHEEL-DISTANCE (* WHEEL-RADIUS 2))
(define Y-CAR (* WHEEL-RADIUS 3))
(define ROAD-LENGTH (* 7 (* WHEEL-RADIUS 8)))
(define SCENE-HEIGHT (* WHEEL-RADIUS 5))


; GRAPHICAL CONSTANTS


(define WHEEL                                                         
  (circle WHEEL-RADIUS "solid" "black"))    
(define SPACE                             
  (rectangle WHEEL-DISTANCE (/ WHEEL-RADIUS 8) "solid" "white")) ;divided by 8 to make bottom more flush
;Note: I need to read up on a potentially better way of doing this since I don't know why I needed to do this.
(define BOTH-WHEELS                       
  (beside WHEEL SPACE WHEEL))

(define CHASSIS
  (above
   (rectangle (* WHEEL-DISTANCE 2) WHEEL-RADIUS "solid" "red")
   (rectangle (* WHEEL-DISTANCE 4) (* WHEEL-RADIUS 2) "solid" "red")))

; CAR is a computed constant comprised of WHEEL and CHASSIS
(define CAR
  (overlay/align/offset "middle" "bottom"
                        BOTH-WHEELS
                        0 (* WHEEL-RADIUS -1)
                        CHASSIS))
(define BACKGROUND
  (empty-scene ROAD-LENGTH SCENE-HEIGHT))

(define TREE
  (underlay/xy (circle WHEEL-RADIUS "solid" "green")
               (- WHEEL-RADIUS 1) (* WHEEL-RADIUS 1.5)
               (rectangle (/ WHEEL-RADIUS 5) (* WHEEL-RADIUS 2) "solid" "brown")))

(define BACKGROUND-TREE
  (place-image TREE (* .75 ROAD-LENGTH) (- SCENE-HEIGHT (/ (image-height TREE) 2)) BACKGROUND))

;The program is still concerned with just one property that changes over time, the x-coordinate
;of the car. Hence, the data representation suffices.

;;;;;

; A WorldState is a Number.
; interpretation: the number of pixels denotes the x-coordinate of the rightmost
; edge of the car

;;;;;

;The revised problem statement calls for a mouse-event handler, without giving up on the
;clock-based movement of the car. Hence, we state an appropriate wish:

; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down" 
; (define (hyper x-position-of-car x-mouse y-mouse me)
;      x-position-of-car)

; (define (main ws)
;    (big-bang ws
;      [on-tick tock]
;      [on-mouse hyper]
;      [to-draw render]))

; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down" 
; given: 21 10 20 "enter"
; wanted: 21
; given: 42 10 20 "button-down"
; wanted: 10
; given: 42 10 20 "move"
; wanted: 42
; (define (hyper x-position-of-car x-mouse y-mouse me)
;   x-position-of-car)



; WISH LIST

;;;render  
; WorldState --> Image
; places the image of the car in the BACKGROUND 
; according to the given world state
(check-expect (render 0) (place-image CAR 0 Y-CAR BACKGROUND-TREE)) ;test for car-image at ws 0, which should result
                                                                    ;in half of car peaking out from left side of screen
(check-expect (render 50) (place-image CAR 50 Y-CAR BACKGROUND-TREE))
(check-expect (render 200) (place-image CAR 200 Y-CAR BACKGROUND-TREE))
(check-expect (render ROAD-LENGTH) (place-image CAR ROAD-LENGTH Y-CAR BACKGROUND-TREE)) ;test for car-image at ws ROAD-LENGTH, which should
                                                                                        ;result in half of car peaking out from right side of screen
(check-expect (render (+ ROAD-LENGTH (* 2 WHEEL-DISTANCE))) (place-image CAR (+ ROAD-LENGTH (* 2 WHEEL-DISTANCE)) Y-CAR BACKGROUND-TREE)) ;test for end state

(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND-TREE))

;    BACKGROUND)

;;;clock-tick-handler
; WorldState --> WorldState
; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(define (tock ws)
  (+ ws 3)) ; I noticed that when the car is moved by 20 pixels for every clock tick, the end state
            ; is different: The car still protrudes from the right screen and does not disappear. Why?

;;;end?
; WorldState --> Boolean
; ends the world when CAR has travelled ROAD-LENGTH
(check-expect (last-world? 0) false);testing the extreme
(check-expect (last-world? (/ ROAD-LENGTH 2)) false);testing a middle point in terms of physical constant
(check-expect (last-world? (+ ROAD-LENGTH (* 2 WHEEL-DISTANCE) 5)) true);testing for desired outcome in terms of physical constants
(define (last-world? ws)
 (> (tock ws) (+ ROAD-LENGTH (* 2 WHEEL-DISTANCE) 5)))

; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down" 

; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down" 
; given: 21 10 20 "enter"
; wanted: 21
(check-expect (hyper 21 10 20 "enter") 21)
; given: 42 10 20 "button-down"
; wanted: 10
(check-expect (hyper 42 10 20  "button-down") 10)
; given: 42 10 20 "move"
(check-expect (hyper 42 10 20 "move") 42)
; wanted: 42
; (define (hyper x-position-of-car x-mouse y-mouse me)
;   x-position-of-car)
; this definition gets replaced by the one below since
; cond is needed to define output for different inputs:

(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

 (define (main ws)
     (big-bang ws
      [on-tick tock]
      [on-mouse hyper]
      [to-draw render]))

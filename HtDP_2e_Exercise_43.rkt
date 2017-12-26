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


(require 2htdp/image)
(require 2htdp/universe)

; "PHYSICAL" CONSTANTS

(define WHEEL-RADIUS 10)                    ;this is the single point of control
(define WHEEL-DISTANCE (* WHEEL-RADIUS 2))
(define Y-CAR (* WHEEL-RADIUS 3))
(define ROAD-LENGTH (* 7 (* WHEEL-RADIUS 8)))
(define SCENE-HEIGHT (* WHEEL-RADIUS 5))
(define SPEED 3)                            ;this sets the speed in pixels per clock tick


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

; An AnimationState is a Number.
; interpretation the number of clock ticks since the animation started

; WISH LIST

;;;;render
; AnimationState --> Image
; places the image of the car in the background according to the accumulating number of clock ticks
; (define (render as) <image>);
(check-expect (render 0) (place-image/align CAR (distance 0) Y-CAR "right" "center" BACKGROUND-TREE))
(check-expect (render 100) (place-image/align CAR (distance 100) Y-CAR "right" "center" BACKGROUND-TREE))
(define (render as)
  (place-image/align CAR (distance as) Y-CAR "right" "center" BACKGROUND-TREE))

;;;distance function definition for use by render
; Number --> Number
; takes the number of clock ticks and multiplies it by number of pixels travelled per clock tick
; distance = time * speed
; (define (distance as) 10)
(check-expect (distance 4) 12)
(check-expect (distance 100) 300)
(define (distance as)
  (* SPEED as))

;;;tock
; AnimationState --> Number
; advance the number of clock ticks by one
; (define (tock as) 4)
(check-expect (tock 0) 1)
(check-expect (tock 100) 101)
(define (tock as)
  (+ as 1))

;;;end?
; AnimationState --> Boolean
; ends the world when CAR has travelled ROAD-LENGTH, disappearing off the right side of the screen
(check-expect (last-world? 0) false);testing the extreme
(check-expect (last-world? (/ (/ ROAD-LENGTH 2) SPEED)) false);testing a middle point in terms of physical constant
(check-expect (last-world? (+ ROAD-LENGTH (* 4 WHEEL-DISTANCE))) true);testing for desired outcome in terms of physical constants
(define (last-world? as)
 (> (distance as) (+ ROAD-LENGTH (* 4 WHEEL-DISTANCE))))

  
;;;big-bang
; AnimationState --> WorldState
; launches the world with car on left side of background
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [stop-when last-world?]))






; This program relates to animate from Prologue: How to Program? in the following way:


; using the data defintiion to design a program that moves the car according to a sine wave:
















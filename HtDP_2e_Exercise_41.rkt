;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_41) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 41. Finish the sample problem and get the program to run.
; That is, assuming that you have solved exercise 39, define the constants BACKGROUND and Y-CAR.
; Then assemble all the function definitions, including their tests.

; When your program runs to your satisfaction, add a tree to the scenery. We used
; (define tree
;   (underlay/xy (circle 10 "solid" "green")
;               9 15
;                (rectangle 2 20 "solid" "brown")))
;
; to create a tree-like shape.

; Also add a clause to the big-bang expression that stops the animation
; when the car has disappeared on the right side.

(require 2htdp/universe)
(require 2htdp/image)

; "PHYSICAL" CONSTANTS

(define WHEEL-RADIUS 10)                    ;this is the single point of control
(define WHEEL-DISTANCE (* WHEEL-RADIUS 2))
(define Y-CAR (* WHEEL-RADIUS 3))


; GRAPHICAL CONSTANTS


(define WHEEL                                                         
  (circle WHEEL-RADIUS "solid" "black"))    
(define SPACE                             
  (rectangle WHEEL-DISTANCE (/ WHEEL-RADIUS 8) "solid" "white")) ;divided by 8 to make bottom more flush
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
  (empty-scene (* 7 (* WHEEL-RADIUS 8)) (* WHEEL-RADIUS 5)))

; (define TREE
;   (underlay/xy (circle 10 "solid" "green")
;                9 15
;                (rectangle 2 20 "solid" "brown")))

; A WorldState is a Number.
;; interpretation: the number of pixels between the left border of the scene
;; and the car.
; interpretation: the number of pixels between the e

; WISH LIST

;;;render  
; WorldState --> Image
; places the image of the car in the BACKGROUND 
; according to the given world state
(check-expect (render 50) (place-image CAR 50 Y-CAR BACKGROUND))
(check-expect (render 200) (place-image CAR 200 Y-CAR BACKGROUND))
(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND))

;    BACKGROUND)

;;;clock-tick-handler
; WorldState --> WorldState
; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(define (tock ws)
  (+ ws 3))

;;;main
; WorldState --> WorldState
; launches the world with car on left side of background
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]))

;;;end?
; WorldState --> Boolean
; ends the world when the car reaches right side of background
  




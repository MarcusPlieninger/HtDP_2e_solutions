;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_42) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 42. Modify the interpretation of the sample data definition
; so that a state denotes the x-coordinate of the right-most edge of the car.

; WorldState is a Number.
; interpretation a number denotes the x-coordinate of the right-most edge of the car

; The qualifier "right-most" will necessitate the use of "align" with "place-image" in
; the function definition for render, thus: "place-image/align" with the x-place set to
; "right" and the y-place remaining at the default location of "center."

; Note: According to this interpretation of the sample data definition, the car
; will now emerge from the lef side of the screen instead of starting on the right-side
; of the screen at the mid-point of the image on the x coordinate of 0.

; Accordingly, the stop-when function must be altered, as well. Otherwise, the program
; will end when the right-most edge of the car will reach the right-most x-coordinate
; on the scene, which means the car will not disappear off the screen.

; For expedience, I will duplicate code from exercise 41 and make the alterations
; as described above.

(require 2htdp/universe)
(require 2htdp/image)

; "PHYSICAL" CONSTANTS

(define WHEEL-RADIUS 10)                    ;this is the single point of control
(define WHEEL-DISTANCE (* WHEEL-RADIUS 2))
(define Y-CAR (* WHEEL-RADIUS 3))
(define CAR-LENGTH (* WHEEL-RADIUS 8))
(define ROAD-LENGTH (* 7 CAR-LENGTH))
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
; I re-wrote the code for tree given in text in terms of WHEEL-RADIUS so that
; tree scales with the point of control, WHEEL-RADIUS.

(define BACKGROUND-TREE
  (place-image TREE (* .75 ROAD-LENGTH) (- SCENE-HEIGHT (/ (image-height TREE) 2)) BACKGROUND))
; Given constant definition supplied by text, -32.5 to account for total height of TREE at 35 pixels
; and the fact that place-image calculates from center of image.
; Thus, you substract 17.5 from SCENE-HEIGHT since y axis increases
; positively as you go downward.

; A WorldState is a Number.
; interpretation: the number of pixels between the left border of the scene
; and the center of the car image.

; WISH LIST

;;;render  
; WorldState --> Image
; places the image of the car in the BACKGROUND 
; according to the given world state
(check-expect (render 0) (place-image/align CAR 0 Y-CAR "right" "center" BACKGROUND-TREE)) ;test for car-image at ws 0, which should result
                                                                    ;in half of car peaking out from left side of screen
(check-expect (render 50) (place-image/align CAR 50 Y-CAR "right" "center" BACKGROUND-TREE))
(check-expect (render 200) (place-image/align CAR 200 Y-CAR "right" "center" BACKGROUND-TREE))
(check-expect (render ROAD-LENGTH) (place-image/align CAR ROAD-LENGTH Y-CAR "right" "center" BACKGROUND-TREE)) ;test for car-image at ws ROAD-LENGTH, which should
                                                                                        ;result in half of car peaking out from right side of screen
(check-expect (render (+ ROAD-LENGTH (* 4 WHEEL-DISTANCE))) (place-image CAR (+ ROAD-LENGTH CAR-LENGTH) Y-CAR BACKGROUND-TREE)) ;test for end state

(define (render ws)
  (place-image/align CAR ws Y-CAR "right" "center" BACKGROUND-TREE))

;    BACKGROUND)

;;;clock-tick-handler
; WorldState --> WorldState
; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(define (tock ws)
  (+ ws 3))

;;;end?
; WorldState --> Boolean
; ends the world when CAR has travelled ROAD-LENGTH
(check-expect (last-world? 0) false);testing the extreme
(check-expect (last-world? (/ ROAD-LENGTH 2)) false);testing a middle point in terms of physical constant
(check-expect (last-world? (+ ROAD-LENGTH (* 2 WHEEL-DISTANCE) 5)) true);testing for desired outcome in terms of physical constants
(define (last-world? ws)
 (> (tock ws) (+ 5 ROAD-LENGTH (* CAR-LENGTH 2))))


;;;main
; WorldState --> WorldState
; launches the world with car on left side of background
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [stop-when last-world?]))






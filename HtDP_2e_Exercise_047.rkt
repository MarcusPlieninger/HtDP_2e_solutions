;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_47) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 47. Design a world program that maintains and displays a “happiness gauge.”
; Let’s call it gauge-prog, and let’s agree that the program consumes the maximum level of happiness.
; The gauge display starts with the maximum score, and with each clock tick, happiness decreases by -0.1; it never falls below 0,
; the minimum happiness score.
; Every time the down arrow key is pressed, happiness increases by 1/5; every time the up arrow is pressed, happiness jumps by 1/3.

; To show the level of happiness, we use a scene with a solid, red rectangle with a black frame.
; For a happiness level of 0, the red bar should be gone; for the maximum happiness level of 100, the bar should go all the way across the scene.

; Note: When you know enough, we will explain how to combine the gauge program with the solution of exercise 45.
; Then we will be able to help the cat because as long as you ignore it, it becomes less happy.
; If you pet the cat, it becomes happier. If you feed the cat, it becomes much, much happier.
; So you can see why you want to know a lot more about designing world programs than these first three chapters can tell you.

(require 2htdp/image)
(require 2htdp/universe)

; Physical Constants

; Graphical Constants

(define BACKGROUND (empty-scene 100 20))

; data definition and interpretation

; HappinessState is a number.
; INTERPRETATION a number denotes the level of happiness, from 1 to 100.

; The program consumes the maximum level of happiness, 100.

; WISH LIST

;;tock
; HapinessState -> HappinessState
; reduces the happiness gauge by -.1 for every clock tick, but it never falls below zero
; given 100, expect 99.9
; given 50, expect 49.9
; given 0, expect 0
(check-expect (tock 100) 99.9)
(check-expect (tock 50) 49.9)
(check-expect (tock 0) 0)

(define (tock hs)
  (cond
    [(> hs 0) (- hs .1)]
    [else 0]))


;;keystroke
; HappinessState String -> HappinessState
; Every time the down arrow key is pressed, current happiness increases by 1/5.
; Every time the up arrow is pressed, current happiness jumps by 1/3.
; given
; given 100 and down arrow, expect 100
; given 50 and down arrow, expect 60
; given 0 and down arrow, expect 0
; given 100 and up arrow, expect 100
; given 30 and up arrow, expect 40
; given 0 and up arrow, expect 0
(check-expect (pet 100 "down") 100)
(check-expect (pet 50 "down") 60)
(check-expect (pet 0 "down") 0)
(check-expect (pet 100 "up") 100)
(check-expect (pet 30 "up") 40)
(check-expect (pet 0 "up") 0)

(define (pet hs ke)
  (cond
    [(= hs 100) 100]
    [(= hs 0) 0]
    [else (cond
    [(string=? ke "down") (+ hs (/ hs 5))]
    [(string=? ke "up") (+ hs (/ hs 3))])]))

;;render
; HappinessState -> Image
; depicts current level of happiness on the happiness gauge
(check-expect (render 0) (place-image/align (rectangle 0 20 "solid" "red") 0 0 "left" "top" BACKGROUND)) 
(check-expect (render 50) (place-image/align (rectangle 50 20 "solid" "red") 0 0 "left" "top" BACKGROUND)) 
(check-expect (render 100) (place-image/align (rectangle 100 20 "solid" "red") 0 0 "left" "top" BACKGROUND))

(define (render hs)
  (place-image/align (rectangle hs 20 "solid" "red") 0 0 "left" "top" BACKGROUND))

;;stop-when
; HappinessState -> End of Program
; ends the program when happinesss level is at 0
;(define stop-when (= hs 0))

;;main
; HappinessState -> HappinessState
; launches program from initial HappinessState of 100

(define (gauge-prog hs)
  (big-bang 100
    [on-tick tock]
    [on-draw render]
    [on-key pet]
    [stop-when zero?])) ;add a stop-when clause because 0 is death of happiness, can't come back from it

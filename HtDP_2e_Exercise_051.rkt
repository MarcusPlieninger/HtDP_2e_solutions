;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_051) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 51. Design a big-bang program that simulates a traffic light for a given duration.
; The program renders the state of a traffic light as a solid circle of the appropriate color,
; and it changes state on every clock tick. What is the most appropriate initial state?
; Ask your engineering friends.

; From my own thinking on the quesiton, the most appropriate initial state is a red light.
; A red light is analogous to an off switch. A green light is like an on switch. A yellow
; light is like a warning light that the switch will be turned off again. Off is a good
; default state, for electricity as well as for traffic. Therefore, I am going wiht red as
; the initial state.

; TrafficLightState is a number.
; INTERPRETATION a number denotes the state of a traffic light

; copied this from Exercise 50
; TrafficLight -> TrafficLight 
; yields the next state given current state s
; (check-expect (traffic-light-next "red") "green")
; (check-expect (traffic-light-next "green") "yellow") ; added this test
; (check-expect (traffic-light-next "yellow") "red") ; added this test
; (define (traffic-light-next s)
;   (cond
    ; [(string=? "red" s) "green"]
    ; [(string=? "green" s) "yellow"]
    ; [(string=? "yellow" s) "red"]))

; The strings above must be replaced by graphical constants.
; In addition, to have one point of control, it is necessary to define a physical constant,
; namely the radius of the traffic light. This will be incorporated into the graphical constants.

(require 2htdp/image)
(require 2htdp/universe)

; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; The data definition is an enumeration.

; Physical constant

(define TrafficLightRadius 10)

; Graphical constants (i.e., the lights)

(define RedLight (circle TrafficLightRadius "solid" "red"))
(define YellowLight (circle TrafficLightRadius "solid" "yellow"))
(define GreenLight (circle TrafficLightRadius "solid" "green"))

; Now the code from exercise 50 can be updated accordingly as a render function in a world program.
; Render will have to work in tandem with tock.

; WorldState -> Image
; renders the world state as an image depicting a traffic light 
(check-expect (render 0) RedLight)
(check-expect (render 1) GreenLight)
(check-expect (render 2) YellowLight)
(define (render s)
   (cond
     [(= 0 s) RedLight]
     [(= 1 s) GreenLight]
     [(= 2 s) YellowLight]))

; Note: having problem with modulo: returns error "modulo: expects an integer as 2nd argument, given #<image>"

; Now we have to think of a wish list of any additional function/s. We need a clock tick function. Hence:

; Wish List
; WorldState -> WorldState
; The clock accumlates 3 ticks before returning to initial position, i.e. 0. This well enable the render
; funcion to produce the corresponding image.
(check-expect (tock 0) 1)
(check-expect (tock 1) 2)
(check-expect (tock 2) 0)
(define (tock s)
  (modulo (+ s 1) 3))


(define (TrafficLight s)
  (big-bang 0
    [on-tick tock 2 9] ; clock ticks every 2 seconds so you can verify the lights, I'm not including a stop-when function because of limit-expr used here
    [on-draw render]))

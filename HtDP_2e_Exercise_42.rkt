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
; will now emerge from the right-side of the screen instead of starting on the right-side
; of the screen at the mid-point of the image on the x coordinate of 0.

; Accordingly, the stop-when function must be altered, as well. Otherwise, the program
; will end when the right-most edge of the car will reach the right-most x-coordinate
; on the scene, which means the car will not disappear off the screen.

; For expedience, I will duplicate code from exercise 41 and make the alterations
; as described above.


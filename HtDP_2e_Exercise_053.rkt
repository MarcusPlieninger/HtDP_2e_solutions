;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_053) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 53. The design recipe for world programs demands that you translate information into data
; and vice versa to ensure a complete understanding of the data definition. It’s best to draw some world
; scenarios and to represent them with data and, conversely, to pick some data examples
; and to draw pictures that match them. Do so for the LR definition, including at least HEIGHT and 0 as examples.

; Observation: relatively straightforward, refer to Prologue for sample scenarios.
; Scenarios: rocket at rest 0, rocket at midpoint height, rocket reaching full height HEIGHT
; Data examples; pick H slightly between rest and midpoint, pick H slightly between midpoint and full height

; Assumption: height is distance between top of canvas and reference point (i.e., center or rocket)
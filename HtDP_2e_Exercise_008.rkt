;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_8) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 8. Add the following line to the definitions area:
;(define cat )

;Create a conditional expression that computes whether the image is tall or wide.
;An image should be labeled "tall" if its height is larger than or equal to its width.
;Otherwise it is "wide". See exercise 1 for how to create such expressions in DrRacket.
;As you experiment, replace the cat with a rectangle of your choice to ensure that you know the expected answer.
;Now try the following modification. Create an expression that computes whether a picture is "tall", "wide", or "square". 

;if expression for cat image

(define cat <insert cat image>)


(if (> (image-height cat) (image-width cat))
    "tall"
    "wide")

;if expression for rectangular image of variable size

(define rec
  (rectangle 50 50 "outline" "red"))

(if (> (image-height rec) (image-width rec))
      "tall"
      (if (< (image-height rec) (image-width rec))
          "wide"
          (if (= (image-height rec) (image-width rec))
              "equal"
              "error")))

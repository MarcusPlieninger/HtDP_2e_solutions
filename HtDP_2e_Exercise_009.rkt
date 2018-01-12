;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 9. Add the following line to the definitions area of DrRacket:
;(define in ...)

;Then create an expression that converts the value of in to a positive number.
;For a String, it determines how long the String is; for an Image, it uses the area;
;for a Number, it decrements the number by 1, unless it is already 0 or negative; for #true it uses 10 and for #false 20.
;See exercise 1 for how to create expressions in DrRacket.

(define in <insert value>)

(if (and (number? in) (negative? in))
    ;(+ (* in -2) in)
    (string->number (substring (number->string in) 1 (string-length (number->string in))))
    (if (string? in)
        (string-length in)
        ( if (image? in)
             (* (image-width in) (image-height in))
             (if (and (number? in) (> in 0))
                 (- in 1)
                 (if (and (boolean? in) in)
                     10
                     20)))))

;Note that the commented out line 12 is an easier way of writing the subexpression on line 13.
;I verified that this expression produces the correct values as specified.
;I used nested if expressions.

;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_25) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 25. Take a look at this attempt to solve exercise 17:

(define (image-classify img)
  (cond
     [(>= (image-height img) (image-width img)) "tall"]
     [(= (image-height img) (image-width img)) "square"]
     [(<= (image-height img) (image-width img)) "wide"]))

;Does stepping through an application suggest a fix? 

;ANSWER:
;It depends on the particular application.
;In an application where the argument is a tall rectangle,
;no need for a fix is apparent.
;In an application where the argument is a wide rectangle,
;no need for a fix is apparent.
;In an application where the argument is a square,
;the function application evaluates to "tall." A fix is needed.

;It does suggest a fix insofar as it returns the same error message
;when the program is run, namely "read: unepxected ')'".

;When running the stepper on this function application:
(image-classify (square 20 "solid" "red"))
;it becomes apparent that >= in the first subexpression of the conditional
;is the incorrect operator since it will return "tall" even when the height
;and width are equal. The correct operator in this instance would be >. Therefore,
;((>= (image-height img) (image-width img)) "tall")
;should read
;((> (image-height img) (image-width img)) "tall")

;Finally, based on this correction, it also becomes apparent that the incorrect
;operator is used in the final subexpression of the conditional. The = in <= in
;is superfluous and incorrect here:
;((<= (image-height img) (image-width img)) "wide")
;It is superfluous because = is already used in the subexpression to evaluate
;the image's dimensions and return "square" if height and width are equal.
;It is incorrect because = cannot be used in any case because this does not
;correspond to the correct understanding of "wide," which is an image having a
;width that is greater than its height, to express the same thing in a different
;way, a height that is less than its width. Therefore, the only operator that can
;be used here is <, thus:
;((< (image-height img) (image-width img)) "wide")
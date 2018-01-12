;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_17) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 17. Define the function image-classify, which consumes an image and conditionally
;produces "tall" if the image is taller than wide, "wide" if it is wider than tall, or "square"
;if its width and height are the same. See exercise 8 for ideas.

(define (classify img)
  (if (> (image-height img) (image-width img))
      "tall"
      (if (> (image-width img) (image-height img))
          "wide"
          (if (= (image-width img) (image-height img))
          "square"
          "error"))))

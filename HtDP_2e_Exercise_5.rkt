;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 5. Use the 2htdp/image library to create the image of a simple boat or tree. Make sure you can easily change the scale of the entire image. 


;Christmas tree
(require 2htdp/image)

(define TREE-SIZE 400)

(overlay/xy    (triangle (/ TREE-SIZE 2) "solid" "seagreen")
               (/ TREE-SIZE 5) (/ TREE-SIZE 10)
               (rectangle (/ TREE-SIZE 10)(/ TREE-SIZE 2) "solid" "brown"))

;boat

(define BOAT-SIZE 100)


;mast and sail design adjusted from tree above
(above (overlay/xy    (triangle (* BOAT-SIZE 1.5) "solid" "red")
                      (* BOAT-SIZE .75) (/ BOAT-SIZE 10)
                      (rectangle (/ BOAT-SIZE 25) (* BOAT-SIZE 1.25) "solid" "brown"))
;hull
       (beside (triangle/sas (/ BOAT-SIZE 4) 90 (/ BOAT-SIZE 4) "solid" "blue")
               (rectangle (* BOAT-SIZE 1.25) (/ BOAT-SIZE 4) "solid" "blue")
               (triangle/ass 90 (/ BOAT-SIZE 4) (/ BOAT-SIZE 4) "solid" "blue")))

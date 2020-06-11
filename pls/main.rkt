#lang racket/base

(module+ test
  (require rackunit))

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html

;; Code here
(require racket/system)
(define player (find-executable-path "ffplay"))
(define (play filename)
  (system* player
           "-nodisp"
           "-autoexit"
           (path->string filename)))


(module+ test
  (check-equal? (+ 2 2) 4))

(module+ main
  (play (string->path "/home/atharva/Music/cvi.mp3")))

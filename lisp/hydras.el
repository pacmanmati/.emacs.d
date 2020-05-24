;;
;; -- hydras.el --
;; where all hydra defs go.
;;

(defhydra hydra-zoom (global-map "C-z")
  "zoom"
  ("i" text-scale-increase "in")
  ("o" text-scale-decrease "out"))

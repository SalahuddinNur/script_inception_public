(define-param geoctlfile "RCD111_1x1x1.geo.ctl")
(print "geoctlfile = " geoctlfile "\n")
(load geoctlfile)
(set-param! resolution 32)
(set-param! eps-averaging? false)
(run-until 1 (at-beginning output-epsilon))
